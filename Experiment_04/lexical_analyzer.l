%{
	#include<stdio.h>
%}
%option noyywrap
preprocessor	#.*
keyword		if|else|int|float|char|double|void|return|for|while|do|break|continue
identifier	[a-zA-Z][_a-zA-Z0-9]*
singlecomment	"//".*
multicomment	"/*"(.|"\n")*"*/"
assignment	"="|"+="|"-="|"*="|"/="|"%="
logicop		"||"|"&&"|"!"
relop		"=="|"!="|"<"|"<="|">"|">="
arithmetic	[\-+*/]
integer		[\-+][0-9]
string		\".\"
punct		[:;{}]
%%
{preprocessor}		{printf("Preprocessor: %s\n", yytext);}
{keyword}		{printf("Keyword : %s\n", yytext);}
{singlecomment}		{printf("Single Comment : %s\n", yytext);}
{multicomment}		{printf("Multiline Comment : %s\n", yytext);}
{identifier}		{printf("Identifier : %s\n", yytext);}
{integer}		{printf("Integer : %s\n", yytext);}
{arithmetic}		{printf("Arithmetic : %s\n", yytext);}
{punct}			{printf("Punctuation : %s\n", yytext);}
{string}		{printf("String : %s\n", yytext);}
{assignment}		{printf("Assignment : %s\n", yytext);}
{logicop}		{printf("Logic Operator : %s\n", yytext);}
{relop}			{printf("Relational Operator : %s\n", yytext);}
.|\n			{}	
%%
int main(int argc, char **argv){
	if(argc>1){
		FILE *fp = fopen(argv[1],"r");
		if(!fp){
			printf("Cannot open File, %s\n", argv[1]);
			return -1;
		}
		yyin=fp;
	}
	yylex();
}
	
