/*Author - Lab Tech. Last edited on Jan 14, 2022 */
/*-----------------DO NOT MODIFY--------*/
.global Display
.global printf
.global cr
.extern value
.extern getstring
.syntax unified

.text
Display:
/*-----------------Students write their subroutine here--------------------*/
/* 						NAME: Jenna Vervoort   ID: 1850478													 */

LDR r0, =type		@ Loading the bubble sort string
BL printf				@ Printing it
BL cr						@ Going to the next line

LDR r0, =numE
BL printf
LDR r0, r2
BL printf
BL cr

LDR r0, =sorted
BL printf

MOV r3, r2
B printLoop

printLoop:
CMP r3, #0			@ Seeing if all numbers have been printed
BEQ done				@ Going to the end of the program
SUB r1, r2, r3
LSL r1, r1, #2
ADD r1, r5, r1
LDR r0, [r1]
BL printf
BL cr	

SUB r3, r3, #1	@ Counting down

done:
LDR r0, =end		@ Loading end statement
BL printf				@ Printing the end statement
BX LR						@ Returning from the subroutine

/*-------Code ends here ---------------------*/
/*-----------------Add your strings here in the data section--------*/
.data
type:
.string "The Numbers are Sorted with Bubblesort Algorithm"

numE:
.string "The Number of Entries Entered Was "

sorted:
.string "Sorted from Smallest to Biggest, the Numbers are: "

end:
.string "Program Ended"
