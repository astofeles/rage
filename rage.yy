%{
	
%}

ID	(?i:[_a-z])(?i:[_a-z0-9])*
STR	(["][^"]*["])
DDIG	([0-9])
HDIG	(?i:[0-9a-f])
ODIG	([0-7])
INUM	{DDIG}|[1-9]{DDIG}*
FNUM	{INUM}"f"|{INUM}"."{INUM}("f"?)
HNUM	"0x"{HDIG}+ 
ONUM	"0"{ODIG}+
AOP	"+"|"-"|"*"|"/"|"^"|"%"
COP	"=="|"!="
TRU	((T|t)(rue))|TRUE
FAL	((F|f)(alse))|FALSE
BVAL	{TRU}|{FAL}

%%
[[:blank:]]	/* consume blanks */
{INUM}	printf("integer\n");
{FNUM}	printf("float\n");
{ONUM}	printf("octal\n");
{HNUM}	printf("hexdecimal\n");
{BVAL}	printf("boolean\n");
{STR}	printf("string\n");
{ID}	printf("identificator\n");
{AOP}	printf("arithmetics\n");
{COP}	printf("comparison\n");


.	printf("wtf?\n");

%%

int yywrap() { }
int main() {
	yylex();
}
