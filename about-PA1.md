# PA1

## Hex ASCII to Two's Complement

A C function that returns an int 0 for failure, 1 for success.

    int hexToTwos(char \*s, int \*valueptr) {
        int value =  0;
        for (i = 0; s[i] != '\0'; i++) {
            switch (s[i]) {
                case '0':
                    //do stuff
                case '1':
                    //do stuff
                case 2-9... :
                    //2-9 stuff

                    //stuff:
                    value = (value << 4) + s[i] - '0';
                    break;
                case 'a', case 'A' - case 'f' case 'F':
                    value = (value << 4) + 10; //(11[b], 12[c], etc.)

            }
        }
    }

In the case of how I made the val function, we can subtract '0' the characters '9' - '0' to get the value, and we can subtract 'A' from the characters 'F' - 'A'. Using this, we can get the int val back to convert from any base.

    int val(char c){
        if (c <= '9' || c >= '0') {
            return (int)c - '0'; // Will return the two's complement value of the char - '0'.
        }
        else { //the char is a char A-F, assuming no bad input.
            return (int)c - 'A' + 10; // Same logic as above, we just add 10 to account for 'A' - 'F' being values > 9 in hex.
        }

        return -1;
    }

## Bit Shifting

Shift Left: <<

Shift Right: >>

Example:

    x     = 001100
    x<<1  = 0011000
    x<<4  = 00110000

So, if we want to calculate a value in hex, we calculate its decimal (or two's complement) number and shift that right by 4 (<<4).

If we wanted to calcluate the value in octal, we again calculate the decimal/two's and shift right by 3 (<<3).

And finally, when we wanna calculate in binary, we do it one bit at a time. (<<1).

## Two's Complement to ASCII

A C function. Returns 0 for failure and 1 for success.

    int twosToHexASCII(int value, char \*s) {

        int x;
        char s[9] = '\0';
        if (s == 0){
            return 0;
        }
        else {
            for (i = 8; i >=0; i--){
                x = value &0x0000000F; //masking.
                s[i] = "123456789ABCDEF"[x]; //yank the char out.
                value = value >> 4; //Shift value by 4 bits right.
            }
        }
    }

Let's look at the line `x = value & 0x0000000F;`

This is called masking. Masking is turning groups of bits on (1) or off (0). Each time we go through to get a character from the `int value`, we want to check the low 4 bits, so we use the `&` operator with `0x0000000F` and we end up with `0 <= x <= 15`.

So, for example, if `value` is an unsigned int of `0...10101100`, and we want to just take the low 4 bits out, the result of `value & 0x0000000F` would be `1100`, or the two's complement int `10`.

We can use this to capture any number of bits. If we want 3 bits, we just need to make sure 3 bits are *turned on.* (`0x00000007` == `0...0111`).

## Decimal ASCII to Two's Complement


    int decimalToTwos(char \*s, int \*valptr) {
        int negative = 1;
        if (s[0] == '-') {
            //remember minus and skip to next char
            negative = -1;
        }
        else {
            //REMEMBER not negative.
            negative = 1;
        }
        int value = 0;
        for (; s[i] != '\0', i++){
            switch (s[i]){
                case '0' - case '9':
                    value = value*10 + s[i] - '0';
                    break;
                default:
                    //bad input, complain.
                    return 0;
            }
            value = \*value (times) negative;
            return 1;
        }
    }
