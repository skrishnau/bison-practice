%{
	#include <stdio.h>
	#include "test.tab.h"
	void showError();
	int xx;
%}



numbers		([0-9])+
alpha		([a-zA-Z])+


%%
	{alpha}		{sscanf(yytext, "%s", yylval.name); return (STRING);}
	"hello"		{return (STRING);}
	{numbers}	{yylval.number = atoi(yytext); return (NUM);}
	";"			{return (SEMICOLON);}
	.			{showError(); return (OTHER);}
%%



void showError(){
	printf("Other Input");
}
