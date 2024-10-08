TITLE BINARIO
.MODEL SMALL
.STACK 100h
.DATA
    MSG1 DB 'Insira o numero binario: ', 13,10,'$'
    MSG2 DB 'Numero binario invalido', 13,10,'$'
    MSG3 DB 'Numero binario inserido: ', 13,10,'$'
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Imprime mensagem de entrada
    LEA DX, MSG1
    MOV AH, 09
    INT 21H

    ; Lê o número binário
    MOV CX, 16
    MOV AH, 1h
    XOR BX, BX
    INT 21h

    ; Loop para ler os dígitos
    TOPO:
        CMP AL, 0Dh
        JE FIM
        CMP AL, '0'
        JB ERRO
        CMP AL, '1'
        JA ERRO
        AND AL, 0Fh
        SHL BX, 1
        OR BL, AL
        INT 21h
        LOOP TOPO

    ; Imprime o número binário
    FIM:
        LEA DX, MSG3
        MOV AH, 09
        INT 21H
        MOV CX, 16
        MOV AH, 2h

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

    ; Tratamento de erro
    ERRO:
        LEA DX, MSG2
        MOV AH, 09
        INT 21H
        MOV AH, 4CH
        INT 21H

MAIN ENDP
END MAIN