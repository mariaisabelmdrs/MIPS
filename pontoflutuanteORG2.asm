 #PONTO FLUTUANTE - deve-se utilziar os registradores de $f1 a $f11 e de $f13 a $f31
 # $f0 - registrador especializado para leitura de números em PF pelo sistema (syscall)
 # $f12 - regsitrador especializado para escrita de números em PF pelo sistema (syscall)
 .data

 num1:.float 3.141592
 num2:.float 3.5
 num3:.float 2.5
 num4:.double 6.5
 num5:.double 4.5
 num6:.word 8
 msg1: .asciiz "\n"
 msg2: .asciiz "\nDigite um número em Ponto Flutuante (Ex.: 4.5): "
 msg3: .asciiz "\nO número digitado é: "
 zero1: .float 0.0

  .text
 #impressão em tela de ponto flutuante com precisão simples
 #$f12 registrador especializado para impressão em ponto flutuante (single ou double)
 #lwc1 instrução para carregamento de dados de memória em ponto flutuante (single ou double)

  li $v0, 2
 lwc1 $f12, num1
 syscall

 #quebra de linha
 li $v0, 4
 la $a0, msg1
 syscall

 #impressão em tela de ponto flutuante com precisão simples
 li $v0, 2
 l.s $f12, num1
 syscall

 #Soma de pontos flutuantes com precisão single
 #carregamento e soma de dados da memória
 #Todas as instruções de ponto flutuante(PF) possuem uma versão idênctica para precisão simples e dupla: .s ou .d
 lwc1 $f1, num2
 lwc1 $f2, num3
 add.s $f3,$f1,$f2

 #subração de Ponto Flutuante com precisão single
 sub.s $f4, $f1,$f2

 #multiplicação de Ponto Flutuante com precisão simples
 mul.s $f5,$f1,$f2

 #divisão de Ponto Flutuante com precisão simples
 div.s $f6,$f1,$f2

 # Instrução para encontrar o valor absoluto em ponto flutuante com precisão simples
 abs.s $f7, $f1

 #Conversão entre precisão simples e dupla
 #Registradores de precisão dupla são os pares no Coproc1
 #Converte de simples para dupla
 cvt.d.s $f8,$f1

 #Conversão inteiros para precisão simples
 #lwc1 $f10, zero1
 lwc1 $f10, num6
 cvt.s.w $f14,$f10
 
 #Truncamento: trunca o valor de PF (double ou single), converte para um valor de ponto fixo de 32 bits (palavra).
 trunc.w.s $f9, $f1
 cvt.s.w $f9,$f9

 #Arredondamento: arredonda o valor de PF (double ou single), converte para um valor de ponto fixo de 32 bits (palavra)
 round.w.s $f16, $f1
 cvt.s.w $f16,$f16

 ###############################################################################
 #Leitura de Ponto Flutuante (PF) - input do usuário
 #Incluir código de escrita de caractere no registrador $V0
 li $v0, 4
 la $a0, msg2
 syscall

 #Solicitar número ao usuário
 #Este número em PF é armazenado automaticamente no registrador especializado $f0.
 #Como o registrador $f0 é utilizado pelo sistema (syscall) é importante guardar o valor em outro registrador para uso posterior ($f18)
 li $v0, 6
 syscall
 mov.s $f18, $f0

 #Imprime mensagem e o número do usuário em tela
 li $v0, 4
 la $a0, msg3
 syscall

  li $v0, 2
 mov.s $f12, $f18
 syscall

 #encerrar o programa
 li $v0,10
 syscall