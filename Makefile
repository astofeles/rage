TESTS=$(wildcard tests/*)

all: rage

clear:
	rm *.c rage

rage: rage.tab.c rage.tab.h analex.c
	gcc -o rage rage.tab.c analex.c -lm

analex.c: rage.l rage.tab.h
	flex -o analex.c rage.l

rage.tab.c: rage.tab.h
rage.tab.h: rage.y
	bison -d rage.y -Wconflicts-sr

clean:
	rm *.c *.h rage
