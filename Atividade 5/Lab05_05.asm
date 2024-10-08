TITLE Lab05_05
.MODEL SMALL
.STACK 100H
.DATA 
    MSG1 DB 10,13, 'Numero a inserir (0 ao 9): $'
    MSG2 DB 10,13, 'A somatoria resulta em: $'
.CODE
MAIN PROC
    ; Acessa .data, inicialização da soma e loop para ler 5 números (CX=5) 
    MOV AX, @DATA
    MOV DS, AX 
    MOV SI, 0
    MOV CX, 5

ler: ; Exibe MSG1 na tela, lê 5 números inseridos pelo teclado do usuário
    MOV AH, 9 
    LEA DX, MSG1
    INT 21H
    MOV AH, 1
    INT 21H
    SUB AL, '0' ; conversão via tabela ASCII
    ADD SI, AX ; adiciona número à soma 
    LOOP ler ; (LER--, e repete o loop até esgotar as 5 possíveis inserções
    MOV AH, 2  
    MOV DL, 10
    INT 21H
    ; Exibe MSG2 na tela com o resultado da somatória
    MOV AH, 9
    LEA DX, MSG2
    INT 21H
    MOV AX, SI
    ADD AX, '0'
    MOV DL, AL
    MOV AH, 2
    INT 21H
    ; Encerramento do programa
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
