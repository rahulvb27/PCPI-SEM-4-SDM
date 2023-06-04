;Program to find the difference of two 64-bit numbers.
;Difference is stored in RESULT.
;Values in NUM1 and NUM2 are two 64-bit input numbers.

        AREA Subtraction, CODE, READONLY
        ENTRY

        ; Declare constants
        NUM1    EQU 0x4000         ; Memory location of first 64-bit number
        NUM2    EQU 0x4010         ; Memory location of second 64-bit number
        RESULT  EQU 0x4020         ; Memory location to store the result

        ; Reset vector
        RESET
            LDR SP, =0x7FFF         ; Set stack pointer
            BL main                 ; Branch to main function
            B RESET                 ; Loop back to RESET

        ; Main program
        main
            LDR R0, =NUM1           ; Load address of first number
            LDR R1, =NUM2           ; Load address of second number

            ; Perform subtraction
            LDMIA R0!, {R2-R5}      ; Load first number into R2-R5 (64-bit)
            LDMIA R1!, {R6-R9}      ; Load second number into R6-R9 (64-bit)
            SUBS R2, R2, R6         ; Subtract lower 32 bits
            SBCS R3, R3, R7         ; Subtract with borrow and higher 32 bits
            SBCS R4, R4, R8         ; Subtract with borrow and higher 32 bits
            SBCS R5, R5, R9         ; Subtract with borrow and higher 32 bits

            ; Store the result
            STMIA RESULT, {R2-R5}   ; Store the result in RESULT

            ; End of program
            MOV PC, LR              ; Return from main and end program

        END