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

start:
LDR r0, =welcome @ Loading in the welcome message
BL printf				 @ Printing the welcome message

LDR r0, =prompt  @ Storing the prompt
BL printf        @ Printing the prompt
BL cr						 @ Prompting for an input
BL getstring		 @ Getting the value of the input
LDR r1, =value   @ Loading the address of value into r1
LDR r2, [r1]     @ Taking the value of r1 and putting it into r2

LDR r0, =lower   @ Loading the lower prompt
BL printf				 @ Printing the lower prompt
BL cr						 @ Prompting for an input
BL getstring		 @ Getting the value of the input
LDR r1, =value	 @ Loading the address of value into r1
LDR r3, [r1]     @ Loading the value of value into r3

LDR r0, =upper   @ Loading the upper prompt
BL printf        @ Printing the upper prompt
BL cr            @ Prompting for an input
BL getstring     @ Getting the value of the input
LDR r1, =value   @ Loading the address of value into r1
LDR r4, [r1]     @ Loading the value of value into r4

LDR r0, =num   @ Loading the num prompt

loop:
CMP r2, #1
BEQ lastNum

BL printf        @ Printing the num prompt
BL cr            @ Prompting for an input
BL getstring     @ Getting the value of the input
LDR r1, =value   @ Loading the address of value into r1
LDR r4, [r1]     @ Loading the value of value into a register


SUB r2, r2, #1

lastNum:
LDR r0, =last   @ Loading the last number prompt

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
.string "Please Enter a Number: "

last:
.string "Please Enter the Last Number: "

errorMore:
.string "Invalid Entry. Please Enter More than 2 Entry: "

errorLess:
.string "Invalid Entry. Please Enter Less than 11 Entry: "

limError:
.string "Error. Please Enter the Lower and Upper Limit Again: "

outRange:
.string "Invalid!!! Number Entered is not Within the Range: "
