.syntax unified
.thumb
.text
.global main

main:
LDR R0, =0x20001000
LDR R1, [R0]
LDR R2, [R0, #4]
LDR R3, [R0, #8]
LDR R4, [R0, #20]

MOV R5, R1

loop:
CMP R5, #0
BEQ done

LDR R7, [R2], #4
LDR R8, [R3], #4
ADD R9, R7, R8
STR R9, [R4], #4

SUB R5, R5, #1
B loop

done:
