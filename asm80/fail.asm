    .MACRO myorg addr   ; macro parameters need to be separated from the name by a comma
        org addr
    .ENDM

    MACRO myorg2,addr   ; macro/endm need to start with a .
        org addr
    ENDM

    jp START

    org $100

START:
    ld de,bc
    jp END

    db high($)          ; high not recognised - use msb
    db low($)           ; low not recognised - use lsb

    .align $100

    cstr("foo\n")       ; cstr needs to start with a .

    myorg $300

    include included.asm ; include needs to start with a .

    org $400

END:
    halt