%{
	#include <math.h>	
	#include <string.h>
	int nlin=1;	// the line counter
	int ncol=1;	// the column counter
%}

/* NOTE: rage works with all words being casae insensitive, therefore, all alphabetic definitions
 * uses (?i: ... ) to denote that the definition is case insensitive */

/* Reserved words */
LOP	(?i:and)|(?i:or)|(?i:not)|(?i:nand)|(?i:nor)|(?i:xor)
TRU	(?i:t(rue)?)
FAL	(?i:f(alse)?)
BVAL	{TRU}|{FAL}
CND	(?i:if)|(?i:else)|(?i:switch)|(?i:case)
LOOP	(?i:for)|(?i:while)|(?i:do)|(?i:until)
GOTO	(?i:goto)
TYP	(?i:int)|(?i:char)|(?i:string)|(?i:float)|(?i:double)

/* Numbers */
DDIG	([0-9])
HDIG	(?i:[0-9a-f])
ODIG	([0-7])
INUM	{DDIG}|[1-9]{DDIG}*
FNUM	{INUM}(?i:f)?|{INUM}?"."{INUM}(?i:f)?
HNUM	(?i:0x){HDIG}+ 
ONUM	"0"{ODIG}+
NUM	"-"?({ONUM}|{HNUM}|{INUM}|{FNUM})

/* Variables, lables, operators and stuff */
ID	(?i:[_a-z][_a-z0-9]*)
LAB	{ID}":" 
STR	(["][^"]*["])
ATR 	"<-"|"->"|"<->"
AOP	"+"|"-"|"*"|"/"|"^"|"%"
COP	">="|"<="|"=="|"!="|">"|"<"
BLOC 	"("|")"|"["|"]"|"{"|"}"
PNT	";"|","|":"


COMM "//".*

%%

\n(\r)?	{ nlin++; ncol=1; }
[[:blank:]]	{ ncol++; }
{TYP}	{ ncol += strlen(yytext); printf("%s : datatype\n", yytext); }
{BLOC}	{ ncol += strlen(yytext); printf("%s : block control\n", yytext); }
{LOP} 	{ ncol += strlen(yytext); printf("%s : logicop\n", yytext); }
{LOOP}	{ ncol += strlen(yytext); printf("%s : loop operations\n", yytext); }
{BVAL}	{ ncol += strlen(yytext); printf("%s : boolean\n", yytext); }
{ID}	{ ncol += strlen(yytext); printf("%s : identificator\n", yytext); }
{LAB}	{ ncol += strlen(yytext); printf("%s : label\n", yytext); }
{STR}	{ ncol += strlen(yytext); printf("%s : string\n", yytext); }
{NUM}	{ ncol += strlen(yytext); printf("%s : number\n", yytext); }
{ATR}	{ ncol += strlen(yytext); printf("%s : atribution\n", yytext); }
{AOP}	{ ncol += strlen(yytext); printf("%s : arithmetics\n", yytext); }
{COP}	{ ncol += strlen(yytext); printf("%s : comparison\n", yytext); }
{PNT}	{ ncol += strlen(yytext); printf("%s : punctiation\n", yytext); }
{COMM}  { ncol += strlen(yytext); /* ignore comment */}

{NUM}{ID}	{ printf("AAAAAAA\n"); }
.	{ ncol += strlen(yytext); printf("\e[1;31mError on line %d, column %d: \'%s\' is not a valid token.\e[0m\n", nlin, ncol, yytext); }

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
/* if no parameter is given, or the parameter gives a file not found, then the rage works as an interpreter.
 * Otherwise, rage lexicly analyse the file of the first parameter. The file extension may be written as 
 * '.rage' */
int main(int argc, char const *argv[]) {
	argv++; argc--;
	if (argc == 0)
		yyin = stdin;
	else {
		if (**argv == '-') {
			// then it is an option
			if (strcmp(*argv, "-h") == 0 || strcmp(*argv, "--help") == 0) {
				show_help();
			} else {
				printf("Option %s not valid, please execute 'rage --help' to see how to use it\n", *argv);
			}
			exit(0);
		} else {
			// it is a file
			yyin = fopen(*argv, "r");
			if (yyin == NULL) {
				printf(":: %s not found, using as interpreter ::\n\n", *argv);
				yyin = stdin;
			}
		}
	}
	yylex();
}

/* {INUM}	{ ncol += strlen(yytext); printf("%s : integer\n", yytext); } */
/* {FNUM}	{ ncol += strlen(yytext); printf("%s : float\n", yytext); } */
/* {HNUM}	{ ncol += strlen(yytext); printf("%s : hexdecimal\n", yytext); } */
/* {ONUM}	{ ncol += strlen(yytext); printf("%s : octal\n", yytext); } */
