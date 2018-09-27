#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>

#define KRED "\x1B[31m"

void floatToASCII(float x, char* output);

// Int part and Float part.
// ugh
typedef union Number{
    int i;
    float f;
} Num;

int checkInput(char * form){
    if ((strcmp(form, "int") == 0) || (strcmp(form, "float") == 0)) return 1;
    else return 0;
}

int val(char c)
{
    if (c >= '0' && c <= '9'){
        return c - '0';
    }
    else{
        return c - 'A' + 10;
    }
}

long long bitsToInt(char *bits){
    int length = strlen(bits) - 1;
    long long power = 1LL;
    long long final = 0LL;
    int x = 0;
    int negative = 1;
    int y = 1;
    if (bits[0] == '1'){
        negative = -1;
        y = 0;
    }
    for (int i = length; i >= y; i--){
        if (negative < 0){
            x = 1-(bits[i] - '0');
        }
        else{
            x = (bits[i] - '0');
        }
        final += (x * power);
        power = power * 2;
        printf("%lli\n%lli\n\n", power, final);
    }
    if (negative < 0){
        return (final * negative) - 1;
    }
    return final * negative;
}

void intToDecASCII(int i, char * integ){
	char * ptr;
	char sign = '+';

	//32-Bits for a int
	char numArray[12] = {'0', '0','0','0','0','0','0','0','0','0','0','\0'};

	//If sign is negative make i positive and the sign
	if(i < 0){
		sign = '-';
		i *= -1;
	}

	//Places LSDs from right to left
	int x = 10;
	for(; ; x--){
		numArray[x] = (i % 10) + '0';
		i /= 10;
		if(i == 0) //Stops when digits run out
			break;
	}

	//Adds a dash if number is negative
	if(sign == '-'){
		x--;
		numArray[x] = '-';
	}

	//Copies resulting string into allocated memory
	ptr = integ;
	for(; x < 12; x++){
		*ptr = numArray[x];
		ptr++;
	}
}


int main(int argc, char *argv[]){
    if (argc != 3){
        fprintf(stderr, "%sERROR 2: number of arguments is incorrect. USE: ./format <bitstring> <type>", KRED);
        exit(0);
    }

    Num number;
    number.i = 0;
    char* bits = argv[1];
    char* form = argv[2];
    long long final = 0LL;
    char* finstr = malloc(sizeof(char) * 64);

    if (checkInput(form) == 0){
        fprintf(stderr, "%sERROR 1: format form is incorrect. Valid options are: 'int', 'float'", KRED);
        exit(0);
    }

    char * ptr = argv[1];
    while(*ptr != '\0'){
        number.i = number.i << 1;
        number.i += *ptr - '0';
        ptr++;
    }

    if (strncmp(form, "int", 3) == 0){
        final = bitsToInt(bits);
        printf("%lli\n", final);
    }
    else {
        floatToASCII(number.f, finstr);
        printf("%s\n", finstr);
    }
    exit(1);
}
