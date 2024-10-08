TITLE Lab05_02
.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC ; função para imprimir caracter, o caractere inserido em DL, e CX o contador com 50 
    MOV AH,02H ; 
    MOV DL,'*'
    MOV CX,50
CONT: ; Loop para ser o DEC, mas no caso, LOOP = CX - 1 --> LOOP = 50 - 1 --> LOOP = 49
    INT 21H
    LOOP CONT
    MOV CX,50
IMP: ; Loop para pular as linhas, com 50 também como base
    MOV DL,0DH 
    INT 21H
    MOV DL,0AH
    INT 21H
    MOV DL,'*'
    INT 21H
    LOOP IMP
; Encerramento do programa
MOV AH,4CH 
INT 21H 
MAIN ENDP
END MAIN