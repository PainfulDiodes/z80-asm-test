    jp START

    align $100      ; pad to beginning of next memory page

START:
    ld de,bc        ; successfully translates to ld d,b followed by ld e,c [50,59]
    jp END

    db ($FF00 & $)/$100 ; high byte of the current PC
    db ($00FF & $)      ; low byte of the current PC

    align $100

    db "foo\n",0     ; c-style strings using DB, escaped control characters allowed

    align $100      ; pad to beginning of next memory page

    include "included.asm"

    align $100

END:
    halt