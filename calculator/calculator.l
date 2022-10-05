%{
	#include <stdio.h>
	#include "calculator.tab.h"
	
	/*int yylval;*/
%}


%%
"+"		{return ADD;}
"-"		{return SUB;}
"*"		{return MUL;}
"/"		{return DIV;}
"|"		{return ABS;}
"("		{return OP;}
")"		{return CP;}
"//".*	{ }
[0-9]+	{yylval = atoi(yytext); return NUMBER;}
\n		{return EOL;}
[ \t]	{ /*IGNORE WHITESPACE*/ }
.		{printf("Mystry character%s\n", yytext);}
%%


int yywrap(){
	return 1;
}