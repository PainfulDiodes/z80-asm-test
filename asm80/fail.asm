    .MACRO myorg addr ; macro parameters need to be separated from name by acomme
        org addr
    .ENDM

    MACRO myorg2,addr ; macro/endm require a .
        org addr
    ENDM

    jp START

    org $100

START:
    ld de,bc        ; successfully translates to ld d,b followed by ld e,c [50,59]
    jp END

    db msb($)       ; high byte of the current PC
    db lsb($)       ; low byte of the current PC

    .align $100     ; pad to beginning of next memory page

    cstr("foo\n")  ; cstr requires a .

    myorg $300      ; multiple orgs. use of macro

    include included.asm ; include requires a .

    org $400

END:
    halt