%{
    /*definitions*/
    #include <stdio.h>
    #include "parser.tab.h"
%}


/*rules*/
%%
[0-9]+ { yylval.num = atoi(yytext); return NUMBER;}
"+"     {return PLUS;}
"-"     {return MINUS;}
"*"     {return MULTIPLY;}
\n      {return EOL;}
[ \t]   {}
.       {}
%%


int yywrap(){return 1;}

/*int main(){
    yylex();

    return 0;
}*/