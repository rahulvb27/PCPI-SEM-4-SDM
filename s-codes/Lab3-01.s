;Program to add n numbers.
;Result is stored in R0.
;Input data is stored in array part of code. 

            Area Naddition, CODE, READONLY
            
            ENTRY
            MOV     R0, #0          ;R0 is initialized to 0
            MOV     R5, #5          ;R5 is counter registers
            LDR     R2, =array      ;Load array base-address
loop        LDR     R1, [R2], #4    ;Load array element
            ADD     R0, R0, R1      ;R0 = R0 + R1
            SUB     R5, R5, #1      ;Decrement counter
            CMP     R5, #0          ;Checking counter value
            BNE     loop            ;Repeat if not zero
array       DCD     0x45, 0x31, 0x27, 0x61, 0x29
            END                     ;End of File