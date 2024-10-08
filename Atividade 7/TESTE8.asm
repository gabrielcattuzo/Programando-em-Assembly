TITLE Atividade7 - Divisão
.MODEL SMALL
.STACK 100h

; Seção de dados
.DATA
    MSG1 DB 13,10,'Digite o dividendo: $' ; Mensagem para pedir o dividendo
    MSG2 DB 13,10,'Digite o divisor: $' ; Mensagem para pedir o divisor
    MSG3 DB 13,10,'Quociente: $' ; Mensagem para exibir o quociente
    MSG4 DB 13,10,'Resto: $' ; Mensagem para exibir o resto

; Seção de código
.CODE
MAIN PROC
    ; Inicializar o segmento de dados
    MOV AX, @DATA
    MOV DS, AX

    ; Exibir mensagem para pedir o dividendo
    MOV AH, 9
    LEA DX, MSG1
    INT 21H

    ; Ler o dividendo
    MOV AH, 1
    INT 21H
    SUB AL, 30h ; Converter o caractere para número

    ; Armazenar o dividendo em BL
    MOV BL, AL

    ; Exibir mensagem para pedir o divisor
    MOV AH, 9
    LEA DX, MSG2
    INT 21H

    ; Ler o divisor
    MOV AH, 1
    INT 21H
    MOV CL, AL
    SUB CL, 30h ; Converter o caractere para número

    ; Iniciar o loop de divisão
    REALIZAR_DIVISAO:
    CMP BL, CL ; Verificar se o dividendo é menor que o divisor
    JL DIVISAO_FINALIZADA ; Se sim, sair do loop
    SUB BL, CL ; Subtrair o divisor do dividendo
    INC BH ; Incrementar o quociente
    JMP REALIZAR_DIVISAO ; Voltar ao início do loop

    ; Exibir o quociente e o resto
    DIVISAO_FINALIZADA:
    MOV AH, 9
    LEA DX, MSG3
    INT 21H ; Exibir mensagem para o quociente

    ADD BH, 30h ; Converter o quociente para caractere
    MOV AH, 2
    MOV DL, BH
    INT 21H ; Exibir o quociente

    MOV AH, 9
    LEA DX, MSG4
    INT 21h ; Exibir mensagem para o resto

    ADD BL, 30h ; Converter o resto para caractere
    MOV AH, 2
    MOV DL, BL
    INT 21H ; Exibir o resto

    ; Finalizar o programa
    MOV AH, 4Ch
    INT 21H

    MAIN ENDP
END MAIN