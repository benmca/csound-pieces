#include <stdio.h>

main(argc,argv)
int argc;
char **argv;
{
  FILE *infile,*outfile;
  char *name;

  if (argc==2)
  {
    if (!(infile=fopen(argv[1],"r")))
     die("Can't open input file");
    name=argv[1];
  }
  else if (argc==1)
  {
    infile=stdin;
    name="";
  }
  else die("Usage:  scot <file>");
  if (!(outfile=fopen("score","w")))
   die("Can't open output file \"score\"");
  scot(infile,outfile,name);
  fclose(infile);
  fclose(outfile);
  exit(0);
}


die(s)
char *s;
{
  printf("scot: %s\n",s);
  exit(1);
}
