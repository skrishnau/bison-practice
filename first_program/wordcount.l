%{
	#include <stdio.h>
	#include <string.h>
	int chars = 0;
	int words = 0;
	int lines = 0;
%}


%%
[a-zA-Z]+ 	{words++; chars += strlen(yytext);}
\n			{chars++; lines++;}
.			{chars++;}
%%

int main()
{
	yylex();
	printf("lines: %8d words: %8d chars: %8d\n", lines, words, chars);
	return 0;
}
int yywrap(){
	return (1);
}