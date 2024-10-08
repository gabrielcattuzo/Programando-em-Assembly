Title Lab06_02
.MODEL SMALL
.STACK 100h
.CODE
main proc
    mov AH,01h
    xor CL,CL  ; contador
le_c:
    int 21h   ; le caracter
    cmp AL,13 ; = CR?
    je fim    ; sim, termina
    inc CL    ; incrementa contador
    jmp le_c  ; le de novo
fim:
    inc CL    ; inclui o caractere Enter (CR) no contador
    mov AH,02h
    mov DL,42 ; caractere a ser impresso
loop_impressao:
    cmp CL,0
    je fim_programa
    int 21h
    dec CL
    jmp loop_impressao
fim_programa:
    mov AH,4CH ; fim programa
    int 21h
    main endp
    end main