.syntax unified
.cpu cortex-m4
.thumb

.global lab1
.type lab1, %function
lab1:
    push {r4, r5, lr}

    mov r0, #20
    mov r1, #10
    mov r2, #4

    add r3, r0, r1       @ r3 = r0 + r1
    lsr r3, r3, #1       @ r3 = r3 / 2

    mov r4, #1
    mov r5, r2

fact_loop:
    cmp r5, #1
    ble fact_done
    mul r4, r4, r5       @ r4 = r4 * r5
    sub r5, r5, #1       @ r5 = r5 - 1
    b fact_loop

fact_done:
    add r0, r3, r4       @ r0 = r3 + r4

    pop {r4, r5, pc}
