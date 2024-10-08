TITLE Atividade7 - Multiplicação
.MODEL SMALL
.STACK 100h

.DATA
    MSG1 DB 13,10,'Digite o multiplicando: $'
    MSG2 DB 13,10,'Digite o multiplicador: $'
    MSG3 DB 13,10,'Produto: $'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AH, 9
    LEA DX, MSG1
    INT 21H

    MOV AH, 1
    INT 21H
    SUB AL, 30h
    MOV BL, AL

    MOV AH, 9
    LEA DX, MSG2
    INT 21H

    MOV AH, 1
    INT 21H
    MOV CL, AL
    SUB CL, 30h

    MOV BH, 0
REALIZAR_MULTIPLICACAO:
    CMP CL, 0
    JE MULTIPLICACAO_FINALIZADA
    ADD BH, BL
    DEC CL
    JMP REALIZAR_MULTIPLICACAO

MULTIPLICACAO_FINALIZADA:
    MOV AH, 9
    LEA DX, MSG3
    INT 21H

    ADD BH, 30h
    MOV AH, 2
    MOV DL, BH
    INT 21H

    MOV AH, 4Ch
    INT 21H

    MAIN ENDP
END MAIN