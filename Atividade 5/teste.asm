.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
    ; Initialize data segment
    MOV AX, @DATA
    MOV DS, AX

    ; Initialize variables
    MOV BL, 'a'    ; starting character
    MOV CL, 0     ; counter

LOOP_START:
    ; Print current character
    MOV DL, BL
    MOV AH, 02h
    INT 21H

    ; Increment character and counter
    INC BL
    INC CL

    ; Check if we've reached the end of the line (4 characters)
    CMP CL, 4
    JNE LOOP_START

    ; Print newline
    MOV DL, 13
    MOV AH, 02H
    INT 21H
    MOV DL, 10
    MOV AH, 02h
    INT 21h
    MOV CL, 0  ; reset counter

LOOP_CONTINUE:
    ; Check if we've reached the end of the alphabet
    CMP BL, 'z'+1
    JE FIM_PROGRAMA

    ; Continue printing characters
    JMP LOOP_START

FIM_PROGRAMA:
    ; Exit program
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN