;Program to find the sum of first n natural numbers.
;Result is stored in register R0.
;Value in register R3 is acting like input data to code.

            AREA FNaddition, CODE, READONLY

            ENTRY
            MOV     R0, #0         ;R0 is initialized to 0
            MOV     R5, #10        ;R5 is counter register
            MOV     R3, #1         ;Data register
LOOP        ADD     R0, R0, R3     ;R0 = R0 + R3
            ADD     R3, R3, #1     ;R3 = R3 + 1
            SUB     R5, R5, #1     ;Decrement counter
            CMP     R5, #0         ;Checking counter value
            BNE     LOOP           ;Repeat if not zero
            END                    ;End of File