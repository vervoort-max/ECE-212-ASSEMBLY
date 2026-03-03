.text
.global _start

_start:
	LDR r0, =0x20001000
	LDR r1, =0x20002000

loop: 
	LDR r2, [r0], #4
	AND r2, r2, #0xFF

	CMP r2, #0x0D
	BEQ done

	CMP r2, #'0'
	BLT invalid
	CMP r2, #'9'
	BLE digit

	CMP r2, #'A'
	BLT check_lower
	CMP r2, #'F'
	BLE upper

check_lower:
	CMP r2, #'a'
	BLT invalid
	CMP r2, #'f'
	BLE lower

invalid:
	MOV r3, #-1
	B store

digit: 
	SUB r3, r2, #'0'
	B store

upper: 
	SUB r3, r2, #'A'
	ADD r3, r3, #10
	B store

lower:
	SUB r3, r2, #'a'
	ADD r3, r3, #10

store:
	STR r3, [r1], #4
	B loop

done: 
	B done
