TITLE minusculo
.MODEL SMALL
.DATA
    MSG1 DB "Digite uma letra minuscula: $"
    MSG2 DB 13,10,"A letra maiuscula correspondente eh: $"
.CODE
MAIN PROC
; Permite o acesso às variáveis definidas em .DATA
    MOV AX,@DATA
    MOV DS,AX
; Exibe na tela a string MSG1
    MOV AH, 09h
    LEA DX,MSG1
    INT 21h
; Ler o caracter inserido
    MOV AH, 01h
    INT 21h
; Subtraindo 32 de ASCII decimal | Guardando em BL, pelo fato de que, irá ser perdido com as funções
    SUB AL, 20h
    MOV BL,AL
; Exibe na tela a string MSG2
    MOV AH, 09h
    LEA DX, MSG2
    INT 21h
; Exibe na tela a letra maiuscula 
    MOV DL, BL
    MOV AH, 02h
    int 21h
; Finaliza o programa
    MOV AH,4Ch
    INT 21h
MAIN ENDP
END MAIN