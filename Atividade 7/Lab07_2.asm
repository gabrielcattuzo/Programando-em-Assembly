TITLE Atividade7 - Multiplicação
.MODEL SMALL
.STACK 100h
.DATA
    MSG1 DB 13,10,'Digite o multiplicando: $' ; Mensagem para pedir o multiplicando
    MSG2 DB 13,10,'Digite o multiplicador: $' ; Mensagem para pedir o multiplicador
    MSG3 DB 13,10,'Produto: $' ; Mensagem para exibir o produto

.CODE
MAIN PROC
    ; Inicializar o segmento de dados
    MOV AX, @DATA
    MOV DS, AX

    ; Exibir mensagem para pedir o multiplicando
    MOV AH, 9
    LEA DX, MSG1
    INT 21H

    ; Ler o multiplicando
    MOV AH, 1
    INT 21H
    XOR CX, CX ; CX <- 0
    SUB AL, 30h ; Converter o caractere para número
    MOV BL, AL ; Armazenar o multiplicando em BL

    ; Exibir mensagem para pedir o multiplicador
    MOV AH, 9
    LEA DX, MSG2
    INT 21H

    ; Ler o multiplicador
    MOV AH, 1
    INT 21H
    XOR CX, CX ; CX <- 0
    SUB AL, 30h ; Converter o caractere para número
    MOV CL, AL ; Armazenar o multiplicador em CL

    ; Iniciar o loop de multiplicação
    MOV BH, 0 ; Inicializar o produto
    REALIZAR_MULTIPLICACAO:
    CMP CL, 0 ; Verificar se o multiplicador é zero
    JE MULTIPLICACAO_FINALIZADA ; Se sim, sair do loop
    ADD BH, BL ; Adicionar o multiplicando ao produto
    DEC CL ; Decrementar o multiplicador
    JMP REALIZAR_MULTIPLICACAO ; Voltar ao início do loop

    ; Exibir o produto
    MULTIPLICACAO_FINALIZADA:
    MOV AH, 9
    LEA DX, MSG3
    INT 21H ; Exibir mensagem para o produto

    OR BH, 30h ; Converter o produto para caractere
    MOV AH, 2
    MOV DL, BH
    INT 21H ; Exibir o produto

    ; Finalizar o programa
    MOV AH, 4Ch
    INT 21H

    MAIN ENDP
END MAIN