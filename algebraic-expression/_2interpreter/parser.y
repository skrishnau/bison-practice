%{
    #include <stdio.h>

    int parser_result;
%}

%token TOKEN_INT
%token TOKEN_PLUS
%token TOKEN_MINUS
%token TOKEN_MUL
%token TOKEN_DIV
%token TOKEN_LPAREN
%token TOKEN_RPAREN
%token TOKEN_SEMI
%token TOKEN_ERROR

%%
program :   expr TOKEN_SEMI {parser_result = $1; }
        ;
expr    :   expr TOKEN_PLUS term {$$ = $1 + $3;}
        |   expr TOKEN_MINUS term {$$ = $1 - $3;}
        |   term
        ;
term    :   term TOKEN_MUL factor {$$ = $1 * $3;}
        |   term TOKEN_DIV factor {$$ = $1 / $3;}
        |   factor
        ;
factor  :   TOKEN_MINUS factor {$$ = -$1;}
        |   TOKEN_LPAREN expr TOKEN_RPAREN {$$ = $2;}
        |   TOKEN_INT
        ;
%%

int main(){
    if(yyparse() == 0){
        printf("Parse Successful!\n");
        printf("RESULT: %d\n", parser_result);
    }else {
        printf("Parse failed!\n");
    }
}


int yyerror(char* s){printf("ERROR: %s\n", s); return 0;}