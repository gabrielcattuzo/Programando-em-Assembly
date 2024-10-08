TITLE Lab08_1
.MODEL SMALL
.STACK 100h
.DATA
    MSG1 DB 13,10,'Insira um numero binario $'
    MSG2 DB 13,10,'Numero binario inserido invalido $' 
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

    ; Sai do programa
    FIM:
        MOV AH, 4CH
        INT 21H

    ; Em caso de numero binário inválido
    ERRO:
        LEA DX, MSG2
        MOV AH, 09
        INT 21H
        MOV AH, 4CH
        INT 21H

MAIN ENDP
END MAIN