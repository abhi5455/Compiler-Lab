%{
	#include "y.tab.h"
%}
%option noyywrap
%%
[a-zA-Z][a-zA-Z0-9]*	{return id;}
[0-9]+(\.[0-9]+)?	{return num;}
\n			{return '\n';}
.			{return yytext[0];}
%%
