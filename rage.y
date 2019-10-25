%{
    #include <math.h>
    #include <stdlib.h>
    #include <stdio.h>
    #include <string.h>
    extern int yylex(void);
    extern int yyparse(void);
    extern FILE *yyin;
    extern int nlin;
    extern int ncol;
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
%token OPEN_PAR CLOSE_PAR OPEN_BRACK CLOSE_BRACK OPEN_CURLY CLOSE_CURLY SEMICOL COMMA COLLON

%left PLUS MINUS
%right MULT DIV POW

%%

start
    : %empty
    | function_definition
    | start function_definition
    ;

function_definition
    : type ID OPEN_PAR declaration_list CLOSE_PAR compound_statement
    | type ID OPEN_PAR CLOSE_PAR compound_statement
    ;

type
    : TINT
    | TFLOAT
    | TSTRING
    | TCHAR
    | TDOUBLE
    ;

statement
    : selection_statement
    | iteration_statement
    | jump_statement
    | compound_statement
    | expression_statement
    | labeled_statement
    | declaration_statement
    ;

selection_statement
    : IF OPEN_PAR expression CLOSE_PAR statement
    | IF OPEN_PAR expression CLOSE_PAR statement ELSE statement
    | SWITCH OPEN_PAR expression CLOSE_PAR statement
    ;

iteration_statement
    : WHILE OPEN_PAR expression CLOSE_PAR statement
    | DO statement WHILE OPEN_PAR expression CLOSE_PAR SEMICOL
    | DO statement UNTIL OPEN_PAR expression CLOSE_PAR SEMICOL
    | FOR OPEN_PAR expression_statement expression_statement expression CLOSE_PAR statement
    ;

jump_statement
    : GOTO ID SEMICOL
    | RETURN expression SEMICOL
    | RETURN SEMICOL
    ;

compound_statement
    : OPEN_CURLY CLOSE_CURLY
    | OPEN_CURLY statement_list CLOSE_CURLY
    ;

expression_statement
    : SEMICOL
    | expression SEMICOL
    ;

labeled_statement
    : ID COLLON statement
    ;

statement_list
    : statement
    | statement_list statement
    ;

declaration_list
    : declaration
    | declaration_list declaration
    ;

init_declaration
    : ID
    | ID LATRIB expression
    ;

init_declaration_list
    : init_declaration
    | init_declaration_list COMMA init_declaration
    ;

declaration
    : type init_declaration_list
    ;

declaration_statement
    : declaration SEMICOL
    ;

literal
    : VSTRING
    | VBOOL
    | NUMBER
    | ID
    ;

primary
    : literal
    | OPEN_PAR expression CLOSE_PAR
    ;

expression
    : assignment
    | expression COMMA assignment
    ;

function
    : primary
    | ID OPEN_PAR expression CLOSE_PAR
    | ID OPEN_PAR CLOSE_PAR
    ;

power
    : function
    | power POW function
    ;

multiplication
    : power
    | multiplication MULT power
    | multiplication DIV power
    | multiplication MOD power
    ;

addition
    : multiplication
    | addition PLUS multiplication
    | addition MINUS multiplication
    ;

and
    : addition
    | and AND addition
    | and NAND addition
    ;

or
    : and
    | or OR and
    | or NOR and
    | or XOR and
    ;

compare
    : or
    | compare LEQ or
    | compare GEQ or
    | compare GT or
    | compare LT or
    | compare EQU or
    | compare NEQ or
    ;

right_assign
    : compare
    | left_assign RATRIB ID
    ;

left_assign
    : right_assign
    | ID LATRIB right_assign
    ;

swap_assign
    : left_assign
    | ID SWAP ID
    ;

assignment
    : swap_assign
    ;

%%

void yyerror(char const * msg) {
    fprintf(stderr, "syntax error %d-%d: %s\n", nlin, ncol, msg);
}

int main()  {
    yyparse();
}
