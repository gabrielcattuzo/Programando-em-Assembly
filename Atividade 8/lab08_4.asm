TITLE Lab08_4
.MODEL SMALL
.STACK 100h
.DATA
    MSG1 DB 13,10,'Numero hexadecimal: $'
.CODE
MAIN PROC
    ; Inicializa o segmento de dados
    MOV AX, @DATA
    MOV DS, AX

    ; Imprime mensagem de saída
    LEA DX, MSG1
    MOV AH, 09
    INT 21H

    ; Imprime o número hexadecimal
    MOV AH, 2h
    MOV BX, 0A2B4h

    ; Imprime o dígito mais significativo
    MOV DL, BH
    SHR DL, 4
    CMP DL, 10
    JB IMPRIME_0
    ADD DL, 55
    JMP IMPRIME_FIM
    IMPRIME_0:
        ADD DL, 48
    IMPRIME_FIM:
        INT 21H

    ; Imprime o segundo dígito
    MOV DL, BH
    AND DL, 0Fh
    CMP DL, 10
    JB IMPRIME_1
    ADD DL, 55
    JMP IMPRIME_FIM2
    IMPRIME_1:
        ADD DL, 48
    IMPRIME_FIM2:
        INT 21H

    ; Imprime o terceiro dígito
    ROL BX, 8
    MOV DL, BH
    SHR DL, 4
    CMP DL, 10
    JB IMPRIME_2
    ADD DL, 55
    JMP IMPRIME_FIM3
    IMPRIME_2:
        ADD DL, 48
    IMPRIME_FIM3:
        INT 21H
    ; Imprime o dígito menos significativo
    MOV DL, BH
    AND DL, 0Fh
    CMP DL, 10
    JB IMPRIME_3
    ADD DL, 55
    JMP IMPRIME_FIM4
    IMPRIME_3:
        ADD DL, 48
    IMPRIME_FIM4:
        INT 21H

    ; Sai do programa
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN