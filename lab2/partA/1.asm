.text
.global start

start:
LDR R0, =0x20001000 @size of the array
LDR R1, [R0]
LDR R2, [R0, #4] @Address of the first array
LDR R3, [R0, #8] @Address of the second array
LDR R4, [R0, #12] @Address of where to store the sum with Register Indirect w Offset

