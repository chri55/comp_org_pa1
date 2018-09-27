#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define KRED "\x1B[31m"

//Separates the base identifier from the number.
//Decimals SHOULD BE FORMATTED AS '-d111' and not 'd-111'
char getNumAndBase(char* number) {

    char numberBase = ' ';
    if (number[0] == '-'){
        numberBase = number[1];
        for (int b = 2; b <= strlen(number) - 1; b++){
            number[b-1] = number[b];
        }
        number[strlen(number)-1] = '\0';
        return numberBase;
    }
    else {
        numberBase = number[0];
        int c;
        int length = strlen(number) - 1;
        for (c = 0; c < length; c++){
            number[c] = number[c+1];
        }
        number[length] = '\0';
        return numberBase;
    }

}

//Checks for proper character input.
//Valid chars are 'b', 'o', 'd', and 'x'.
int checkInput(char base) {
    if (base == 'd' || base == 'o' || base == 'b' || base == 'x'){
        return 1;
    }
    else{
        return 0;
    }
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

long long stringToTwos(char *num, char base){
    long long value = 0LL;
    int shift = 1;
    switch (base) {
        case 'b':
            shift = 1;
            break;
        case 'o':
            shift = 3;
            break;
        case 'x':
            shift = 4;
            break;

    }
    for (int i = 0; num[i] != '\0'; i++) {
        value = (value << shift) + val(num[i]);
    }
    return value;
}

long long decimalToTwos(char *num) {
    int len = strlen(num) - 1;

    /*This was originally an int, so I was wondering why the return value was
      always overflowing and not displaying correctly. Forgot that I needed this
      power multiplier to ALSO be 64 bits and not 32...
      lesson learned...
    */
    long long power = 1LL;
    for (int p = 0; p <= len-1; p++){
        power = power * 10;
    }
    if (num[0] == '-'){
        power = power / 10;
    }
    int negative = 1; //+1 for not-negative, -1 for negative, @ the end we multiply.
    if (num[0] == '-'){
        negative = -1;
    }
    long long int value = 0LL;
    for (int i = 0; i <= len; i++){
        if (num[i] != '-'){
            value += val(num[i]) * power;
            power = power / 10;
        }
    }
    value = value * negative;
    return value;
}

char* twosToString(long long value, char outputBase){
    char *final = malloc (sizeof (char) * 65);
    int x = 0;
    final[64] = '\0';
    int mask = 0x00000000;
    char* pool = "01";
    int shift = 1;
    int limit = 63;
    switch (outputBase) {
        case 'b':
            mask = 0x00000001;
            pool = "01";
            shift = 1;
            break;
        case 'o':
            mask = 0x00000007;
            pool = "01234567";
            shift = 3;
            break;
        case 'x':
            mask = 0x0000000F;
            pool = "0123456789ABCDEF";
            shift = 4;
            break;
    }
    for (int i = limit; i>=0; i--){
        x = value&mask;
        final[i] = pool[x];
        value = value >> shift;
    }
    final[64] = '\0';

    return final;


}

int main(int argc, char *argv[]) {
    char op = argv[1][0];
    char* num1 = argv[2];
    char* num2 = argv[3];
    char outputBase = argv[4][0];
    char num1Base = getNumAndBase(num1);
    char num2Base = getNumAndBase(num2);
    long long ans1 = 0LL;
    long long ans2 = 0LL;
    long long ans = 0LL;

    char * answer = malloc (sizeof (char) * 65);

    int one = checkInput(num1Base);
    int two = checkInput(num2Base);
    int three = checkInput(outputBase);

    if (!(one == two && one == three && two == three)){
        fprintf(stderr, "%sERROR 1: Bogus Input. One or more identifiers is incorrect. Valid identifiers are 'b', 'o', 'd', 'x'.\n\n", KRED);
        exit(0);
    }

    if (num1Base == 'd'){
        ans1 = decimalToTwos(num1);
        printf("%lli\n", ans1);
    }
    else {
        ans1 = stringToTwos(num1, num1Base);
    }
    if (num2Base == 'd'){
        ans2 = decimalToTwos(num2);
        printf("%lli\n", ans2);
    }
    else{
        ans2 = stringToTwos(num2, num2Base);
    }

    if (op == '+'){
        ans = ans1 + ans2;
    }
    else if (op == '-') {
        ans = ans1 - ans2;
    }
    else {
        fprintf(stderr, "%sERROR 2: Bogus Input. Use '+' or '-' as operator.\n\n", KRED);
        exit(0);
    }
    if (outputBase == 'd'){
        sprintf(answer, "%lli", ans);
    }
    else {
        answer = twosToString(ans, outputBase);
    }
    printf("%c%s\n\n", outputBase, answer);
    printf("\n");
    exit(1);

}
