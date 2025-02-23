    myorg MACRO addr
        org addr
    ENDM

    jp START

    org $100

START:
    ld d,b 
    ld e,c
    jp end          ; labels are case-insensitive

    db high($)      ; high byte of the current PC
    db low($)       ; low byte of the current PC

    org $200        ; org pads memory

    db "foo",$0a,0  ; c-style strings using DB, escaped control characters not recognised

    myorg $300      ; org with padding using macro

    .include included.asm ; directives can start with a . (or not)

    org $400         ; org with padding

END:
    halt