.data

	msg1: .asciiz "\nDigite o valor total da venda: "
	msg2: .asciiz "\nO salário é de: "
	msg3: .asciiz "\nPressione 0 para sair ou 1 para continuar: "
	faixa: .float 1500.0
	salario: .float 1200.0
	frac1: .float 0.1
	frac2: .float 0.2
	
.text

main:

	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 6
	syscall
	
	mov.s $f1, $f0
	l.s $f2, faixa
	l.s $f8, salario
	c.le.s $f1, $f2
	bc1t grupo1
	bc1f grupo2

grupo1:
	l.s $f3, frac1
	mul.s $f4, $f1,$f3
	add.s $f12, $f4, $f8
	
	li $v0, 4
	la $a0, msg2
	syscall 
	
	li $v0, 2
	syscall
	
	j verificar
	
grupo2:
	l.s $f3, frac1
	l.s $f4, frac2
	
	sub.s $f5, $f1, $f2		
	mul.s $f5, $f5, $f4
	mul.s $f6, $f1, $f3
	add.s $f12, $f5, $f6
	add.s $f12, $f12, $f8
	
	li $v0, 4
	la $a0, msg2
	syscall 
	
	li $v0, 2
	syscall
	
	j verificar
	
verificar:
	li $v0, 4
	la $a0, msg3
	syscall 
	
	li $v0, 5
	syscall
	
	add $t0, $v0, $zero
	beq $t0, $zero, fim
	j main

fim:
	li $v0, 10 