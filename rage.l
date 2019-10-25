%{
    #include <math.h>    
    #include <string.h>
    #include "rage.tab.h"
    int nlin=1;    // the line counter
    int ncol=1;    // the column counter
    int nl=0;
    void update();
    void lexerror();
%}

/* NOTE: rage works with all words being casae insensitive, therefore, all alphabetic definitions
 * uses (?i: ... ) to denote that the definition is case insensitive */

/* Numbers */
DDIG    ([0-9])
HDIG    (?i:[0-9a-f])
ODIG    ([0-7])
INUM    {DDIG}|[1-9]{DDIG}*
FNUM    {INUM}(?i:f)?|{INUM}?"."{INUM}(?i:f)?
HNUM    (?i:0x){HDIG}+ 
ONUM    "0"{ODIG}+
NUM     "-"?({ONUM}|{HNUM}|{INUM}|{FNUM})

/* Variables, lables, operators and stuff */
ID      (?i:[_a-z][_a-z0-9]*)
LAB     {ID}":" 
STR     (["][^"]*["])
ATR     "<-"|"->"|"<->"
AOP     "+"|"-"|"*"|"/"|"^"|"%"
COP     ">="|"<="|"=="|"!="|">"|"<"
BLOC    "("|")"|"["|"]"|"{"|"}"
PNT     ";"|","|":"


COMM    "//".*|"/*".*"*/"

%%

\n(\r)?         {nl=1;update();}
[[:blank:]]     {update();}
{COMM}          {update(); return 0;}
(?i:goto)       {update(); return GOTO;}
(?i:while)      {update(); return WHILE;}
(?i:if)         {update(); return IF;}
(?i:else)       {update(); return ELSE;}
(?i:switch)     {update(); return SWITCH;}
(?i:case)       {update(); return CASE;}
(?i:for)        {update(); return FOR;}
(?i:do)         {update(); return DO;}
(?i:until)      {update(); return UNTIL;}
(?i:return)     {update(); return RETURN;}
(?i:char)       {update(); return TCHAR;}
(?i:int)        {update(); return TINT;}
(?i:float)      {update(); return TFLOAT;}
(?i:double)     {update(); return TDOUBLE;}
(?i:string)     {update(); return TSTRING;}
(?i:true)|(?i:false)  {update(); return VBOOL;}
(?i:and)        {update(); return AND;}
(?i:or)         {update(); return OR;}
(?i:not)        {update(); return NOT;}
(?i:nand)       {update(); return NAND;}
(?i:nor)        {update(); return NOR;}
(?i:xor)        {update(); return XOR;}
(["][^"]*["])   {update(); return VSTRING;}
"<-"            {update(); return LATRIB;}
"->"            {update(); return RATRIB;}
"<->"           {update(); return SWAP;}
(?i:print)      {update(); return PRINT;}
(?i:[_a-z][_a-z0-9]*):  {update(); return LABEL;}
(?i:[_a-z][_a-z0-9]*)   {update(); return ID;}
{NUM}           {update(); return NUMBER;} 
"+"             {update(); return PLUS;}
"-"             {update(); return MINUS;}
"/"             {update(); return DIV;}
"%"             {update(); return MOD;}
"*"             {update(); return MULT;}
"^"             {update(); return POW;}
"<="            {update(); return LEQ;}
">="            {update(); return GEQ;}
"<"             {update(); return LT;}
">"             {update(); return GT;}
"=="            {update(); return EQU;}
"!="            {update(); return NEQ;}
"("             {update(); return OPEN_PAR;}
")"             {update(); return CLOSE_PAR;}
"["             {update(); return OPEN_BRACK;}
"]"             {update(); return CLOSE_BRACK;}
"{"             {update(); return OPEN_CURLY;}
"}"             {update(); return CLOSE_CURLY;}
";"             {update(); return SEMICOL;}
","             {update(); return COMMA;}
":"             {update(); return COLLON;}

.    { lexerror(); }

%%

/* This is RAGE: 'R'eally? 'A'nother langua'GE'? */

/* default function to wrap the token read */
int yywrap() { }
void show_help() {
    char c;
    FILE * help = fopen("rage.help", "r");
    while (!feof(help)) {
        c = getc(help);
        if (c != EOF) putchar(c);
    }
}

void update() {
    if (nl) {
        ncol=1;
        nlin++;
        nl=0;
    } else {
        ncol += strlen(yytext);
    }
}

void lexerror() {
    fprintf(stderr, "lexical error: %d-%d: \'%s\' not recognized.\n", nlin, ncol, yytext); 
}
/* if no parameter is given, or the parameter gives a file not found, then the rage works as an interpreter.
 * Otherwise, rage lexicly analyse the file of the first parameter. The file extension may be written as 
 * '.rage' */
// int main(int argc, char const *argv[]) {
//     argv++; argc--;
//     if (argc == 0)
//         yyin = stdin;
//     else {
//         if (**argv == '-') {
//             // then it is an option
//             if (strcmp(*argv, "-h") == 0 || strcmp(*argv, "--help") == 0) {
//                 show_help();
//             } else {
//                 printf("Option %s not valid, please execute 'rage --help' to see how to use it\n", *argv);
//             }
//             exit(0);
//         } else {
//             // it is a file
//             yyin = fopen(*argv, "r");
//             if (yyin == NULL) {
//                 printf(":: %s not found, using as interpreter ::\n\n", *argv);
//                 yyin = stdin;
//             }
//         }
//     }
//     yylex();
// }

/* {INUM}    { ncol += strlen(yytext); printf("%s : integer\n", yytext); } */
/* {FNUM}    { ncol += strlen(yytext); printf("%s : float\n", yytext); } */
/* {HNUM}    { ncol += strlen(yytext); printf("%s : hexdecimal\n", yytext); } */
/* {ONUM}    { ncol += strlen(yytext); printf("%s : octal\n", yytext); } */
