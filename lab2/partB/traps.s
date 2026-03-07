.syntax unified
.thumb
.text
.global main

main:
LDR R0, =0x20001000
LDR R1, [R0] @Number of data points (N)
LDR R2, [R0, #4] @Address of where the X data points are stored
LDR R3, [R0, #8] @Address of where the Y data points are stored
LDR R4, [R0, #12] @Address of temporary storage space
LDR R5, [R0, #16] @Address of where to store the final value

LDR R6, [R2] @ x0
LDR R7, [R2, #4] @x1
SUB R8, R7, R6

MOV r9, #0
MOW R10, #0
MOV R11, #0

trap_loop:
SUB R12, R1, #1
CMP R11, R12
BEQ done

LSL R0, R11, #2

LDR R6, [R3, R0]
ADD R13, R0, #4
LDR R7, [R3, R13]

ADD R8, R6, R7

CMP R8, #1
BEQ dx1
CMP R8, #2
BEQ dx2

dx4:

dx2:

dx1:

next:
ADD R11, R11, #1
B trap_loop

done:
CMP R10, #0
BEQ store
ADD R9, R9, #1

store:
STR R9, [R5]
BX lr
	
