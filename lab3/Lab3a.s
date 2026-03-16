/*Author - Lab Tech. Last edited on Jan 14, 2022 */
/*-----------------DO NOT MODIFY--------*/
.global Welcomeprompt
.global printf
.global cr
.extern value
.extern getstring
.syntax unified

.text
Welcomeprompt:
/*-----------------Students write their subroutine here--------------------*/
/* 									NAME: Jenna Vervoort   ID: 1850478                     */

MOV r8, r0			 @ This is the base memory
MOV r9, #0			 @ This will be the index

LDR r0, =welcome @ Loading in the welcome message
BL printf				 @ Printing the welcome message
LDR r0, =prompt  @ Storing the prompt
B numEntry			 @ Going to the prompt for number of entries

numEntry:
BL printf        @ Printing the prompt
BL cr						 @ Moving to the next line
BL getstring		 @ Getting input
MOV r2, r0

CMP r2, #3       @ This checks if the number of entries is less than 3
BLT entryErrorL	 @ Branching to lower error
CMP r2, #10      @ This checks if the number of entries is more than 10
BGT entryErrorH	 @ Branching to higher error
B limits				 @ Branching to the next prompt

entryErrorL:
LDR r0, =errorM
B numEntry

entryErrorH:
LDR r0, =errorL
B numEntry

limits:
LDR r0, =lower
BL printf				 @ Printing the lower prompt
BL cr						 @ Moving to the next line
BL getstring		 @ Getting input
MOV r3, r0

LDR r0, =upper   @ Loading the upper prompt
BL printf        @ Printing the upper prompt
BL cr            @ Moving to the next line
BL getstring     @ Getting input
MOV r4, r0

CMP r3, r4
BGT limitsError
MOV r6, r2
LDR r0, =num
B loop

limitsError:
LDR r0, =limError
BL printf
B limits

loop:
CMP r6, #1			 @ Checking if it's the last entry
BEQ lastNum			 @ Branching to the lastNum prompt

LDR r0, =num
BL printf        @ Printing the num prompt
BL cr            @ Prompting for an input
BL getstring     @ Getting the value of the input
MOV r5, r0

CMP r5, r3
BLT rangeError
CMP r5, r4
BGT rangeError

ADD r1, r8, r9, LSL #2   @ r1 = base + index*4
STR r5, [r1]             @ Storing the number
ADD r9, r9, #1           @ index++

SUB r6, r6, #1    @ Counting down the entries
B loop					  @ Looping

rangeError:
LDR r0, =outRange	@ Loading the error message
BL printf					@ Printing the error message
B loop						@ Going back to loop

lastNum:
LDR r0, =last    @ Loading the last number prompt
BL printf				 @ Printing the last number prompt
BL cr						 @ Moving to the next line
BL getstring		 @ Getting input
MOV r5, r0			 @ Putting the input in r5

CMP r5, r3			 @ Checking if the number is above the lower limit
BLT lastError    @ Going to error message
CMP r5, r4			 @ Checking if the number is below the upper limit
BGT lastError		 @ Going to the error message

ADD r1, r8, r9, LSL #2
STR r5, [r1]
BX LR  				 		@ Returning from the subroutine

lastError:
LDR r0, =outRange	@ Loading the error message
BL printf					@ Printing the error message
B lastNum					@ Going back to the lastNum

/*---------------- Code ends here ----------------------------------*/
/*-----------------Add your strings here in the data section--------*/
.data
prompt:
.string "Please Enter the Number (3min - 10max) of Entries: "

welcome:
.string "Welcome to ECE 212 Bubble Sorting Program\n"

upper:
.string "Please Enter the Upper Limit: "

lower:
.string "Please Enter the Lower Limit: "

num:
.string "Please Enter a Number Followed by 'enter': "

last:
.string "Please Enter the Last Number Followed by 'enter': "

errorM:
.string "Invalid Entry. Please Enter More than 2 Entry: "

errorL:
.string "Invalid Entry. Please Enter Less than 11 Entry: "

limError:
.string "Error. Please Enter the Lower and Upper Limit Again: "

outRange:
.string "Invalid!!! Number Entered is not Within the Range: "
