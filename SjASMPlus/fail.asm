    output _fail.bin

    jp START

    ORG $100        ; ORG on its own will not align code with position in memory
                    ; the following will not assemble to $100 in _fail.bin / _fail.hex

START:
    halt

    db msb($)       ; not supported - use high()
    db lsb($)       ; not supported - use low()

    cstr "foo"      ; c-style strings are not recognised

.include included.asm ; by default directives cannot be put at the start of a line fo this will fail