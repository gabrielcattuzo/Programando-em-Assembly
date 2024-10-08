Title Lab06_01
.MODEL SMALL
.STACK 100h
.CODE
main proc
    mov AH,01h ; 01h -> Ler caracter do teclado
    xor CL,CL  ; Inicializa o contador -> 0
le_c:
    int 21h   ; lê caractere
    cmp AL,13 ; = CR? => Carriage Return => Enter
    je fim    ; se sim, termina
    inc CL    ; incrementa contador
    jmp le_c  ; lê de novo
fim:
    mov AH,02h ; 02h -> Imprimir string na tela
    mov DL,42 ; caractere a ser impresso
loop_impressao:
    cmp CL,0 ; Compara CL ao valor de 0, caso for 0, o JUMP EQUAL abaixo irá pular parao  fim do programa
    je fim_programa ; Se for igual a 0, finaliza, se não, passa sem uso
    int 21h ; Interrompe e imprime o caracter em DL
    dec CL ; Decrementa CL, para retornar ao loop até CL=0
    jmp loop_impressao ; Retorna ao loop até CL ser 0, porque ele irá pular antes desse JUMP
fim_programa:
    mov AH,4CH ; fim programa
    int 21h ; Interrompe o programa, mas nesse caso, termina
    main endp
    end main