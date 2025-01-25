# z80-asm-test
## Comparative Z80 Assembler Test

I was interested in Z80 cross-assemblers that could be built from source for MacOS or Linux, and within that grouping I picked several that for various reasons seemed most interesting to me:

* [SjASMPlus](https://github.com/z00m128/sjasmplus) 
* [z88dk-z80asm](https://github.com/z88dk/z88dk/wiki/Tool---z80asm)
* [zmac](https://github.com/gp48k/zmac/tree/master)

I have also compared these with https://www.asm80.com which is accessible withough build / install - in a browser.

This comparison is not thorough - I have covered the differences which became obvious when attempting to build an open source Z80 project - I am sure there will be other differences.

For each assembler there are succeed.asm and fail.asm source files. The succeed.asm files have been written to generate an identical output across the assembers, and the outputs are provided in _succeed.bin and _succeed.hex files.

The fail.asm files naturally enough seek to show which syntaxes seem not to work, but which do work with one of the other assembers.

The differences in syntax are summarised below.

## 16-bit register loading pseudo-ops
A pseudo-op such as:

    ld de,bc

Is equivalent to:

    ld d,b
    ld e,c

All of the assemblers apart from zmac translated these pseudo-ops correctly.

## 16-bit word splitting
asm80 uses msb/lsb functions to extract most and least significant (high/low) bytes from a 16-bit word.  

    db msb($)       ; high byte of the current PC
    db lsb($)       ; low byte of the current PC

SjASMPlus and zmac use high/low functions.  

    db high($)      ; high byte of the current PC
    db low($)       ; low byte of the current PC

z88dk-z80asm provides no functions for this, although it is easy enough to achieve through expressions.  

    db ($FF00 & $)/$100 ; high byte of the current PC
    db ($00FF & $)      ; low byte of the current PC

## Strings
asm80 provides a directive for C-style strings - terinated with a NUL:

    .cstr("foo\n")  ; c-style strings

This is not accepted by the other assemblers, but it is trivial (and intuitive) to achieve the same result:

    db "foo\n",0    ; c-style strings

This also works on asm80 of course.  

However, zmac does not interpret escape sequences: \n \r \b etc.

