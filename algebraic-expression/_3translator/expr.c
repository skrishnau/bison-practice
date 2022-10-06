#include <stdio.h>
#include "expr.h";
#include <stdlib.h>

struct expr* expr_create(expr_t kind, struct expr* left, struct expr* right){
    struct expr *e = malloc(sizeof(*e));
    e->kind = kind;
    e->left = left;
    e->right = right;
    e->value = 0;
    return e;
}

struct expr* expr_create_value(int value){
    struct expr* e = expr_create(EXPR_VALUE, 0, 0);
    e->value = value;
    return e;
}

int expr_evaluate(struct expr* e){
    if(!e) return 0;
    int l = expr_evaluate(e->left);
    int r = expr_evaluate(e->right);
    switch (e->kind)
    {
        case EXPR_VALUE:
            return e-> value;
        case EXPR_ADD:
            return l + r;
        case EXPR_SUB:
            return l - r;
        case EXPR_MUL:
            return l * r;
        case EXPR_DIV:
            if(r == 0){
                printf("ERROR: divide by zero\n");
                exit(1);
            }
            return l / r;
        default:
            break;
    }
    return 0;
}

void expr_print(struct expr *e){
    if(!e) return;
    printf("(");
    expr_print(e->left);
    switch (e->kind){
        case EXPR_VALUE: 
            printf("%d", e->value);
            break;
        case EXPR_ADD:
            printf("+");
            break;
        case EXPR_SUB:
            printf("-");
            break;
        case EXPR_MUL:
            printf("*");
            break;
        case EXPR_DIV:
            printf("/");
            break;
    }
    expr_print(e->right);
    printf(")");
}

/*int main(){
    struct expr* a = expr_create_value(10);
    struct expr* b = expr_create_value(20);
    struct expr* c = expr_create(EXPR_ADD, a, b);
    struct expr* d = expr_create_value(30);
    struct expr* e = expr_create(EXPR_MUL, c, d);
    return 0;
}*/