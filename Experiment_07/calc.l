%{
	#define YYSTYPE double
	#include "y.tab.h"
%}
%option noyywrap
%%
([0-9]+)|([0-9]*\.[0-9]+)	{yylval=atof(yytext); return NUM;}
\n	{return '\n';}
.	{return yytext[0];}
%%
