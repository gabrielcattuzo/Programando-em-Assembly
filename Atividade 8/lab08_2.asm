TITLE Lab08_2
.MODEL SMALL
.STACK 100h
.DATA
    MSG1 DB 13,10,'Numero binario: $'
.CODE
MAIN PROC
    ; Inicializa o segmento de dados
    MOV AX, @DATA
    MOV DS, AX

    ; Imprime mensagem de saída
    LEA DX, MSG1
    MOV AH, 09
    INT 21H

    ; Imprime o número binário
    MOV CX, 16
    MOV AH, 2h
    MOV BX, 10101010b

    ; Loop para imprimir os dígitos
    IMPRIME:
        ROL BX, 1
        JC IMPRIME_1
        MOV DL, '0'
        JMP IMPRIME_FIM
        IMPRIME_1:
            MOV DL, '1'
        IMPRIME_FIM:
            INT 21H
            LOOP IMPRIME

    ; Sai do programa
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN