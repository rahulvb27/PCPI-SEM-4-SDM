;Program to add 2 numbers
;R0 and R1 as source registers
;R2 contains result
			AREA Program1, CODE, READONLY

			ENTRY
			MOV R0, #0x45		; initialize R0 with 45H
			MOV R1, #0x34	    ; initialize R1 with 34H
			ADD R2, R0, R1	    ; R2 = R0 + R1
STOP		B	STOP			; Stay Here
			END					; End of file