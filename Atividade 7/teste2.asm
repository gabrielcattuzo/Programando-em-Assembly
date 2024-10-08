TITLE Atividade7 - Multiplicação
.MODEL SMALL
.STACK 100h

; Seção de dados
.DATA
    MSG1 DB 13,10,'Digite o multiplicando: $' ; Mensagem para pedir o multiplicando
    MSG2 DB 13,10,'Digite o multiplicador: $' ; Mensagem para pedir o multiplicador
    MSG3 DB 13,10,'Produto: $' ; Mensagem para exibir o produto

; Seção de código
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
    SUB AL, 30h ; Converter o caractere para número

    ; Armazenar o multiplicando em BL
    MOV BL, AL

    ; Exibir mensagem para pedir o multiplicador
    MOV AH, 9
    LEA DX, MSG2
    INT 21H

    ; Ler o multiplicador
    MOV AH, 1
    INT 21H
    MOV CL, AL
    SUB CL, 30h ; Converter o caractere para número

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

    ADD BH, 30h ; Converter o produto para caractere
    MOV AH, 2
    MOV DL, BH
    INT 21H ; Exibir o produto

    ; Finalizar o programa
    MOV AH, 4Ch
    INT 21H

    MAIN ENDP
END MAIN