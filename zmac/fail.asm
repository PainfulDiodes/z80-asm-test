    myorg MACRO addr
        org addr
    ENDM

    jp START

    org $100

START:
    ld de,bc        ; fails to translate to ld d,b followed by ld e,c [50,59]
    jp END

    db msb($)      ; msb not recognised
    db lsb($)      ; lsb not recognised

    align $100      ; align not recognised

    .cstr "foo\n"      ; cstr not recognised for c-style strings - use db str,0
    db "foo\n",0      ; escaped control characters not interpreted (no error)

    align $100

END:
    halt