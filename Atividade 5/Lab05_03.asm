TITLE Lab05_03
.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC
    MOV AH,02H
    MOV DL,'A'
    MOV CX,26
MAI: ; loop para imprimir as letras maiusculas
    INT 21H
    INC DL
    LOOP MAI

MOV DL,'a'
MOV CX,26

MIN: ; loop para imprimir as letras minusculas
    INT 21H
    INC DL
    LOOP MIN

MOV AH,4CH ;funcao DOS para saida
INT 21H ;saindo
MAIN ENDP
END MAIN