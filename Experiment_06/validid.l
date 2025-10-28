%{
	#include "y.tab.h"
%}
%option noyywrap
%%
[a-z_A-Z]	{return ALPHA;}
[0-9]	{return DIGIT;}
\n	{return '\n';}
.	{return yytext[0];}
%%
