    output _succeed.bin

    MACRO PADORG addr
         IF $ < addr
         BLOCK addr-$
         ENDIF
         ORG addr
    ENDM 

SIMPLEPAD: MACRO addr ; macroname MACRO param format is supported (label must be at beginning of line)
        BLOCK addr-$
    ENDM       

    jp START

    PADORG $100     ; BLOCK is needed to pad out memory (ALIGN might also be used)
    ORG $100        ; ORG on its own will not align code with position in memory

START:
    jp END

    db high($)      ; high byte of the current PC
    db low($)       ; low byte of the current PC

    db "foo",0      ; c-style strings using DB

    align $100      ; pad to beginning of next memory page

    .include included.asm       ; directives can start with a . (or not)

    SIMPLEPAD $300     ; BLOCK is needed to pad out memory (ALIGN might also be used)
    ORG $300        ; ORG on its own will not align code with position in memory, but multiple orgs are allowed

END:
    halt