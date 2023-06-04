;Program to count number of even and odd numbers.
;Input data stored at VALUE1.
;Output in R8 and R9 and in memory location RESULT.

            AREA Program, CODE, READONLY

            ENTRY
            MOV     R8, #0              ;For storing even count
            MOV     R9, #0              ;For storing odd count
            LDR     R0, =VALUE1         ;Load address to R0
            LDR     R5, [R0], #4        ;Load counter from first location
NEXT
            LDR     R2, [R0], #4        ;Load number to R2
            LSRS    R2, #1              ;Shift number to right
            BCC     EVEN                ;If C=0 go to EVEN          
            ADD     R9, #1              ;If C=1 R9 = R9 + 1
            BAL     LOOP                ;Always jump to LOOP
EVEN 
            ADD     R8, #1              ;If C=0 R8 = R8 +1
LOOP
            SUBS    R5, #1              ;Decrement counter
            BNE     NEXT

            LDR     R4, =RESULT         ;Load address of result in R4
            STMIA   R4!, {R8,R9}        ;Store R8 at R4 and R9 at (R4+4)
STOP        B       STOP

VALUE1      DCD     0x0000005, 0x11112222, 0x33335555, 0x11117777, 0x24681199, 0x44444444

            AREA    DATA2, DATA, READWRITE
RESULT      DCD     0x0, 0x0
            END                         ;End of File