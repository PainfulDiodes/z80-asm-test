    output _succeed.bin

    jp START

    BLOCK $100-$    ; BLOCK is needed to pad out memory
    ORG $100        ; ORG on its own will not align code with position in memory

START:
    halt

    db high($)      ; high byte of the current PC
    db low($)       ; low byte of the current PC

    .include included.asm       ; directives can start with a . (or not)