%{
	#include "test.tab.h"
%}
%option noyywrap
%%
[a-zA-Z0-9]+	{return ALPHA;}
"@gmail.com"|"@yahoo.com"|"@rit.ac.in"	{return BETA;}
\n	{return '\n';}
.	{return yytext[0];}
%%