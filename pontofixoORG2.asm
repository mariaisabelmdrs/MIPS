#PONTO FIXO - deve-se utilziar os registradores de $t0 a $t9 e $fs0 a $s7
# $v0 - registrador especializado para inserção de código de leitura e escrita para o sistema (syscall)
# $a0 - regsitrador especializado para escrita de caracteres pelo sistema (syscall)

.data

msg1: .asciiz "\nOlá, Mundo!\n"
msg2: .byte 'L'
msg3: .word 80 #carregar dados inteiros da memória principal
msg4: .asciiz "\n"
msg5: .asciiz "\n Digite um número inteiro: "
msg6: .asciiz "\nO seu número é: "

.text
#imprimir mensagem de texto em tela
li $v0, 4
la $a0, msg1
syscall


#imprimir caracter em tela
li $v0, 4
la $a0, msg2
syscall

# Quebra de linha para separar o resultados
li $v0, 4
la $a0, msg4
syscall

 #imprimir número inteiro em tla
 li $v0, 1
 lw $a0, msg3
 syscall

 #somado valores inteiros
 li $t0, 75
 li $t1, 25
 add $t2, $t0, $t1

 addi $t3, $t0, 100

  #subtraindo números inteiros
 sub $t4, $t3, $t1
 subi $t5, $t3, 5

  # Quebra de linha para separar o resultados
 li $v0, 4
 la $a0, msg4
 syscall

 #multiplicação de inteiros
 li $v0, 1

 mul $t6,$t2, $t1
 move $a0, $t6
 syscall

  #divisão de números inteiros
 div $t2, $t1

 #registrador lo guarda o quociente da divisão e pode ser recuperado pela instrução mflo
 #registrador hi guarda o resto da divisão e pode ser recuperado pela instrução mfhi
 mflo $s0
 mfhi $s1

  #inserir quebra de linha
 li $v0, 4
 la $a0, msg4
 syscall

  #imprimir conteúdo do registrador em tela - registrador lo
 li $v0, 1
 move $a0, $s0
 syscall

 #inserir quebra de linha
 li $v0, 4
 la $a0, msg4
 syscall

 #imprimir conteúdo do registrador em tela - registrador hi
 li $v0, 1
 move $a0, $s1
 syscall

  ###################################################################
 #Leitura de números inteiros
 #inserção de código na $v0 para escrita de caracteres
 li $v0, 4
 la $a0, msg5
 syscall

 #Inserção de código para leitura de números inteiros (ver tabela)
 #chamada ao sistema (syscall) para input de dados pelo usuário
 li $v0, 5
 syscall

 #O registrador $v0 é usado pelo sistema, é uma boa prática mover a informação para recuperaçao futura.
 #Neste caso, o valor foi transferido para $s2 pela instrução de inteiros move.
 move $s2, $v0

 #Exibir mensagem ao usuário em tela
 li $v0, 4
 la $a0, msg6
 syscall

 #Inserção do código de chamada ao sistema para escrita de inteiros (ver tabela)
 #O registrador $s2 guarda a informação digitada pelo usuário
 li $v0, 1
 move $a0, $s2
 syscall

 #Encerramento do programa
 li $v0, 10
 syscall