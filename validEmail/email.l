%{
	#include "email.tab.h"
%}
%option noyywrap
%%
[a-zA-Z0-9]+	{return LOCAL;}
"@gmail.com"|"@yahoo.com"|"@rit.ac.in"	{return DOMAIN;}
\n	{return '\n';}
.	{return yytext[0];}
%%