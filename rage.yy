%{
	
%}

%%

[0-9]+	printf("That's a number\n");
[A-Za-z]+	printf("That's a word\n");

%%

int yywrap() { }
int main() {
	yylex();
}
