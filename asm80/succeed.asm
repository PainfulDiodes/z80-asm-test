    .MACRO myorg,addr
        org addr
    .ENDM

    jp START

    org $100

START:
    ld de,bc        ; successfully translates to ld d,b followed by ld e,c [50,59]
    jp END

    db msb($)       ; high byte of the current PC
    db lsb($)       ; low byte of the current PC

    .align $100     ; pad to beginning of next memory page

    .cstr("foo\n")  ; c-style strings

    myorg $300      ; multiple orgs

    .include included.asm

    org $400

END:
    halt