%{
    #include <math.h>
    #include <stdlib.h>
    #include <stdio.h>
    #include <string.h>
    extern int yylex(void);
    void yyerror(char const *);
%}

%token NUM
%token LAB ID STR
%token TYP AOP COP ATR

%%

identifier:
      ID

attrop:
      ATR

attr:
      identifier attrop expr ';'

expr:
      

%%

void yyerror(char const * msg) {
    fprintf(stderr, "%s\n", msg);
}
int main()  {
    yyparse();
}
