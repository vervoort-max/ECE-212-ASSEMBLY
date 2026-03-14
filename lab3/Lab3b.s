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






done:
LDR r1, =sortType
BL printf

/*-------Code ends here ---------------------*/

/*-----------------Add your strings here in the data section--------*/
.data

sortType:
.string "The Numbers are Sorted with Bubblesort Algorithm"
