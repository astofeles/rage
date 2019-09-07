all: rage

rage: analex.c
	gcc -o rage analex.c -lm

analex.c: rage.yy
	flex -o analex.c rage.yy
