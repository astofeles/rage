%{
	
%}



%%

[[:blank:]]	/* consume blanks */
"recebe"	printf("Atribuicao\n");
[[:digit:]]+	printf("%s:That's a number\n", yytext);
[[:alpha:]]+	printf("%s:That's a word\n", yytext);
[[:punct:]]	printf("%s:That's a punctuation\n", yytext);


.	printf("wtf?\n");

%%

int yywrap() { }
int main() {
	yylex();
}
