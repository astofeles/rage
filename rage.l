%{
	#include <math.h>	
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

[[:blank:]]	/* consume blanks */
{TYP}	printf("%s : datatype\n", yytext);
{LOP} 	printf("%s : logicop\n", yytext);
{BVAL}	printf("%s : boolean\n", yytext);
{ID}	printf("%s : identificator\n", yytext);
{STR}	printf("%s : string\n", yytext);
{INUM}	printf("%s : integer\n", yytext);
{FNUM}	printf("%s : float\n", yytext);
{HNUM}	printf("%s : hexdecimal\n", yytext);
{ONUM}	printf("%s : octal\n", yytext);
{ATR}	printf("%s : atribution\n", yytext);
{AOP}	printf("%s : arithmetics\n", yytext);
{COP}	printf("%s : comparison\n", yytext);
{BLOC}	printf("%s : bloccontrol\n",yytext);
{PNT}	printf("%s : pontiation\n",yytext);

.	printf("wtf?\n");

%%

int yywrap() { }
int main() {
	yylex();
}
