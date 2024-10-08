TITLE HEXADECIMAL
.MODEL SMALL
.STACK 100h
.DATA
MSG1 DB 'NUMERO HEXADECIMAL: ', 13,10,'$'

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
    MOV BX, 0A2B4h

    ; Imprime os 4 dígitos hexadecimais
    CALL IMPRIME_HEX
    ROL BX, 8
    CALL IMPRIME_HEX

    ; Sai do programa
    MOV AH, 4CH
    INT 21H

IMPRIME_HEX PROC
    ; Imprime dígito mais significativo (4 bits)
    MOV DL, BH
    SHR DL, 4
    CALL CONVERTE_IMPRIME

    ; Imprime dígito menos significativo (4 bits)
    MOV DL, BH
    AND DL, 0Fh
    CALL CONVERTE_IMPRIME
    RET
IMPRIME_HEX ENDP

CONVERTE_IMPRIME PROC
    ; Converte DL para caractere ASCII
    CMP DL, 10
    JB DIGITO
    ADD DL, 55  ; A-F
    JMP IMPRIME_FIM
DIGITO:
    ADD DL, 48  ; 0-9
IMPRIME_FIM:
    ; Imprime o caractere
    MOV AH, 02H
    INT 21H
    RET
CONVERTE_IMPRIME ENDP

MAIN ENDP
END MAIN
