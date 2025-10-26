%{
	#include<stdio.h>
	#define YYSTYPE double
	int yylex();
	int yyerror();
%}

%token NUM
%left '+' '-'
%left '*' '/'
%left '(' ')'
%right UMINUS

%%
start: E '\n'	{printf("=%f\n", $1); return 0;}
E : E '+' E {$$=$1+$3;}
  | E '-' E {$$=$1-$3;}
  | E '*' E {$$=$1*$3;}
  | E '/' E {$$=$1/$3;}
  | '-' E %prec UMINUS {$$=-$2;}
  | '(' E ')' {$$=$2;}
  | NUM {$$=$1;}
  ;
%%

int main(){
	printf("Enter an Expression: ");
	yyparse();
	return 0;
}

int yyerror(char *m){
	fprintf(stderr, "%s: Invalid Expression\n", m);
}
