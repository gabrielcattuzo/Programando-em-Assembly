TITLE ATIV03_2
.MODEL SMALL
.STACK 100h
.DATA
    MSG1 DB "Insira um caractere: $"
    NUM DB 13,10,"O caractere inserido e um numero.$"
    LET DB 13,10,"O caractere inserido e uma letra.$"
    DESC DB 13,10,"O caractere inserido e desconhecido.$"

.CODE
MAIN PROC
    ; Permite o acesso às variáveis definidas em .DATA
    MOV AX, @DATA
    MOV DS, AX

    ; Exibe na tela a string MSG1 (“Insira um caractere: ”)
    MOV AH, 09h
    LEA DX, MSG1
    INT 21h

    ; Lê o caractere inserido e salva o caractere em AL
    MOV AH, 01h
    INT 21h

    ; Copia o caractere lido para BL
    MOV BL, AL

    ; Verifica se o caractere é um número. Verifica também se BL é menor que 30h ou '0'
    CMP BL, 30h   
    JB Desconhecido

    ; Verifica se BL é maior que '9' ou 39h
    CMP BL, 39h  
    JBE Numero
    
    ; Verifica se o caractere é uma letra maiúscula. Verifica também se BL é menor que 41h ou 'A'
    CMP BL, 41h   
    JB Desconhecido

    ; Verifica se BL é maior que 5Ah ou 'Z'
    CMP BL, 5Ah 
    JBE Letra
    
    ; Verifica se o caractere é uma letra minúscula. Verifica também se BL é menor que 'a' ou 61h
    CMP BL, 61h  
    JB Desconhecido

    ; Verifica se BL é maior que 'z' ou 7Ah
    CMP BL, 7Ah   
    JBE Letra

    ; Caso não seja número ou letra, é um caractere desconhecido
    Desconhecido:
    LEA DX, DESC
    JMP SHOW

    ; Se for um número
    Numero:
    LEA DX, NUM
    JMP SHOW

    ; Se for uma letra
    Letra:
    LEA DX, LET

    SHOW:
    ; Exibe a mensagem correspondente
    MOV AH, 09h
    INT 21h

    ; Termina o programa
    FIM:
    MOV AH, 4Ch
    INT 21h

MAIN ENDP
END MAIN