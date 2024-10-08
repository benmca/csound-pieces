#define LOWEST_ACCEPTABLE_WT FL(0.0)
#define CHANNELS 64
#define MIN_VOL_P_SIDE_LGTH FL(0.01)
#define FOUR 4
#define EIGHT 8
#define SIXTEEN 16
#define THIRTYTWO 32

typedef struct {
  MYFLT x;
  MYFLT y;
  MYFLT z;
} CART_VEC;


typedef struct {
  MYFLT azi;
  MYFLT ele;
  MYFLT length;
} ANG_VEC;


/* A struct for gain factors */
typedef struct {
  MYFLT wt1, wt2, wt3;
  MYFLT *out_ptr1, *out_ptr2, *out_ptr3;
} OUT_WTS;

/* A struct for a loudspeaker triplet or pair (set) */
typedef struct {
  int ls_nos[3];
  MYFLT ls_mx[9];
  MYFLT set_gains[3];
  MYFLT smallest_wt;
  int neg_g_am;
} LS_SET;


/* VBAP structure for FOUR loudspeaker panning*/
typedef struct {        
  OPDS      h;                  /* required header */
  MYFLT          *result1,*result2, *result3, *result4, 
                  *audio, *azi, *ele, *spread;
  MYFLT *out_array[FOUR+1];
  MYFLT beg_gains[FOUR];
  MYFLT curr_gains[FOUR];
  MYFLT end_gains[FOUR];
  MYFLT updated_gains[FOUR];
  int dim;
  LS_SET *ls_sets;
  int ls_am;
  int ls_set_am;
  CART_VEC cart_dir;
  CART_VEC spread_base;
  ANG_VEC ang_dir;
}  VBAP_FOUR;



/* VBAP structure of FOUR loudspeaker moving panning*/
typedef struct {        
  OPDS      h;                  /* required header */
  MYFLT          *result1,*result2, *result3, *result4, 
                  *audio, *dur, *spread, *field_am, 
                  *fld[VARGMAX]; /* field_am positive: point to point
				             negative: angle velocities*/
  MYFLT *out_array[FOUR+1];
  MYFLT beg_gains[FOUR];
  MYFLT end_gains[FOUR];
  MYFLT updated_gains[FOUR];
  int dim;
  LS_SET *ls_sets;
  int ls_am;
  int ls_set_am;
  CART_VEC cart_dir;
  CART_VEC spread_base;
  ANG_VEC ang_dir, prev_ang_dir, next_ang_dir;
  int point_change_interval, point_change_counter, curr_fld, next_fld; 
  MYFLT ele_vel;
}  VBAP_FOUR_MOVING;



/* VBAP structure of eight loudspeaker panning*/
typedef struct {        
  OPDS      h;                  /* required header */
  MYFLT          *result1,*result2, *result3, *result4, 
                  *result5,*result6, *result7, *result8, 
                  *audio, *azi, *ele, *spread;
  MYFLT *out_array[EIGHT+1];
  MYFLT beg_gains[EIGHT];
  MYFLT curr_gains[EIGHT];
  MYFLT end_gains[EIGHT];
  MYFLT updated_gains[EIGHT];
  int dim;
  LS_SET *ls_sets;
  int ls_am;
  int ls_set_am;
  CART_VEC cart_dir;
  CART_VEC spread_base;
  ANG_VEC ang_dir;
}  VBAP_EIGHT;



/* VBAP structure of EIGHT loudspeaker moving panning*/
typedef struct {        
  OPDS      h;                  /* required header */
  MYFLT          *result1,*result2, *result3, *result4, 
                 *result5,*result6, *result7, *result8, 
                  *audio, *dur, *spread, *field_am, 
                  *fld[VARGMAX]; /* field_am positive: point to point
				             negative: angle velocities*/
  MYFLT *out_array[EIGHT+1];
  MYFLT beg_gains[EIGHT];
  MYFLT curr_gains[EIGHT];
  MYFLT end_gains[EIGHT];
  MYFLT updated_gains[EIGHT];
  int counter;
  int upd_interval;
  int dim;
  LS_SET *ls_sets;
  int ls_am;
  int ls_set_am;
  CART_VEC cart_dir;
  CART_VEC spread_base;
  ANG_VEC ang_dir, prev_ang_dir, next_ang_dir;
  int point_change_interval, point_change_counter, curr_fld, next_fld; 
  MYFLT ele_vel;
}  VBAP_EIGHT_MOVING;



