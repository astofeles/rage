SRC_DIR=src
INC_DIR=include
OUT_DIR=out
TEST_DIR=test

SRC=$(wildcard $(SRC_DIR)/*)
INC=$(wildcard $(INC_DIR)/*)
OBJ=$(patsubst $(SRC_DIR)/%.c, $(OUT_DIR)/%.o, $(SRC))
TESTS=$(wildcard $(TEST_DIR)/*)

PROGRAM=rage
CC=gcc
ARGS=\
	 -lm \
	 -I$(INC_DIR)

LEX=$(PROGRAM).l
YAC=$(PROGRAM).y

all: $(PROGRAM)

$(PROGRAM): anasin.c analex.c $(OBJ)
	gcc -o $@ $^ $(ARGS)

analex.c: $(LEX)
	flex -o $@ $<

anasin.c: $(YAC)
	bison -o $@ -d $<

$(OUT_DIR)/%.o: $(SRC_DIR)/%.c $(INC_DIR)/%.h
	mkdir -p $(OUT_DIR)
	gcc -o $@ $< $(ARGS) -c



.PHONY: clean test
test:

clean:
	rm *.c *.h rage
	rm -r $(OUT_DIR)
