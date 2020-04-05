
.thumb
.cpu    cortex-m0
.globl _start
_start:
.word 0x20001000
.word reset
.word loop
.word loop
.thumb_func
reset:
    bl notmain
.thumb_func
loop:
    b .