/* VBAP structure of SIXTEEN loudspeaker panning*/
typedef struct {        
  OPDS      h;                  /* required header */
  MYFLT          *result1,*result2, *result3, *result4, 
    *result5,*result6, *result7, *result8, 
    *result9,*result10, *result11, *result12, 
    *result13,*result14, *result15, *result16, 
    *audio, *azi, *ele, *spread;
  MYFLT *out_array[SIXTEEN+1];
  MYFLT beg_gains[SIXTEEN];
  MYFLT curr_gains[SIXTEEN];
  MYFLT end_gains[SIXTEEN];
  MYFLT updated_gains[SIXTEEN];
  int counter;
  int upd_interval;
  int dim;
  LS_SET *ls_sets;
  int ls_am;
  int ls_set_am;
  CART_VEC cart_dir;
  CART_VEC spread_base;
  ANG_VEC ang_dir;
}  VBAP_SIXTEEN;



/* VBAP structure of SIXTEEN loudspeaker moving panning*/
typedef struct {        
  OPDS      h;                  /* required header */
  MYFLT          *result1,*result2, *result3, *result4, 
    *result5,*result6, *result7, *result8, 
    *result9,*result10, *result11, *result12, 
    *result13,*result14, *result15, *result16, 
    *audio, *dur, *spread, *field_am, 
    *fld[VARGMAX]; /* field_am positive: point to point
		      negative: angle velocities*/
  MYFLT *out_array[SIXTEEN+1];
  MYFLT beg_gains[SIXTEEN];
  MYFLT curr_gains[SIXTEEN];
  MYFLT end_gains[SIXTEEN];
  MYFLT updated_gains[SIXTEEN];
  int counter;
  int upd_interval;
  int dim;
  LS_SET *ls_sets;
  int ls_am;
  int ls_set_am;
  CART_VEC cart_dir;
  CART_VEC spread_base;
  ANG_VEC ang_dir, prev_ang_dir, next_ang_dir;
  int point_change_interval, point_change_counter, curr_fld, next_fld; 
  MYFLT ele_vel;
}  VBAP_SIXTEEN_MOVING;

/* VBAP structure of THIRTYTWO loudspeaker panning*/
typedef struct {        
  OPDS      h;                  /* required header */
  MYFLT          *result1,*result2, *result3, *result4, 
    *result5,*result6, *result7, *result8, 
    *result9,*result10, *result11, *result12, 
    *result13,*result14, *result15, *result16, 
    *result17,*result18, *result19, *result20, 
    *result21,*result22, *result23, *result24, 
    *result25,*result26, *result27, *result28, 
    *result29,*result30, *result31, *result32, 
    *audio, *azi, *ele, *spread;
  MYFLT *out_array[THIRTYTWO+1];
  MYFLT beg_gains[THIRTYTWO];
  MYFLT curr_gains[THIRTYTWO];
  MYFLT end_gains[THIRTYTWO];
  MYFLT updated_gains[THIRTYTWO];
  int counter;
  int upd_interval;
  int dim;
  LS_SET *ls_sets;
  int ls_am;
  int ls_set_am;
  CART_VEC cart_dir;
  CART_VEC spread_base;
  ANG_VEC ang_dir;
}  VBAP_THIRTYTWO;



/* VBAP structure of THIRTYTWO loudspeaker moving panning*/
typedef struct {        
  OPDS      h;                  /* required header */
  MYFLT          *result1,*result2, *result3, *result4, 
    *result5,*result6, *result7, *result8, 
    *result9,*result10, *result11, *result12, 
    *result13,*result14, *result15, *result16, 
    *result17,*result18, *result19, *result20, 
    *result21,*result22, *result23, *result24, 
    *result25,*result26, *result27, *result28, 
    *result29,*result30, *result31, *result32, 
    *audio, *dur, *spread, *field_am, 
    *fld[VARGMAX]; /* field_am positive: point to point
		      negative: angle velocities*/
  MYFLT *out_array[THIRTYTWO+1];
  MYFLT beg_gains[THIRTYTWO];
  MYFLT curr_gains[THIRTYTWO];
  MYFLT end_gains[THIRTYTWO];
  MYFLT updated_gains[THIRTYTWO];
  int counter;
  int upd_interval;
  int dim;
  LS_SET *ls_sets;
  int ls_am;
  int ls_set_am;
  CART_VEC cart_dir;
  CART_VEC spread_base;
  ANG_VEC ang_dir, prev_ang_dir, next_ang_dir;
  int point_change_interval, point_change_counter, curr_fld, next_fld; 
  MYFLT ele_vel;
}  VBAP_THIRTYTWO_MOVING;


typedef struct {
  OPDS      h;                  /* required header */
  MYFLT      *dim, *ls_amount;
  MYFLT	    *f[64];
}  VBAP_LS_INIT;


/* A struct for a loudspeaker instance */
typedef struct { 
  CART_VEC coords;
  ANG_VEC angles;
  int channel_nbr;
} ls;

/* A struct for all loudspeakers */
typedef struct ls_triplet_chain {
  int ls_nos[3];
  MYFLT inv_mx[9];
  struct ls_triplet_chain *next;
} ls_triplet_chain;


