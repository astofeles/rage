%{
	#include <math.h>	
	#include <string.h>
	int nlin=1;
	int ncol=1;
%}
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
/* Variables, lables and stuff */
ID	(?i:[_a-z][_a-z0-9]*)
LAB	{ID}":" 
STR	(["][^"]*["])
ATR 	"<-"|"->"|"<->"
AOP	"+"|"-"|"*"|"/"|"^"|"%"
COP	">="|"<="|"=="|"!="|">"|"<"
BLOC 	"("|")"|"["|"]"|"{"|"}"
PNT	";"|","|":"

%%

[\n]	{ nlin++; ncol=1; }
[[:blank:]]	{ ncol++; }
{TYP}	{ ncol += strlen(yytext); printf("%s : datatype\n", yytext); }
{LOP} 	{ ncol += strlen(yytext); printf("%s : logicop\n", yytext); }
{LOOP}	{ ncol += strlen(yytext); printf("%s : loop operations\n", yytext); }
{BVAL}	{ ncol += strlen(yytext); printf("%s : boolean\n", yytext); }
{LAB}	{ ncol += strlen(yytext); printf("%s : label\n", yytext); }
{ID}	{ ncol += strlen(yytext); printf("%s : identificator\n", yytext); }
{STR}	{ ncol += strlen(yytext); printf("%s : string\n", yytext); }
{INUM}	{ ncol += strlen(yytext); printf("%s : integer\n", yytext); }
{FNUM}	{ ncol += strlen(yytext); printf("%s : float\n", yytext); }
{HNUM}	{ ncol += strlen(yytext); printf("%s : hexdecimal\n", yytext); }
{ONUM}	{ ncol += strlen(yytext); printf("%s : octal\n", yytext); }
{ATR}	{ ncol += strlen(yytext); printf("%s : atribution\n", yytext); }
{AOP}	{ ncol += strlen(yytext); printf("%s : arithmetics\n", yytext); }
{COP}	{ ncol += strlen(yytext); printf("%s : comparison\n", yytext); }
{BLOC}	{ ncol += strlen(yytext); printf("%s : block control\n", yytext); }
{PNT}	{ ncol += strlen(yytext); printf("%s : punctiation\n", yytext); }

.	{ printf("Error on line %d, column %d: \'%s\' is not a valid token.\n", nlin, ncol, yytext); }

%%

int yywrap() { }
int main(int argc, char const *argv[]) {
	argv++; argc--;
	if (argc == 0)
		yyin = stdin;
	else {
		yyin = fopen(*argv, "r");
		if (yyin == NULL) {
			printf(":: %s not found, using as interpreter ::\n\n", *argv);
			yyin = stdin;
		}
	}
	yylex();
}

