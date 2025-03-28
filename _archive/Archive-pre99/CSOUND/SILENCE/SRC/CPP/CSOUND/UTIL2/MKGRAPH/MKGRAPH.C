/* MKGRAPH */
/* John Fitch */
/* 8 December 1994 */
/* Revised for Watcom C Jan 1996 */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <limits.h>
#include <signal.h>
#include <graph.h>              /* Graphs for WatCom C++ for IBM-PC */

static short gdriver = 0;
static short gwidth = 0, gheight = 0;
static struct videoconfig screen;

#define SOLID_LINE (0xFFFF)
#define DOTTED_LINE (0xCCCC)

#define FALSE    (0)
#define TRUE     (1)
#define BASEOFF  (30)

float smallest_y = 0.0;
float largest_y = 1.0;
float minview = 0.0;
float maxview = 20.0;
float scale_x = 1.0;
float scale_y = 1.0;

char grid = TRUE;
int grid_size = 2;
char debugging = FALSE;
char *outfile = "newgraph";

void clearscreen(void);
char mkgraph(void);
void read_file(char *);
void write_file(void);
void write_table(void);
void do_help(void);

typedef struct graph_node {
    float x, y;
    struct graph_node* next;
} graph_node;

graph_node *env = NULL;

void my_term(int xxx)
{
    IGNORE(xxx);
        if (graphactive) {
            graphactive = 0;
            _setvideomode(_DEFAULTMODE);
        }       
        exit(1);
}

int main(int argc, char **argv)
{
    graph_node *tt;
    char change;

    gdriver = _setvideomode(_MAXRESMODE);
    if (signal(SIGABRT,my_term) == SIG_ERR ||
        signal(SIGTERM,my_term) == SIG_ERR ||
        signal(SIGFPE, my_term) == SIG_ERR ||
        signal(SIGILL, my_term) == SIG_ERR ||
        signal(SIGSEGV,my_term) == SIG_ERR ||
        signal(SIGINT, my_term) == SIG_ERR) {
                perror("Failed to set signal");
                fg_term();
                abort();
        }

    argv++;
    while (argc>1) {
        char *s = *argv;
        if (*s == '-') {
            switch (*++s) {
            case 'o':
                if (*++s == '\0') {
                    if (!(--argc) || (s = *++argv) && *s == '-') {
                        fprintf(stderr, "no outfilename in -o option\n");
                        exit(1);
                    }
                }
                outfile = s;
                break;
            case 'h':
                fprintf(stderr, "Options\n\t-o outfile\tdefine output file\n");
                fprintf(stderr, "\t-v\t\tSet trace mode (generates trace file)\n");
                exit(0);
            case 'v':
                debugging = TRUE;
                break;
            default:
                fprintf(stderr, "Unknown option -%s\n", s);
                break;
            }
        }
        else 
            read_file(*argv);
        argc--;
    }
    if (env == NULL) {
        tt = (graph_node*) malloc(sizeof(graph_node));
        tt->x = 10000.0; tt->y = 0.0; tt->next = NULL;
        env = (graph_node*) malloc(sizeof(graph_node));
        env->x = 0.0; env->y = 0.0; env->next = tt;
    }
 
    change = mkgraph();
    if (change==TRUE) {
        int c;
        fprintf(stderr, "Graph not saved.  Save now? ");
        while (change==TRUE) {
            c = getchar();
            switch (c) {
            case 'Y': case 'y':
                write_file();
                change = FALSE;
                break;
            case 'N': case 'n':
                change = FALSE;
                break;
            default:
                fprintf(stderr, "Answer Y or N. Save now? ");
                while (c != '\n') c = getchar();
            }
        }
    }
    return 0;
}