/* functions */

void initialize( ls lss[CHANNELS]);
void angle_to_cart_II( ANG_VEC *from,  CART_VEC *to);
extern void choose_ls_triplets( ls lss[CHANNELS],
			        ls_triplet_chain **ls_triplets, 
				int ls_amount);
extern void choose_ls_tuplets( ls lss[CHANNELS],
			        ls_triplet_chain **ls_triplets,
			       int ls_amount);
int lines_intersect(int i,int j,int k,int l, ls lss[CHANNELS]);
int any_ls_inside_triangle(int a, int b, int c,ls lss[CHANNELS]);
MYFLT vec_angle(CART_VEC v1, CART_VEC v2);
void vec_mean(CART_VEC v1, CART_VEC v2, CART_VEC *v3);
MYFLT vec_prod(CART_VEC v1, CART_VEC v2);
MYFLT vec_length(CART_VEC v1);
MYFLT angle_in_base(CART_VEC vb1,CART_VEC vb2,CART_VEC vec);
void cross_prod(CART_VEC v1,CART_VEC v2, 
		CART_VEC *res) ;
void sort_angles(MYFLT angles[CHANNELS], int sorted_angles[CHANNELS],
		 int ls_amount);
extern void add_ldsp_triplet(int i, int j, int k, 
		       ls_triplet_chain **ls_triplets,
		       ls *lss);
void remove_connections_in_plane(int i,int j,int k,int l,
				   ls  lss[CHANNELS], 
				    int connections[CHANNELS][CHANNELS]);
extern void  calculate_3x3_matrixes(ls_triplet_chain *ls_triplets,
				 ls lss[CHANNELS], int ls_amount);
int calc_2D_inv_tmatrix(MYFLT azi1,MYFLT azi2, MYFLT inv_mat[4]);
extern void sort_2D_lss(ls lss[CHANNELS], int sorted_lss[CHANNELS],
			int ls_amount);

extern void cart_to_angle(CART_VEC cvec, ANG_VEC *avec);
extern void angle_to_cart(ANG_VEC avec, CART_VEC *cvec);
extern void normalize_wts(OUT_WTS *wts);


extern void vbap_FOUR_control(VBAP_FOUR *p);
extern void vbap_EIGHT_control(VBAP_EIGHT *p);
extern void vbap_SIXTEEN_control(VBAP_SIXTEEN *p);

void calc_vbap_gns(int ls_set_am, int dim, LS_SET *sets,
		   MYFLT *gains, int ls_amount,
		   CART_VEC cart_dir);
void scale_angles(ANG_VEC *avec);
void add_ldsp_triangle(int i, int j, int k, 
		       struct ls_triplet_chain **ls_triplets,
		       ls lss[CHANNELS]);
MYFLT vol_p_side_lgth(int i, int j,int k, ls  lss[CHANNELS] );

void new_spread_dir(CART_VEC *spreaddir, CART_VEC vscartdir, CART_VEC spread_base, MYFLT azi, MYFLT spread);
void new_spread_base(CART_VEC spreaddir, CART_VEC vscartdir, MYFLT spread, CART_VEC *spread_base);


/* global variables */

extern MYFLT *ls_table;


/* VBAP structure for ZAK loudspeaker panning*/
typedef struct {
  OPDS      h;                  /* required header */
  MYFLT     *numb, *ndx, *audio, *azi, *ele, *spread;
  int	    n;
  MYFLT     *out_array;
  AUXCH     auxch;
  MYFLT     *curr_gains;
  MYFLT     *beg_gains;
  MYFLT     *end_gains;
  MYFLT     *updated_gains;
  int       dim;
  LS_SET    *ls_sets;
  int       ls_am;
  int       ls_set_am;
  CART_VEC  cart_dir;
  CART_VEC  spread_base;
  ANG_VEC   ang_dir;
}  VBAP_ZAK;



/* VBAP structure of ZAK loudspeaker moving panning*/
typedef struct {        
  OPDS      h;                  /* required header */
  MYFLT     *numb, *ndx, *audio, *dur, *spread, *field_am, 
            *fld[VARGMAX]; /* field_am positive: point to point
		                       negative: angle velocities*/
  int	    n;
  MYFLT     *out_array;
  AUXCH     auxch;
  MYFLT     *curr_gains;
  MYFLT     *beg_gains;
  MYFLT     *end_gains;
  MYFLT     *updated_gains;
  int       dim;
  LS_SET    *ls_sets;
  int       ls_am;
  int       ls_set_am;
  CART_VEC  cart_dir;
  CART_VEC  spread_base;
  ANG_VEC   ang_dir, prev_ang_dir, next_ang_dir;
  int       point_change_interval, point_change_counter, curr_fld, next_fld; 
  MYFLT     ele_vel;
}  VBAP_ZAK_MOVING;




