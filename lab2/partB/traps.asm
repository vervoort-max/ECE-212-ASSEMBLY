.text
.global start

start:
LDR R0, =0x20001000
LDR R1, [R0] @Number of data points (N)
LDR R2, [R0, #4] @Address of where the X data points are stored
LDR R3, [R0, #8] @Address of where the Y data points are stored
LDR R4, [R0, #12] @Address of temporary storage space
LDR R5, [R0, #16] @Address of where to store the final value

LDR R6, [R2] @ x0
LDR R7, [R2, #4] @x1
SUB R8, R7, R6

CMP R8, #1
BEQ dx1
CMP R8, #2
BEQ dx2

dx1:

dx2:
