.syntax unified
.thumb
.text
.global main

main:
LDR R0, =0x20001000
LDR R1, [R0] @Size of the array
LDR R2, [R0, #4] @Address of the first array
LDR R3, [R0, #8] @Address of the second array
LDR R4, [R0, #12] @Address of where to store the sum with Register Indirect w Offset

MOV R5, #0 @i < 3 - Loop counter

loop:
CMP R5, #3 @Checking if counter is 3
BEQ done @leaving loop

LSL R6, R5, #2 @Essentially - offset = i(R5) * 4(LSL R5, #2)
LDR R7, [R2, R6] @A[i] - also (R2 + R6)
LDR.w R8, [R3, R6] @B[i] - also (R3 + R6)

ADD.w R9, R7, R8 @A[i] + B[i]
STR.w R9, [R4, R6]

ADD R5, R5, #1 @Increment counter

B loop

done:
