.data

	msg1: .asciiz "Digite o seu salário: "
	msg2: .asciiz "O desconto é de: "
	msg3: .asciiz "\nSalário após desconto: "
	faixa1: .float 1320.0
	total1: .float 99.0
	frac1: .float 0.075
	faixa2: .float 2571.29
	total2: .float 211.61
	frac2: .float 0.09
	faixa3: .float 3865.94
	total3: .float 365.89
	frac3: .float 0.12
	faixa4: .float 7507.49
	total4: .float 876.97
	frac4: .float 0.14
	
.text

main:
	
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 6
	syscall
	mov.s $f1, $f0 #f1 é o salário
	
	l.s $f2, faixa1 #f2 é a faixa salarial para comparação
	c.le.s $f1, $f2
	bc1t grupo1
	
	l.s $f2, faixa2
	c.le.s $f1, $f2
	bc1t grupo2
	
	l.s $f2, faixa3
	c.le.s $f1, $f2
	bc1t grupo3
	
	l.s $f2, faixa4
	c.le.s $f1, $f2
	bc1t grupo4
	bc1f grupo5
	
	
grupo1:
	l.s $f3, frac1 #f3 é a % de desconto
	mul.s $f4,$f3,$f1 #f4 é o desconto 
	sub.s $f5, $f1,$f4 #f5 é o salário com desconto 
	
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

	l.s $f8, total1
	l.s $f10,faixa1 # Limite inferior
	sub.s $f9, $f1, $f10 #(Salário - Limite inferior)
	l.s $f3, frac2 #f3 é a % de desconto
	mul.s $f4,$f3,$f9 #f4 é o desconto 
	add.s $f4, $f4, $f8
	sub.s $f5, $f1,$f4 #f5 é o salário com desconto 
	 
	
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

	l.s $f8, total2
	l.s $f10,faixa2 # Limite inferior
	sub.s $f9, $f1, $f10 #(Salário - Limite inferior)
	l.s $f3, frac3 #f3 é a % de desconto
	mul.s $f4,$f3,$f9 #f4 é o desconto 
	add.s $f4, $f4, $f8
	sub.s $f5, $f1,$f4 #f5 é o salário com desconto 
	
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
	l.s $f8, total3
	l.s $f10,faixa3 # Limite inferior
	sub.s $f9, $f1, $f10 #(Salário - Limite inferior)
	l.s $f3, frac4 #f3 é a % de desconto
	mul.s $f4,$f3,$f9 #f4 é o desconto 
	add.s $f4, $f4, $f8
	sub.s $f5, $f1,$f4 #f5 é o salário com desconto 
	 
	
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

	l.s $f4, total4
	sub.s $f5, $f1,$f8 #f5 é o salário com desconto  
	
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
