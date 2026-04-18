.syntax unified
.cpu cortex-m4
.thumb

.global vtable
.global reset_handler

.type vtable, %object
vtable:
    .word __stack_start
    .word reset_handler + 1

.type reset_handler, %function
reset_handler:
    bl lab1             
loop:
    b loop             