void draw_env(float minx, float maxx, float miny, float maxy)
{
    graph_node *tt = env;

    clearscreen();
    line[FG_X1] = 0; line[FG_Y1] = 0; line[FG_X2] = WIDTH; line[FG_Y2] = 0;
    fg_drawlineclip(FG_WHITE,FG_MODE_SET,~0, FG_LINE_DENSE_DOTTED,
                        line, fg_displaybox);
    if (grid==TRUE) {
        int i = (int)minx;
        if (i<0) i=0;
        for ( ; (float)i<maxx; i += grid_size) {
            line[FG_X1] = (int)(((float)i-minview) * scale_x);
            line[FG_X2] = line[FG_X1];
            line[FG_Y1] = 0; line[FG_Y2] = HEIGHT-30;
            fg_drawlineclip(FG_WHITE,FG_MODE_SET,~0, FG_LINE_SPARSE_DOTTED,
                        line, fg_displaybox);
        }
    }
    line[FG_X2] = 0; line[FG_Y2] = 0;
    while (tt != NULL) {
        line[FG_X1] = line[FG_X2]; line[FG_Y1] = line[FG_Y2];
        line[FG_X2] = (int)((tt->x-minview) * scale_x);
        line[FG_Y2] = (int)(tt->y * scale_y);
        fg_drawlineclip(FG_WHITE,FG_MODE_SET,~0, FG_LINE_SOLID,
                        line, fg_displaybox);
        tt = tt->next;
    }
}

char arrow_matrix[15] =
{
  0x06,  /*      XX  */
  0x06,  /*      XX  */
  0x8c,  /* X   XX   */
  0xcc,  /* XX  XX   */
  0xf8,  /* XXXXX    */
  0xf8,  /* XXXXX    */
  0xfc,  /* XXXXXX   */
  0xff,  /* XXXXXXXX */
  0xfe,  /* XXXXXXX  */
  0xfc,  /* XXXXXX   */
  0xf8,  /* XXXXX    */
  0xf0,  /* XXXX     */
  0xe0,  /* XXX      */
  0xc0,  /* XX       */
  0x80,  /* X        */
};

fg_msm_cursor_t arrow = {arrow_matrix,{0,0,7,14}, 0, 0};

