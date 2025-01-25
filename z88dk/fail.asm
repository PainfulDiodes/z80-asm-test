    jp START

    ORG $100        ; ORG will not align code with position in memory

START:
    ld de,bc
    jp end          ; labels are case-sensitive fail.asm:7: error: undefined symbol: end   

    db high($)      ; high not recognised, use an expression
    db msb($)       ; msb not recognised, use an expression
    db low($)       ; low not recognised, use an expression
    db lsb($)       ; lsb not recognised, use an expression

    .cstr("foo\n")   ; cstr not recognised for c-style strings - use db str,0

    align $100

    .include included.asm       ; directives cannot start with a . 
    include included.asm        ; include needs quotes

    ORG $300        ; error: ORG redefined

END:
    halt