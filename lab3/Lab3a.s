/*Author - Lab Tech. Last edited on Jan 14, 2022 */
/*-----------------DO NOT MODIFY--------*/
.global Welcomeprompt
.global printf
.global cr
.extern value
.extern getstring
.syntax unified

/* REMEBER I CHANGED ~/.BASHRC LINKER SO THIS WOULD COMPLILE ON MY LAPTOP */

.text
Welcomeprompt:
/*-----------------Students write their subroutine here--------------------*/
/* 									NAME: Jenna Vervoort   ID: 1850478                     */

LDR r0, =welcome @ Loading in the welcome message
BL printf				 @ Printing the welcome message
B numEntry			 @ Going to the prompt for number of entries
LDR r0, =prompt  @ Storing the prompt

numEntry:
BL printf        @ Printing the prompt
BL cr						 @ Prompting for an input
BL getstring		 @ Getting the value of the input
LDR r1, =value   @ Loading the address of value into r1
LDR r2, [r1]     @ Taking the value of r1 and putting it into r2

CMP r2, #3       @ This checks if the number of entries is less than 3
BLT entryErrorL
CMP r2, #10
BGT entryErrorH
B limits

entryErrorL:
LDR r0, =errorMore
B numEntry

entryErrorH:
LDR r0, =errorLess
B numEntry

limits:
LDR r0, =lower
BL printf				 @ Printing the lower prompt
BL cr						 @ Prompting for an input
BL getstring		 @ Getting the value of the input
LDR r1, =value	 @ Loading the address of value into r1
LDR r3, [r1]     @ Loading the lower limit into r3

LDR r0, =upper   @ Loading the upper prompt
BL printf        @ Printing the upper prompt
BL cr            @ Prompting for an input
BL getstring     @ Getting the value of the input
LDR r1, =value   @ Loading the address of value into r1
LDR r4, [r1]     @ Loading the upper limit into r4

CMP r3, r4
BGT limitsError
MOV r6, r2
B loop

limitsError:
LDR r0, =limError
BL printf
B limits

loop:
CMP r6, #1
BEQ lastNum

BL printf        @ Printing the num prompt
BL cr            @ Prompting for an input
BL getstring     @ Getting the value of the input
LDR r1, =value   @ Loading the address of value into r1
LDR r4, [r1]     @ Loading the value of value into a register

SUB r6, r6, #1   @ Counting down the entries
B loop

rangeError:
LDR r0, =outRange
BL printf

lastNum:
LDR r0, =last   @ Loading the last number prompt
BL printf
BL cr
BL getstring
LDR r1, =value

done:

/*-------Code ends here ---------------------*/

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

errorMore:
.string "Invalid Entry. Please Enter More than 2 Entry: "

errorLess:
.string "Invalid Entry. Please Enter Less than 11 Entry: "

limError:
.string "Error. Please Enter the Lower and Upper Limit Again: "

outRange:
.string "Invalid!!! Number Entered is not Within the Range: "
