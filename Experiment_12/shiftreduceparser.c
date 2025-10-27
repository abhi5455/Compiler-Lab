#include<stdio.h>
#include<string.h>
#include<stdlib.h>

#define NUMPROD 6
#define MAXPRODLEN 10
#define MAX 50

char productions[NUMPROD][MAXPRODLEN] = {
	"E=E+E",
	"E=E-E",
	"E=E*E",
	"E=E/E",
	"E=(E)",
	"E=i",
};

char input[MAX] = {0}, stack[MAX] = {0};
int top = -1, ip_ptr = 0;

void shift(char symb);
void reduce(int prodno, char* stackpos);

int main(){
	printf("Enter the string to be parsed: ");
	scanf("%[^\n]",input);
	getchar();

	printf("\nSHIFT-REDUCE-PARSING\n");
	printf("STACK\t\tINPUT\t\tACTION\n");
	printf("-----\t\t-----\t\t------\n");

	while(input[ip_ptr] != '\0'){
		shift(input[ip_ptr++]);
		for(int j=0; j<NUMPROD; j++){
			for(int i=0; i<NUMPROD; i++){
				char* pos = strstr(stack, productions[i]+2);
				if(pos != NULL){
					reduce(i, pos);
				}
			}
		}
	}


	if(top == 0 && stack[top] == 'E')
		printf("\nInput Accepted\n");
	else
		printf("\nInput Rejected\n");

	return 0;
}

void shift(char c){
	stack[++top] = c;
	printf("%s\t%s\t\tShifted %c to stcak\n", stack, (input + ip_ptr), c);
}

void reduce(int prodno, char* stackpos){
	int len = strlen(productions[prodno] + 2);
    top-=len;
	bzero((stack+top+1), len);
	stack[++top] = productions[prodno][0];
	printf("%s\t%s\t\tReduced by the production %s\n", stack, (input + ip_ptr), productions[prodno]);
}
