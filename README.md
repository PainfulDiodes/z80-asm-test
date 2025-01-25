# z80-asm-test
## Comparative Z80 Assembler Test

This comparison is by no means exhaustive in terms of tools compared - I was interested in Z80 cross-assemblers that could be built from source for MacOS or Linux, and even there I picked those that most interested be by quite personal criteria. I have also included asm.80 because somewhaat arbitrarily this became my reference.

This comparison is also not thorough - I have covered the differences which became obvious when attempting to build an open source Z80 project - I am sure there will be other differences.

For each assembler there are succeed.asm and fail.asm source files. The succeed.asm files have been written to generate an identical output across the assembers which is provided in _succeed.bin and _succeed.hex

The fail.asm files naturally seek to show which alternative syntaxes seem not to work (but may work with another assember).
