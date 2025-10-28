%{
	#include<stdio.h>
	int yylex();
	int yyerror();
%}
%token LOCAL DOMAIN
%%
start: S '\n' {printf("Valid Email Address\n"); return 0;}
S : LOCAL DOMAIN
%%

int main (){
	printf("Enter an Email Address\n");
	yyparse();
	return 0;
}

int yyerror(char *m){
	printf("Invalid Email Address!\n");
	return 0;
}