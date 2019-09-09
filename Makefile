all: rage

rage: analex.c
	gcc -o rage analex.c -lm

analex.c: rage.l
	flex -o analex.c rage.l
