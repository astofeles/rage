TESTS=$(wildcard tests/*)

all: rage

rage: lex.yy.c rage.tab.c
	gcc -o rage rage.tab.c lex.yy.c -lm

lex.yy.c: rage.l
	flex -o lex.yy.c rage.l

rage.tab.c: rage.y
	bison -o rage.tab.c rage.y
