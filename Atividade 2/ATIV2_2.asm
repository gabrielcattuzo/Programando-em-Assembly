TITLE soma 
.MODEL SMALL
.STACK 100h
.DATA
    MSG1 DB "Digite um primeiro numero: $"
    MSG2 DB 13,10,"Digite um segundo numero: $"
    MSG3 DB 13,10,"A soma dos dois numeros eh: $"
.CODE
MAIN PROC;
; Stack 100h definindo o tamanho da pilha
; Permite o acesso às variáveis definidas em .DATA
    MOV AX,@DATA
    MOV DS,AX
; Exibe na tela a string MSG1
    MOV AH, 09h
    LEA DX, MSG1
    INT 21h
; Ler o caracter inserido
    MOV AH, 01h
    INT 21h
; Converte o caractere ASCII para um número
    SUB AL, 30h
; Armazena o primeiro número em BL
    MOV BL, AL
; Exibe na tela a string MSG2
    MOV AH, 09h
    LEA DX, MSG2
    INT 21h
; Ler o caracter inserido (o segundo inserido)
    MOV AH, 01h
    INT 21h
; Converte o caractere (segundo) ASCII para um número
    SUB AL, 30h
; Soma o segundo número ao primeiro
    ADD AL, BL
; Armazena o resultado em BL
    MOV BL, AL  
; Exibe na tela a string MSG3
    MOV AH, 09h
    LEA DX, MSG3
    INT 21h
; Resultado em ASCII e exibindo
    ADD BL, 30h
    MOV DL, BL
    MOV AH, 02h
    INT 21h
; Finaliza o programa
    MOV AH, 4Ch
    INT 21h
MAIN ENDP
END MAIN