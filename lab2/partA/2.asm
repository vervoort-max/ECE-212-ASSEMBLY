.text
.global start

start:
LDR R0, =0x20001000
LDR R1, [R0]
LDR R2, [R0, #4]
LDR R3, [R0, #8]
LDR R4, [R0, #16]

MOV R5, #0

loop:
CMP R5, R1
BEQ done

LSL R6, R5, #2
LSL R7, [R2, R6]
LDR R8, [R3, R6]
ADD R9, R7, R8
STR R9, [R4, R6]

ADD R5, R5, #1
B loop

done:
