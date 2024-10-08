Title Lab06_02
.MODEL SMALL
.STACK 100h
.CODE
main proc
    mov AH,01h ; 01h -> Ler o caracter do teclado
    xor CL,CL  ; Inicializa o contador, que deve ser 0
le_c:
    int 21h   ; lê caractere
    inc CL    ; incrementa contador
    cmp AL,13 ; = CR? => Carriage Return => Enter
    je fim    ; se sim, termina
    jmp le_c  ; lê de novo
fim: ; Aqui, não precisa incrementar cl para incluir o CR
    mov AH,02h ; Chama 02h para imprimir o caracter na tela
    mov DL,42 ; caractere a ser impresso '*'
loop_impressao:
    cmp CL,0 ; compara CL a 0, se for, o JE irá pular para o fim do programa
    je fim_programa ; Se for 0, vai para o fim, caso contrário, continua até CL=0
    int 21h ; Interrompe para imprimir o caracter
    dec CL ; Decrementa 1 em CL até CL for 0
    jmp loop_impressao ; Vai a impressão novamente, porque CL ainda não é 0, se fosse, o je fim_programa iria acionar antes
fim_programa:
    mov AH,4CH ; fim programa
    int 21h ; interrompe e finaliza
    main endp
end main

; A diferença entre o Lab06 _01 e o Lab06_02 é a seguinte:
; → O 01 se utiliza de um sistema com ''WHILE'' e o outro de um sistema ''REPEAT''
; Mas ambos possuem diferenças para o seu funcionamento, o exercício 01, exige que a quantidade de caracteres '*' seja igual a de caracteres inseridos
; Ou seja, se o usuário inserir: ''ABCD'', ele deverá retornar (imprimir) ''****'''
; Já o 02, se o usuário inserir o mesmo ''ABCD'', ele retornará ''*****'', o caracter a mais é por causa do enter inserido, que também é considerado
; Mas tirando a diferença de exercício, o REPEAT é diferente do while a partir do momento que:
; → O ''INC CL'', presente na linha 12 do programa 1, para incrementar o contador CL, inicializado em XOR CL, CL
; O INC CL não foi removido, muito pelo contrário, apenas movido para acima do CMP, a fim de, promover ele apenas após a leitura do caracter inserido
; E esse funcionamento, é mais característico de um REPEAT, ao invés de um WHILE. Que é comparar no final, ao invés de no começo como o while