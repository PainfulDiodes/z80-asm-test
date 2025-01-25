    output _fail.bin

    MACRO PADORG,addr   ; space must separate macro name from comma-delimited arguments
         IF $ < addr
         BLOCK addr-$
         ENDIF
         ORG addr
    ENDM        

SIMPLEPAD: MACRO addr
        BLOCK addr-$
    ENDM       

    jp start        ; labels are case-sensitive

    ORG $100        ; ORG will not align code with position in memory
                    ; the following will not assemble to $100 in _fail.bin / _fail.hex

START:
    ld de,bc
    jp END

    db msb($)       ; msb not recognised - use high() instead
    db lsb($)       ; lsb not recognised - use low() instead

    align $100

    cstr "foo\n"      ; cstr not recognised for c-style strings - use db str,0

    align $100

.include included.asm   ; by default directives cannot be put at the start of a line so this will fail. 
                        ; use the --dirbol command switch to make this acceptable

    ORG $400            ; ORG will not align code with position in memory

  END:                  ; labels must generally be placed at the start of the line
    halt