char mkgraph(void)
{
    unsigned int status;
    unsigned int last_status = 0xffff;
    short x, y, oldx = 0xffff, oldy = 0xffff;
    char done = FALSE;
    int in_char;
    float xx, yy;
    FILE *debug;
    char changed = FALSE;

    if (debugging) debug = fopen("trace", "w");
    _setvideomode(_MAXRESMODE);
    gwidth = screen.numxpixels - 2*x_off;
    gheight = screen.numypixels - 2*y_off;
    if (screen.monitor != MONO) _setbkcolor(_BLUE);
    else                        _setbkcolor(_BLACK);
    _setcolor(_WHITE);
    _clearscreen(_GCLEANSCREEN);
    _setlinestyle(_SOLID_LINE);
    _rectangle(_GBORDER, x_off, y_off, gwidth+x_off, gheight_y_off
    if (debugging) fprintf(debug, "HEIGHT=%d, WIDTH=%d\n", HEIGHT, WIDTH);
    scale_x = (float)WIDTH/(maxview-minview);
    scale_y = (float)HEIGHT/(largest_y - smallest_y);
    if (debugging)
        fprintf(debug, "Scale_x = %f scale_y = %f\n", scale_x, scale_y);
    draw_env(minview, maxview, smallest_y, largest_y);


    do {
        char str[100];
        do {
            status = fg_msm_getstatus(&x, &y);
/*          fg_msm_setcurpos(x,y); */
            if (x != oldx || y != oldy) {
                yy = (float)y/scale_y;
                xx = (float)x/scale_x + minview;
                sprintf(str, "MKGRAPH CsTool   time:%.4f ampl:%.4f (%3d,%3d)", xx, yy, x, y);
                _settextposition(screen.numtextrows-8, 5); _outtext(string
                oldx = x; oldy = y;
            }
            
            if (status != last_status) {
                if (debugging) fprintf(debug, "%s\n", str);
                fg_flush();
                if (status & FG_MSM_RIGHT) {
                    graph_node *ss = env;
                    if (debugging) fprintf(debug, "Right mouse %d %d\n", x, y);
                    while (ss->next != NULL && ss->next->x < xx) 
                        ss = ss->next;
                    if (debugging)
                        fprintf(debug, "  (%.3f %.3f) -> (%.3f %.3f)\n",
                                ss->x, ss->y, xx, yy);
                    ss->x = xx;
                    ss->y = yy;
                    changed = TRUE;
                }
                else if (status & FG_MSM_LEFT) {
                    graph_node *tt = (graph_node*) malloc(sizeof(graph_node));
                    graph_node *ss = env;
                    while (ss->next != NULL) {
                        if (ss->next->x == xx) {
                            graph_node *uu = ss->next->next;
                            free(ss->next);
                            tt->next = uu;
                            ss->next = tt;
                            tt->x = xx;
                            tt->y = yy;
                            if (debugging)
                                fprintf(debug, "Replacing node at x=%d\n", x);
                            break;
                        }
                        if (ss->next->x > xx) {
                            tt->next = ss->next;
                            ss->next = tt;
                            tt->x = xx;
                            tt->y = yy;
                            break;
                        }
                        ss = ss->next;
                    }
                    changed = TRUE;
                }
                draw_env(minview, maxview, smallest_y, largest_y);
                fg_puts(FG_WHITE, FG_MODE_SET, ~0, FG_ROT0,
                        20, HEIGHT-BASEOFF, str, fg.displaybox);
                fg_flush();
                last_status = status;
                fg_flush();
            }
        } while(!kbhit());
        
        in_char = getch();
        if (in_char == 0)       /* Extended key, function key, whatever. */
            in_char = getch() << 8;
        if (debugging) fprintf(debug, "Character %x\n", in_char);

#define ESC    0x1b
#define F1     (0x3b << 8)
#define HOME   (0x47 << 8)
#define UP     (0x48 << 8)
#define PGUP   (0x49 << 8)
#define LEFT   (0x4b << 8)
#define RIGHT  (0x4d << 8)
#define DOWN   (0x50 << 8)
#define PGDN   (0x51 << 8)
#define F1ALT  (0x68 << 8)

        switch (in_char) {
        case ESC:
            done = 1;
            write_file();
            changed = FALSE;
            break;
        case HOME:
            break;
        case UP:
            largest_y *= 0.5;
            scale_y = (float)HEIGHT/(largest_y - smallest_y);
            break;
        case DOWN:    /* Lower numbers mean faster mouse. */
            largest_y *= 2.0;
            scale_y = (float)HEIGHT/(largest_y - smallest_y);
            break;
        case RIGHT:
            maxview += (maxview-minview)*0.05;
            minview += (maxview-minview)*0.05;
            break;
        case LEFT:
            if (minview > -0.1) {
                maxview -= (maxview-minview)*0.05;
                minview -= (maxview-minview)*0.05;
            }
            else sound_beep(500);
            break;
        case PGUP:
            scale_x *= 0.5;
            maxview += (maxview - minview);
            break;
        case PGDN:
            scale_x *= 2.0;
            maxview -= (maxview - minview)*0.5;
            break;
        case F1:
            grid_size++;
            break;
        case F1ALT:
            if (grid_size>1) grid_size--;
            break;
        case 'E': case 'e':
        case 'W': case 'w':
            write_file();
            changed = FALSE;
            break;
        case 'F': case 'f':
            write_table();
            changed = FALSE;
            break;
        case 'G': case 'g':
            grid = !grid;
            break;
        case 'H': case 'h': case '?':
            fg_term();
            do_help();
            fg_init();
            fg_msm_setcurpos(x,y);
            fg_msm_motion(0);           /* Linear */
            fg_msm_showcursor();
            fg_flush();
            fg_msm_setcursor(arrow);
            break;
        case 'Q': case 'q':
            done = 1;
            break;
        default:
            sound_beep(440);
            break;
        }
        draw_env(minview, maxview, smallest_y, largest_y);
        yy = (float)y/scale_y;
        xx = (float)x/scale_x + minview;
        sprintf(str, "MKGRAPH CsTool   time:%.4f ampl:%.4f (%3d,%3d)",
                xx, yy, x, y);
        string_box [FG_X1] = 20;
        string_box [FG_X2] = 60 * fg_box_width (fg.charbox);
        fg_fillbox(FG_BLACK, FG_MODE_SET, ~0, string_box);
        fg_puts(FG_WHITE, FG_MODE_SET, ~0, FG_ROT0,
                20, HEIGHT-BASEOFF, str, fg.displaybox);
    } while(done==FALSE);

    fg_msm_hidecursor();
    return changed;
}

void 
clearscreen(void)
{
    fg_fillbox (FG_BLACK, FG_MODE_SET, ~0, fg.displaybox);
}

void 
read_file(char *name)
{
    FILE *in = fopen(name, "r");
    float xx, yy;
    graph_node *tt, *ss = NULL;
    if (in==NULL) {
        fprintf(stderr, "Cannot open file %s\n", name);
        fg_term();
        exit(1);
    }
    while (fscanf(in, "%f %f\n", &xx, &yy) == 2) {
        tt = (graph_node *) malloc(sizeof(graph_node));
        tt->x = xx; tt->y = yy;
        tt->next = NULL;
        if (ss == NULL) env = tt;
        else ss->next = tt;
        ss = tt;
    }
    fclose(in);
}

void 
write_file()
{
    graph_node *tt = env;
    FILE* out = fopen(outfile, "w");
    if (out==NULL) {
        fprintf(stderr, "Cannot open %s file\n", outfile);
        fg_term();
        exit(1);
    }
    while (tt != NULL) {
        fprintf(out, "%.3f\t%.3f\n", tt->x, tt->y);
        tt = tt->next;
    }
    fclose(out);
}

void
write_table()
{
    FILE* out = fopen(outfile, "w");
    int size = 0;
    int i = 0;
    int twos[] = {1,2,4,8,16,32,64,128,256,512,1024,2048,4096,8192,16384};
    graph_node *tt = env;
    if (out==NULL) {
        fprintf(stderr, "Cannot open %s file\n", outfile);
        fg_term();
        exit(1);
    }
    while (tt!= NULL) size+=2, tt = tt->next;
    while (size>twos[i]) i++;
    size = twos[i];
    fprintf(out, "f 1 0 %d 7", size);
    tt = env;
    while (tt!=NULL) {
        fprintf(out, " %.0f %.0f", tt->x*100, tt->y*100);
        tt = tt->next;
        size -=2;
    }
    while (size>0) {
        fprintf(out, " 0 0");
        size -=2;
    }
    fprintf(out, "\n");
    fclose(out);
}

void do_help(void)
{
    fprintf(stderr, "MKGRAPH Controls:\n\n");
    fprintf(stderr, "Left button\tSet new point\n");
    fprintf(stderr, "Right button\tModify node to left of cursor\n\n");
    fprintf(stderr, "Keyboard controls:\n\n");
    fprintf(stderr, "Escape\t\tWrite graph file and exit\n");
    fprintf(stderr, "Home\t\tRedraw screen\n");
    fprintf(stderr, "Uparrow\t\tDecrease amplitude range displayed\n");
    fprintf(stderr, "Downarrow\tIncrease amplitude range displayed\n");
    fprintf(stderr, "Rightarrow\tMove time window right 5%% of screen\n");
    fprintf(stderr, "PageUp\t\tDisplay twice the time\n");
    fprintf(stderr, "PageDown\tDisplay half the time\n");
    fprintf(stderr, "F1\t\tCoarser grid\n");
    fprintf(stderr, "ALT+F1\t\tFiner grid\n");
    fprintf(stderr, "E,e\t\tWrite envelope file\n");
    fprintf(stderr, "F,f\t\tWrite table file\n");
    fprintf(stderr, "G,g\t\tToggle display of grid\n");
    fprintf(stderr, "H,h\t\tHelp page\n");
    fprintf(stderr, "Q,q\t\tQuit program\n");
    fprintf(stderr, "W,w\t\tWrite envelope file\n");
    fprintf(stderr, "?\t\tDisplay help page\n");
    fprintf(stderr, "\n\t\t\t\t\t....ENTER to continue");
    while (getchar()!='\n');
}

/****************************
Terminate gracefully.
****************************/
void 
terminate (void)
{
    write_file();
    exit (0);
}

