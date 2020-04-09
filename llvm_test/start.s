
.text
.cpu    cortex-m0
.code   16
.globl _start
_start:
.word 0x20001000
.word reset
.thumb_func
reset:
    bl testone
    bl testtwo
    b .

