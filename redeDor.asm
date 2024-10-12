.data

	msg1: .asciiz "Digite o número do quarto: "
	msg2: .asciiz "Vá para a direita!"
	msg3: .asciiz "Vá para a esquerda!"
	
.text

main:

	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	add $t1, $v0, $zero
	
	li $t2, 2
	div $t3, $t1, $t2
	
	mfhi $t4 #resto da divisão
	
	beq $t4, $zero, par
	j impar
	
par:
	li $v0, 4
	la $a0, msg2
	syscall
	j fim
	
	
impar:
	li $v0, 4
	la $a0, msg3
	syscall
	j fim

fim:
	li $v0, 10
	syscall