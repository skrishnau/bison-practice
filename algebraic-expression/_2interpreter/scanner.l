%{
    #include <stdio.h>
    #include "parser.h"
%}

DIGIT   [0-9]
LETTER  [a-zA-Z]

%%
{DIGIT}+    {yylval = atoi(yytext); return TOKEN_INT;}
"+"         {return TOKEN_PLUS;}
"-"         {return TOKEN_MINUS;}
"*"         {return TOKEN_MUL;}
"/"         {return TOKEN_DIV;}
"("         {return TOKEN_LPAREN;}
")"         {return TOKEN_RPAREN;}
";"         {return TOKEN_SEMI;}
[ \t]       {}
\n          {return 0;}
.           {return TOKEN_ERROR;}
%%

int yywrap() {return 0;}

