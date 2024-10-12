#PONTO FIXO - deve-se utilziar os registradores de $t0 a $t9 e $fs0 a $s7
# $v0 - registrador especializado para inser��o de c�digo de leitura e escrita para o sistema (syscall)
# $a0 - regsitrador especializado para escrita de caracteres pelo sistema (syscall)

.data

msg1: .asciiz "\nOl�, Mundo!\n"
msg2: .byte 'L'
msg3: .word 80 #carregar dados inteiros da mem�ria principal
msg4: .asciiz "\n"
msg5: .asciiz "\n Digite um n�mero inteiro: "
msg6: .asciiz "\nO seu n�mero �: "

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

 #imprimir n�mero inteiro em tla
 li $v0, 1
 lw $a0, msg3
 syscall

 #somado valores inteiros
 li $t0, 75
 li $t1, 25
 add $t2, $t0, $t1

 addi $t3, $t0, 100

  #subtraindo n�meros inteiros
 sub $t4, $t3, $t1
 subi $t5, $t3, 5

  # Quebra de linha para separar o resultados
 li $v0, 4
 la $a0, msg4
 syscall

 #multiplica��o de inteiros
 li $v0, 1

 mul $t6,$t2, $t1
 move $a0, $t6
 syscall

  #divis�o de n�meros inteiros
 div $t2, $t1

 #registrador lo guarda o quociente da divis�o e pode ser recuperado pela instru��o mflo
 #registrador hi guarda o resto da divis�o e pode ser recuperado pela instru��o mfhi
 mflo $s0
 mfhi $s1

  #inserir quebra de linha
 li $v0, 4
 la $a0, msg4
 syscall

  #imprimir conte�do do registrador em tela - registrador lo
 li $v0, 1
 move $a0, $s0
 syscall

 #inserir quebra de linha
 li $v0, 4
 la $a0, msg4
 syscall

 #imprimir conte�do do registrador em tela - registrador hi
 li $v0, 1
 move $a0, $s1
 syscall

  ###################################################################
 #Leitura de n�meros inteiros
 #inser��o de c�digo na $v0 para escrita de caracteres
 li $v0, 4
 la $a0, msg5
 syscall

 #Inser��o de c�digo para leitura de n�meros inteiros (ver tabela)
 #chamada ao sistema (syscall) para input de dados pelo usu�rio
 li $v0, 5
 syscall

 #O registrador $v0 � usado pelo sistema, � uma boa pr�tica mover a informa��o para recupera�ao futura.
 #Neste caso, o valor foi transferido para $s2 pela instru��o de inteiros move.
 move $s2, $v0

 #Exibir mensagem ao usu�rio em tela
 li $v0, 4
 la $a0, msg6
 syscall

 #Inser��o do c�digo de chamada ao sistema para escrita de inteiros (ver tabela)
 #O registrador $s2 guarda a informa��o digitada pelo usu�rio
 li $v0, 1
 move $a0, $s2
 syscall

 #Encerramento do programa
 li $v0, 10
 syscall