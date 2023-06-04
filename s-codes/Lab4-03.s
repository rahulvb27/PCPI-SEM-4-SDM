;Program to arrange 'n' 32-bit numbers.
;Register R0 points to the address of ARRAY elements.
;n-elements are stored in ARRAY.

        AREA Sorting, CODE, READONLY
        ENTRY

        ; Declare constants
        ARRAY   EQU 0x4000         ; Memory location of the array
        SIZE    EQU 10             ; Number of elements in the array

        ; Reset vector
        RESET
            LDR SP, =0x7FFF         ; Set stack pointer
            BL main                 ; Branch to main function
            B RESET                 ; Loop back to RESET

        ; Main program
        main
            LDR R0, =ARRAY          ; Load address of the array
            LDR R1, =SIZE           ; Load size of the array

            MOV R2, R1              ; Initialize outer loop counter

    outerLoop
            MOV R3, R1              ; Initialize inner loop counter

    innerLoop
            LDR R4, [R0]            ; Load the current element
            LDR R5, [R0, #4]        ; Load the next element

            CMP R4, R5              ; Compare the current and next elements
            BLE skipSwap            ; Skip swapping if the current element is less than or equal to the next element

            STR R5, [R0]            ; Store the next element in the current position
            STR R4, [R0, #4]        ; Store the current element in the next position

    skipSwap
            ADD R0, R0, #4          ; Move to the next element
            SUBS R3, R3, #1         ; Decrement the inner loop counter
            BNE innerLoop           ; Repeat the inner loop until all elements are compared

            SUBS R2, R2, #1         ; Decrement the outer loop counter
            CMP R2, #0              ; Check if all elements have been sorted
            BNE outerLoop           ; Repeat the outer loop until all elements are sorted

            ; End of program
            MOV PC, LR              ; Return from main and end program

        END