    output _fail.bin

    jp START

    ORG $100        ; ORG on its own will not align code with position in memory
                    ; the following will not assemble to $100 in _fail.bin / _fail.hex

START:
    halt

    db msb($)       ; not supported - use high() instead
    db lsb($)       ; not supported - use low() instead

    cstr "foo"      ; cstr not recognised for c-style strings - use db str,0

    align $100

.include included.asm   ; by default directives cannot be put at the start of a line so this will fail. 
                        ; use the --dirbol command switch to make this acceptable
