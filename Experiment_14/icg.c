#include<stdio.h>
#include<string.h>
#include<ctype.h>

#define VARLEN 10
#define MAXSIZE 50

char opndstack[MAXSIZE][VARLEN] = {'\0'};
char opstack[MAXSIZE] = {'\0'};
int opstktop = -1, opndstktop = -1;
char expn[MAXSIZE*5] = {'\0'};

int priority(char c){
	return (c=='+' || c=='-') ? 2 : (c=='*' || c=='/') ? 1 : c=='=' ? -1 : 0;
}

void icg_from_infix(){
	int i=0, temp_count=1;
	char tempopnd[MAXSIZE] = {'\0'};

	while(expn[i]!='\0'){
		int j=0;
		// Extract complete operand (variable/number)
		for(;isalnum(expn[i]);){
			tempopnd[j++] = expn[i++];
		}

		if(j!=0){
			strcpy(opndstack[++opndstktop], tempopnd);
			memset(tempopnd, '\0', MAXSIZE);
		}
		if(expn[i] == ' '){
			i++;
			continue;
		}
        if ((opstktop >= 0 && priority(opstack[opstktop]) < priority(expn[i])) || opstktop == 0){
			opstack[++opstktop] = expn[i];
		}
		else if(opstktop >= 0){
			printf("t%d = %s %c %s\n", temp_count, opndstack[opndstktop-1], opstack[opstktop--], opndstack[opndstktop]);
			sprintf(opndstack[--opstktop], "t%d", temp_count++);
		}
	}

	while(opstktop>=0){
		if(opstack[opstktop] != '='){
           		printf("t%d = %s %c %s\n", temp_count, opndstack[opndstktop-1], opstack[opstktop--], opndstack[opndstktop]);
                        sprintf(opndstack[--opstktop], "t%d", temp_count++);
        	}
        	else{
            		printf("%s = t%d\n", opndstack[opndstktop-1], temp_count-1);
        	}
	}
}

int main(){
	printf("Enter an expression without spaces\n");
	scanf("%[^\n]",expn);
	icg_from_infix();
	return 0;
}
