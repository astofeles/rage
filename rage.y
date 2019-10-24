%{
    #include <math.h>
    #include <stdlib.h>
    #include <stdio.h>
    #include <string.h>
    extern int yylex(void);
    extern int yyparse(void);
    extern FILE *yyin;
    void yyerror(char const *);
%}

%start start

%token GOTO WHILE IF ELSE SWITCH CASE FOR DO UNTIL
%token RETURN PRINT
%token TCHAR TINT TFLOAT TDOUBLE TSTRING
%token AND OR NOT NAND XOR NOR
%token VSTRING VBOOL
%token LATRIB RATRIB SWAP
%token ID LABEL
%token NUMBER PLUS MINUS DIV MOD MULT POW
%token LEQ GEQ LT GT EQU NEQ
%token OPEN_PAR CLOSE_PAR OPEN_BRACK CLOSE_BRACK OPEN_CURLY CLOSE_CURLY SEMICOL

%left PLUS MINUS
%right MULT DIV POW

%%

start
    : %empty
    | LABEL start
    | OPEN_CURLY start CLOSE_CURLY
    | command SEMICOL start         {printf("Command\n");}
    | struct start
    ;

struct
    : condition         {printf("Condicional\n");}
    | while             {printf("While loop\n");}
    | for               {printf("For loop\n");}
    | do
    ;

condition
    : IF OPEN_PAR expr CLOSE_PAR start else
    ;

else
    : %empty
    | ELSE start
    ;

while
    : WHILE OPEN_PAR expr CLOSE_PAR
    ;

do
    : DO start whitil OPEN_PAR expr CLOSE_PAR
    ;

whitil
    : WHILE     {printf("do..while\n");}
    | UNTIL     {printf("do..until\n");}
    ;

for
    : FOR OPEN_PAR expr SEMICOL expr SEMICOL expr CLOSE_PAR
    ;

expr
    : OPEN_PAR expr OPEN_PAR    { $$ = $2; }
    | expr PLUS expr    { $$ = $1 + $3; }
    | expr MINUS expr   { $$ = $1 - $3; }
    | MINUS expr        { $$ = -$1; }
    | expr DIV expr     { $$ = $1 / $3; }
    | expr MULT expr    { $$ = $1 * $3; }
    | expr MOD expr     { $$ = $1 % $3; }
    | expr POW expr     { $$ = pow($1,$3); }
    | expr AND expr     { $$ = $1 && $3; }
    | expr OR expr      { $$ = $1 || $3; }
    | expr NOR expr     { $$ = !($1 || $3); }
    | expr NAND expr    { $$ = !($1 && $3); }
    | expr LEQ expr     { $$ = $1 <= $3; }
    | expr GEQ expr     { $$ = $1 >= $3; }
    | expr LT expr      { $$ = $1 < $3; }
    | expr GT expr      { $$ = $1 > $3; }
    | NOT expr          { $$ = !$2; }
    | operand           { $$ = !$1; }
    ;

operand
    : NUMBER    { printf("Número\n"); }
    | ID        { printf("Identificador\n"); }
    ;

attrib
    : ID LATRIB expr    { printf("Atribuição a esquerda\n"); }
    | expr RATRIB ID    { printf("Atribuição a direita\n"); }
    | ID SWAP ID        { printf("Troca\n"); }
    ;

command
    : attrib    {printf("Atribuição\n");}
    | expr      {printf("Expressão\n");}
    | print     {printf("Instrução de Exibição\n");}
    | goto      {printf("Goto instruction\n");}
    | %empty
    ;

print: PRINT OPEN_PAR expr CLOSE_PAR

goto: GOTO ID ;

%%
void yyerror(char const * msg) {
    fprintf(stderr, "%s\n", msg);
}

int main()  {
    yyparse();
}
