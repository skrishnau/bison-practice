typedef enum {
    EXPR_ADD,
    EXPR_SUB,
    EXPR_DIV,
    EXPR_MUL,
    EXPR_VALUE
} expr_t;

struct expr{
    expr_t kind;
    struct expr *left;
    struct expr *right;
    int value;
};
