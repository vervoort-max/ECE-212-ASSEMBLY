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
LDR r0, =0x20001000

LDR r1, =type
BL printf

LDR r1, =numE
BL printf
LDR r1, [r0]
BL printf

LDR r1, =sorted
BL printf

MOV r3, [r0]
B printLoop

printLoop:
CMP r3, #0
BEQ done


@print stuff here 

SUB r3, r3, #1

done:
LDR r1, =end
BL printf

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
