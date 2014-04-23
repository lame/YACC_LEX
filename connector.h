extern int yyline;
extern int yyparse();
extern int yylex();

#ifndef MYHEADER
#define MYHEADER

typedef struct
{
   int numwords;
   char * wordfile;
} wordchunk;

#endif
