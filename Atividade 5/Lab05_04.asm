.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC
    ; Inicialize os registradores
    MOV AH, 02H   ; Função para imprimir caractere
    MOV DL, 'a'   ; Caractere inicial
    MOV CX, 26    ; Contador de caracteres (tamanho do alfabeto)
    MOV BL, 0     ; Contador de linhas

LOOP_MIN:
    ; Imprima o caractere
    INT 21H

    ; Incremente o caractere e o contador de linhas
    INC DL
    INC BL

    ; Verifique se 4 linhas foram impressas
    CMP BL, 4
    JNE NAO_SALTA_LINHA

    ; Imprima os caracteres de nova linha
    MOV DL, 0DH
    INT 21H
    MOV DL, 0AH
    INT 21H

    ; Ressete o contador de linhas
    MOV BL, 0

NAO_SALTA_LINHA:
    ; Repita até que todos os caracteres sejam impressos
    LOOP LOOP_MIN

    ; Saia do programa
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN