# Programando em Assembly x86 (8086)

## Descrição

Este repositório é dedicado à programação na linguagem Assembly para a arquitetura DOS x86. Aqui, você encontrará exemplos, tutoriais e recursos úteis para aprender e aprimorar suas habilidades em Assembly.

## Estrutura do Repositório

- **Exemplos**: Códigos de exemplo que demonstram conceitos básicos e avançados em Assembly.
- **Tutoriais**: Guias passo a passo para ajudar iniciantes a entender a linguagem e suas nuances.
- **Documentação**: Referências e materiais adicionais sobre Assembly e programação em baixo nível.

## Como Usar

1. **Clone o Repositório**:
   git clone https://github.com/gabrielcattuzo/Programando-em-Assembly.git

2. Instalar extensão no VSCODE
  MASM/TASM in DOSBOX

## Explicação de todas as Atividades

# 1. Atividade 1
- **ATIV1_1.asm**: Código para imprimir uma variável do tipo DB no segmento .DATA, sendo válido ressaltar o uso do ''13,10,'', para pular uma linha sem precisar de outras instruções no código
- **ATIV1_2.asm**: Código para imprimir um caracter inserido via instrução (MOV DL, ''?''). Além disso, também conta com a leitura e depois a impressão do caracter inserido utilizando a Tabela ASCII, presente neste repositório.
- **ATIV1_3.asm**: Código para o usuário inserir um caracter e retornar o caracter, entretanto, acompanhado de mensagem de entrada e saída, ou seja, uma mistura das atividades anteriores.

# 2. Atividade 2
- **ATIV2_1.asm**: Código para ler e imprimir um caracter* inserido, que deve ser uma letra minuscula, o programa irá converter via tabela ASCII e imprimir a letra maiuscula.
*OBS: caracter esse que, se for inserido diferente de uma letra minuscula, ele não tem trava, ou seja, ele ainda tentará a conversão.
- **ATIV2_2.asm**: Programa feito para calcular a soma entre dois números, que devem ser entre 0 e 9 (ele só lê um caracter por vez), caso a soma dê acima de 9, ele não irá imprimir

# 3. Atividade 3
- **ATIV3_1.asm**: Código para ler um caracter e determinar, se ele é um número ou se ele é qualquer outro caracter, com uma mensagem para cada possibilidade.
- **ATIV03_2.asm**: Código para ler um caracter e determinar, se ele é uma letra, um caracter desconhecido ou um número, com um laço e mensagem para cada possibilidade.

# 4. Atividade 4
- Esta atividade não está no repositório, até porque não envolvia nenhum tipo de código, apenas uma CPU Hipotética, a qual está nesse repositório, sendo necessário portanto, simular as instruções na CPU.

# 5. Atividade 5
- **Lab05_01.asm**: Código que imprime um caracter colocado em DL via instrução, por 50 vezes, imprimindo um '*' por linha.
- **Lab05_02.asm**: Código com a mesma interação do 01, mas que já utiliza a instrução LOOP, ao invés de DEC CX e JNZ Label
- **Lab05_03.asm**: Código que imprime todos os caracteres (letras maiusculas até letras minusculas respectivamente), todas na mesma linha
