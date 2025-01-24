    output _succeed.bin

    jp START

    BLOCK $100-$    ; BLOCK is needed to pad out memory (ALIGN might also be used)
    ORG $100        ; ORG on its own will not align code with position in memory

START:
    halt

    db high($)      ; high byte of the current PC
    db low($)       ; low byte of the current PC

    db "foo",0      ; c-style strings using DB

    align $100      ; pad to beginning of next memory page

    .include included.asm       ; directives can start with a . (or not)