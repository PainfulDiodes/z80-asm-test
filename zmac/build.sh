rm _*.{bin,hex,lst}

zmac succeed.asm
mv zout/succeed.cim _succeed.bin
mv zout/succeed.lst _succeed.lst
hexdump -C _succeed.bin > _succeed.hex

zmac fail.asm
mv zout/fail.cim _fail.bin
mv zout/fail.lst _fail.lst
hexdump -C _fail.bin > _fail.hex

rm zout/*.*
