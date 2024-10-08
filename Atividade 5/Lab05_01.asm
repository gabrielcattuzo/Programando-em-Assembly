TITLE Lab05_01
.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC
    MOV AH,02H ; função para imprimir caractere em AH
    MOV DL,'*' ; * -> em DL, que será o caractere exibido
    MOV BX,50 ; BX -> 50, contador
CONT: ; laço para imprimir os 50 *
    INT 21H ; -> Colocar o * na tela
    DEC BX ; Decrementa BX, que vai para 49
    JNZ CONT ; Retorna ao CONT em caso de BX diferente de 0
    MOV BX,50 ; Confirma BX50, para que, seja pulado as linhas no próximo laço
IMP: ; laço para separar as linhas de *
    MOV DL,0DH ; carry em DL
    INT 21H 
    MOV DL,0AH ; 0AH em DL, ''pular linha'''
    INT 21H
    MOV DL,'*' 
    INT 21H 
    DEC BX ; decrementa BX em 1
    JNZ IMP ; retorna para IMP em caso de BX diferente de 0
MOV AH,4CH ;funcao DOS para saida
INT 21H ;saindo
MAIN ENDP
END MAIN