.data

	msg1: .asciiz "Digite o seu sal�rio: "
	msg2: .asciiz "O desconto � de: "
	msg3: .asciiz "\nSal�rio ap�s desconto: "
	faixa: .float 1320.0
	total: .float 99.0
	frac: .float 0.075
	faixa_1: .float 2571.29
	total_1: .float 211.61
	frac_1: .float 0.09
	faixa_2: .float 3865.94
	total_2: .float 365.89
	frac_2: .float 0.12
	faixa_3: .float 7507.49
	total_3: .float 876.97
	frac_3: .float 0.14
	
.text

main:
	
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 6
	syscall
	mov.s $f1, $f0 #f1 � o sal�rio
	
	l.s $f2, faixa#f2 � a faixa salarial para compara��o
	c.le.s $f1, $f2
	bc1t grupo1
	
	l.s $f2, faixa_1
	c.le.s $f1, $f2
	bc1t grupo2
	
	l.s $f2, faixa_2
	c.le.s $f1, $f2
	bc1t grupo3
	
	l.s $f2, faixa_3
	c.le.s $f1, $f2
	bc1t grupo4
	bc1f grupo5
	
	
grupo1:
	l.s $f3, frac#f3 � a % de desconto
	mul.s $f4,$f3,$f1 #f4 � o desconto 
	sub.s $f5, $f1,$f4 #f5 � o sal�rio com desconto 
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 2
	mov.s $f12, $f4
	syscall
	
	li $v0, 4
	la $a0, msg3
	syscall
	
	li $v0, 2
	mov.s $f12, $f5
	syscall
	
	j fim
	
grupo2:

	l.s $f8, total_1
	l.s $f10,frac # Limite inferior
	sub.s $f9, $f1, $f10 #(Sal�rio - Limite inferior)
	l.s $f3, frac_1#f3 � a % de desconto
	mul.s $f4,$f3,$f9 #f4 � o desconto 
	add.s $f4, $f4, $f8
	sub.s $f5, $f1,$f4 #f5 � o sal�rio com desconto 
	 
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 2
	mov.s $f12, $f4
	syscall
	
	li $v0, 4
	la $a0, msg3
	syscall
	
	li $v0, 2
	mov.s $f12, $f5
	syscall
	
	j fim

grupo3:

	l.s $f8, total_1
	l.s $f10,frac_1 # Limite inferior
	sub.s $f9, $f1, $f10 #(Sal�rio - Limite inferior)
	l.s $f3, frac_2#f3 � a % de desconto
	mul.s $f4,$f3,$f9 #f4 � o desconto 
	add.s $f4, $f4, $f8
	sub.s $f5, $f1,$f4 #f5 � o sal�rio com desconto 
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 2
	mov.s $f12, $f4
	syscall
	
	li $v0, 4
	la $a0, msg3
	syscall
	
	li $v0, 2
	mov.s $f12, $f5
	syscall
	
	j fim

grupo4:
	l.s $f8, total_2
	l.s $f10,frac_2 # Limite inferior
	sub.s $f9, $f1, $f10 #(Sal�rio - Limite inferior)
	l.s $f3, frac_3 #f3 � a % de desconto
	mul.s $f4,$f3,$f9 #f4 � o desconto 
	add.s $f4, $f4, $f8
	sub.s $f5, $f1,$f4 #f5 � o sal�rio com desconto 
	 
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 2
	mov.s $f12, $f4
	syscall
	
	li $v0, 4
	la $a0, msg3
	syscall
	
	li $v0, 2
	mov.s $f12, $f5
	syscall
	
	j fim

grupo5:

	l.s $f4, total_3
	sub.s $f5, $f1,$f8 #f5 � o sal�rio com desconto  
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 2
	mov.s $f12, $f4
	syscall
	
	li $v0, 4
	la $a0, msg3
	syscall
	
	li $v0, 2
	mov.s $f12, $f5
	syscall
	
	j fim
	
fim:
	li $v0, 10
	syscall