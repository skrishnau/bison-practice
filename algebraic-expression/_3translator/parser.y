%{
    #include <stdio.h>
    #include "expr.h"
    #define YYSTYPE struct expr*
    struct expr* parser_result = 0;
%}

%token TOKEN_INT
%token TOKEN_PLUS
%token TOKEN_MINUS
%token TOKEN_MUL
%token TOKEN_DIV
%token TOKEN_LPAREN
%token TOKEN_RPAREN
%token TOKEN_ABS
%token TOKEN_SEMI
%token TOKEN_ERROR

%%
input:  exp TOKEN_SEMI
            {parser_result = $1;}
        ;
exp:    exp TOKEN_PLUS term
            {$$ = expr_create(EXPR_ADD, $1, $3);}
        | exp TOKEN_MINUS term
            {$$ = expr_create(EXPR_SUB, $1, $3);}
        | term
            {$$ = $1;}
        ;
term:   term TOKEN_MUL factor
            {$$ = expr_create(EXPR_MUL, $1, $3);}
        | term TOKEN_DIV factor
            {$$ = expr_create(EXPR_DIV, $1, $3);}
        | factor
            {$$ = $1;}
        ;
factor: TOKEN_MINUS factor
            {$$ = expr_create(EXPR_SUB, expr_create_value(0), $2);}
        | TOKEN_LPAREN exp TOKEN_RPAREN
            {$$ = $2;}
        | TOKEN_ABS factor
            {$$ = $2->value >= 0 ? $2 : expr_create(EXPR_MUL, expr_create_value(-1), $2);}
        | TOKEN_INT
            {$$ = expr_create_value($1);}
        ;
%%

int main(){
    if(yyparse() == 0){
        printf("PARSE SUCCESSFUL!\n");
        int result = expr_evaluate(*parser_result);
        printf("RESULT: %d\n", result);

        expr_print(*parser_result);
        printf("\n");
    } else {
        printf("PARSE FAILED!\n");
    }
    return 0;
}

int yyerror(char* s){
    printf("ERrOR %s\n", s);
}