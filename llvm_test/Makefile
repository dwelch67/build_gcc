
all :
	clang -c start.s -o start.o
	clang -O2 -flto=thin -fomit-frame-pointer -c test.c
	clang -O2 -flto=thin -fomit-frame-pointer -c one.c
	ld.lld -T memmap start.o test.o one.o -o test.elf
	llvm-objdump -d test.elf > test.list

clean:
	rm -f *.o
	rm -f *.list
	rm -f *.elf
