NOTE!! format.c !!
- Decimals can be NEGATIVE in the form of -d100, -d394, etc. not d-100.
calc:

    - Error 1: Wrong operator input.
    - Error 2: Wrong base identifiers.
    - Error 3: Wrong number of command-line arguments.

    The val(char c){} function is important here because it gives a value for
    each char we need to check, regardless of the form. We can get the values
    for binary, decimal, octal, and hex, using this function, so multiple
    `stringToASCII(){}` functions do not need to be written, we just need to send the
    output base char to a controller function and it'll do the work for us.


format:

    - Error 1: Format of form is improper.
    - Error 2: Wrong number of command-line arguments.

    The integer formatting works as it does in the calc program, as it is
    simply changing a two's complement form into an int, and I already did that
    in the calc program. The float relies on the floatToASCII file.
