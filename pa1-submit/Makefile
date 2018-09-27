CC = gcc

all: calc format

calc: calc.c
	gcc -o calc calc.c

format: format
	gcc -o format format.c floatToASCII.c -lm

clean:
	rm -rf format calc
