%{
    /*definition*/
    #include <stdio.h>
%}

%union {
    int num;
    char sym;
}

%token EOL
%token<num> NUMBER
%token PLUS MINUS MULTIPLY
%type<num> exp

/* rules */
%%
input: 
    | line input
;
line: exp EOL {printf("%d\n", $1);}
    | EOL;
exp: 
    NUMBER {$$ = $1;}
    | exp PLUS exp {$$ = $1 + $3;}
    | exp MINUS exp {$$ = $1 - $3;}
    | exp MULTIPLY exp {$$ = $1 * $3;}
;

%%


int main(){
    yyparse();
    return 0;
}

int yyerror(char* s){
    printf("ERROR %s\n", s);

    return 0;
}