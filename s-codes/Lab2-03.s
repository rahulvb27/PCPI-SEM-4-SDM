			    AREA COUNTBITS, CODE, READONLY
			    ENTRY

			    MOV		R0,#0
			    MOV		R1,#0
			    MOV		R2,#32
			    MOV		R3,#0x4F
LOOP		    MOVS	R3,R3,ROR #1
			    BHI		ONES
ZEROS		    ADD		R0,R0,#1
			    B		NEXTBIT
ONES		    ADD		R1,R1,#1
NEXTBIT		    SUBS	R2,R2,#1
			    BNE		LOOP

STOP		    B		STOP
			    END