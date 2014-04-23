a [aA]
b [bB]
c [cC]
d [dD]
e [eE]
f [fF]
g [gG]
h [hH]
i [iI]
j [jJ]
k [kK]
l [lL]
m [mM]
n [nN]
o [oO]
p [pP]
q [qQ]
r [rR]
s [sS]
t [tT]
u [uU]
v [vV]
w [wW]
x [xX]
y [yY]
z [zZ]

delim 	[ \t]
ws	{delim}+
letter 	[a-zA-Z]
digit 	[0-9]
id	{letter}({letter}|{digit})*
number	{digit}+
float	{digit}+\.{digit}+ 

%{
#include "connector.h"
#include "y.tab.h"
#include <stdio.h>
#include <string.h>

int yyline = 1, yycolumn = 1;
%}

%%
\n  					{yyline++;yycolumn=1;}
{ws}				{yycolumn += yyleng;}
{number}			{yycolumn += yyleng; yylval.intval = atoi(yytext); return (ICONSTnumber);}
";"					{yycolumn += yyleng; return(SEMInumber);}
"("					{yycolumn += yyleng; return(LPARENnumber);}
"-"					{yycolumn += yyleng; return(MINUSnumber);}
"*"					{yycolumn += yyleng; return(TIMESnumber);}
","					{yycolumn += yyleng; return(COMMAnumber);}
")"					{yycolumn += yyleng; return(RPARENnumber);}
"+"					{yycolumn += yyleng; return(PLUSnumber);}
"="					{yycolumn += yyleng; return(EQnumber);}
{i}{s}				{yycolumn += yyleng; return(ISnumber);}
{d}{i}{v}				{yycolumn += yyleng; return(DIVnumber);}
{e}{n}{d}			{yycolumn += yyleng; return(ENDnumber);}
{v}{a}{r}			{yycolumn += yyleng; return(VARnumber);}
{p}{r}{i}{n}{t}		{yycolumn += yyleng; return(PRINTnumber);}
{b}{e}{g}{i}{n}		{yycolumn += yyleng; return(BEGINnumber);}
{i}{n}{t}{e}{g}{e}{r}	{yycolumn += yyleng; return(INTnumber);}
{p}{r}{o}{g}{r}{a}{m}	{yycolumn += yyleng; return(PROGRAMnumber);}
{id}					{yycolumn += yyleng; yylval.wordval = strdup(yytext); return (IDnumber);}	
.					{printf("Unknown character %s, line = %d, column = %d\n", yytext, yyline, yycolumn);yycolumn += yyleng;}
%%
