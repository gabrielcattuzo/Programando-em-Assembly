TITLE Lab08_3
.MODEL SMALL
.STACK 100h
.DATA
    MSG1 DB 13,10,'Insira um numero hexadecimal: $'
    MSG2 DB 13,10,'Numero hexadecimal inserido invalido $'
.CODE
MAIN PROC
    ; Inicializa o segmento de dados
    MOV AX, @DATA
    MOV DS, AX

    ; Imprime mensagem de entrada
    LEA DX, MSG1
    MOV AH, 09
    INT 21H

    ; Lê o número hexadecimal
    MOV CX, 4
    MOV AH, 1h
    XOR BX, BX
    INT 21h

    ; Loop para ler os dígitos
    TOPO:
        CMP AL, 0Dh
        JE FIM
        CMP AL, '0'
        JB ERRO
        CMP AL, '9'
        JBE CONVERTE
        CMP AL, 'A'
        JB ERRO
        CMP AL, 'F'
        JBE CONVERTE
        CMP AL, 'a'
        JB ERRO
        CMP AL, 'f'
        JBE CONVERTE
        JMP ERRO
        CONVERTE:
            AND AL, 0Fh
            SHL BX, 4
            OR BL, AL
            INT 21h
            LOOP TOPO

    ; Sai do programa
    FIM:
        MOV AH, 4CH
        INT 21H

    ; Em caso de numero hexadecimal inválido
    ERRO:
        LEA DX, MSG2
        MOV AH, 09
        INT 21H
        MOV AH, 4CH
        INT 21H

MAIN ENDP
END MAIN