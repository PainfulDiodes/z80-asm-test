# z80-asm-test
## Comparative Z80 Assembler Test

I was interested in consistency / standards among Z80 cross-assemblers that could be built from source for MacOS or Linux, and within that category I chose to compare several that for various reasons seemed  interesting to me:

* [SjASMPlus](https://github.com/z00m128/sjasmplus) 
* [z88dk-z80asm](https://github.com/z88dk/z88dk/wiki/Tool---z80asm)
* [zmac](https://github.com/gp48k/zmac/tree/master)

I have also compared these with https://www.asm80.com which is accessible withough build / install - in a browser.

This comparison is not thorough - I have covered only the differences which became obvious when attempting to build an open source Z80 project - I am sure there will be others.

For each assembler I have produced succeed.asm and fail.asm source files. The succeed.asm files have been written to generate an identical binary output across the assembers, and the generated outputs are provided in _succeed.bin and _succeed.hex files.

The fail.asm files naturally enough seek to show which syntaxes work in one assembler but not all.

In some cases I found a command line switch which provided a resolution; I may have missed some options and so some of the differences may yet be resolvable.

The differences in syntax are summarised below.

## org and align directives
asm80 and zmac will pad out memory with NULs when encountering an ORG directive so that the relative positions of code sections in memory are consistent with how the assembler resolves addresses. This makes it easier to lay out code for RSTs and interrupts using multiple ORG directives.

z88dk-z80asm doesn't accept multiple ORG directives in the same SECTION which seems to imply that it doesn't accept multiple ORG directives in the same file. It does however allow ALIGN directives which can be used to much the same effect.

SjASMPlus allows multiple ORG directives, and these influence how instructions are assembled, but it does not automatically pad memory at an ORG directive. It does however support the use of ALIGN and also provides a BLOCK directive which can be used to pad ORG boundaries with slightly more control than ALIGN.

## 16-bit register loading pseudo-ops
A pseudo-op such as:

    ld de,bc

Is equivalent to:

    ld d,b
    ld e,c

All of the assemblers apart from zmac translated these pseudo-ops as expected.

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
asm80 provides a directive for C-style strings - terminated with a NUL:

    .cstr("foo\n")  ; c-style strings

This is not accepted by the other assemblers, but it is trivial (and intuitive) to achieve the same result:

    db "foo\n",0    ; c-style strings

This also works on asm80 of course.  

However, zmac does not interpret escape sequences: \n \r \b etc.

## Macros
asm80 seems peculiar in that it requires a comma between macro name and arguments:

    .MACRO myorg,addr
        org addr
    .ENDM

Rather than:

    .MACRO myorg addr
        org addr
    .ENDM

## Labels, directives and formatting
Labels are case-sensitive in SjASMPlus and z88dk-z80asm, but not in zmac and asm80.

SjASMPlus generally expects labels at the start of a line, and does not allow lines to start with a directive - but this latter restriction can be relaxed by using a command line switch: --dirbol

asm80 and z88dk-z80asm do not seem to mind about whitespace at the start of a line, zmac seems generally not to mind, although it objects to starting a line with an ORG directive (there may of course be other exceptions).

SjASMPlus and zmac allow directives to begin with or without a "." 

z88dk-z80asm does not accept directives with a "."  

asm80 seems fussy around this: .include, .macro, .endm, .cstr all require a ".", whereas org, align, lsb, msb do not.

