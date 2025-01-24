sjasmplus --lst=_succeed.lst succeed.asm
hexdump -C _succeed.bin > _succeed.hex
sjasmplus --lst=_fail.lst fail.asm
hexdump -C _fail.bin > _fail.hex
