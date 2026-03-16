/*Author - Lab Tech. Last edited on Jan 14, 2022 */
/*-----------------DO NOT MODIFY--------*/
.global Sort
.global printf
.global cr
.extern value
.extern getstring
.syntax unified

.text
Sort:
/*-----------------Students write their subroutine here--------------------*/
/* 									NAME: Jenna Vervoort   ID: 1850478                     */

SUB r3, r2, #1			@ This is the outer loop counter

outerLoop:
CMP r3, #0					@ Checking if the counter is 0
BEQ done						@ Going to the end if the counter is 0

MOV r4, #0					@ Setting inner loop counter

innerLoop:
CMP r4, r3					@	Checking the counter
BGE next						@ End of inner loop

LSL r1, r4, #2
ADD r6, r5, r1
LDR r7, [r6]
LDR r8, [r6, #4]

CMP r7, r8
BLE noSwap

STR r8, [r6]
STR r7, [r6, #4]

noSwap:
ADD r4, r4, #1			@ Incrementing the counter
B innerLoop					@ Going back to the loop

next:
SUB r3, r3, #1	  	@ Counting down
B outerLoop					@ Looping again

done:
LDR r0, =sortType	  @ Loading the bubble sort string
BL printf						@ Printing the bubble string
BX LR								@ Returning from the subroutine

/*-------Code ends here ---------------------*/
/*-----------------Add your strings here in the data section--------*/
.data
sortType:
.string "The Numbers are Sorted with Bubblesort Algorithm"
