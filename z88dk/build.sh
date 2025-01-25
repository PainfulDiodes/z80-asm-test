rm _*.{bin,hex,lst}
z88dk-z80asm -v -b -l succeed.asm
mv succeed.bin _succeed.bin
mv succeed.lis _succeed.lst
rm succeed.o
hexdump -C _succeed.bin > _succeed.hex
z88dk-z80asm -v -b -l fail.asm
mv fail.bin _fail.bin
mv fail.lis _fail.lst
rm fail.o
hexdump -C _fail.bin > _fail.hex
