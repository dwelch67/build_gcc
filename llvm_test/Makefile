
all :
	#arm-none-eabi-as start.s -o start.o
	#llvm-as start.s -o start.o
	clang -c start.s -o start.o
	clang -O2 -fomit-frame-pointer -c notmain.c -o notmain.o
	clang -O2 -fomit-frame-pointer -c fun.c -o fun.o
	#arm-none-eabi-as notmain.S -o notmain.o
	#arm-none-eabi-as fun.S -o fun.o
	#arm-none-eabi-ld -T memmap start.o notmain.o fun.o -o basic.elf
	ld.lld -T memmap start.o notmain.o fun.o -o basic.elf
	#arm-none-eabi-objdump -D basic.elf > basic.list
	llvm-objdump -D basic.elf > basic.list
	clang -fomit-frame-pointer -c -emit-llvm notmain.c -o notmain.bc
	clang -fomit-frame-pointer -c -emit-llvm fun.c -o fun.bc
	llc $(LLCOPS) notmain.bc -filetype=obj -o notmain.not.o
	llc $(LLCOPS) fun.bc -filetype=obj -o fun.not.o
	#arm-none-eabi-ld -T memmap start.o notmain.not.o fun.not.o -o not.elf
	ld.lld -T memmap start.o notmain.not.o fun.not.o -o not.elf
	#arm-none-eabi-objdump -D not.elf > not.list
	llvm-objdump -D not.elf > not.list
	llvm-link notmain.bc fun.bc -o notmain.not.bc
	opt -O2 notmain.not.bc -o notmain.opt.bc
	llc $(LLCOPS) notmain.opt.bc -filetype=obj -o notmain.opt.o
	#arm-none-eabi-ld -T memmap start.o notmain.opt.o -o opt.elf
	ld.lld -T memmap start.o notmain.opt.o -o opt.elf
	#arm-none-eabi-objdump -D opt.elf > opt.list
	llvm-objdump -D opt.elf > opt.list

clean:
	rm -f *.o
	rm -f *.list
	rm -f *.elf
	rm -f *.bc

