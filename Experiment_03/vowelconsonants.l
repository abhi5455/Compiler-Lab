%{
	#include<stdio.h>
	int vowels=0, consonants=0;
%}
%option noyywrap
%%
[aeiouAEIOU]	{vowels++;}
[a-zA-Z]	{consonants++;}
%%
int main(){
	printf("Enter the string (ctrl + D to see output)\n");
	yylex();
	printf("\nVowels: %d\n", vowels);
	printf("Consonants: %d\n", consonants);
	return 0;
}
