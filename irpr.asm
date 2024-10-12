.data

	msg1: .asciiz "Digite o seu salário: "
	msg2: .asciiz "O IRPF é de: "
	msg3: .asciiz "\nSalário após desconto: "
	isento: .float 1903.98
	faixa1: .float 2826.65
	desconto1: .float 142.80
	frac1: .float 0.075
	faixa2: .float 3751.05
	desconto2: .float 354.80
	frac2: .float 0.15
	faixa3: .float 4664.68
	desconto3: .float 636.13
	frac3: .float 0.225
	desconto4: .float 869.36
	frac4: .float 0.275
	zero: .float 0.0
	
.text

main:
	
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 6
	syscall
	mov.s $f1, $f0 #f1 é o salário
	
	l.s $f2, isento #f2 é a faixa salarial para comparação
	c.le.s $f1, $f2
	bc1t grupo1
	
	l.s $f2, faixa1
	c.le.s $f1, $f2
	bc1t grupo2
	
	l.s $f2, faixa2
	c.le.s $f1, $f2
	bc1t grupo3
	
	l.s $f2, faixa3
	c.le.s $f1, $f2
	bc1t grupo4
	bc1f grupo5
	
	
grupo1:
	l.s $f4, zero
	
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
	mov.s $f12, $f1
	syscall
	
	j fim
	
grupo2:

	l.s $f3, frac1 # aliquota
	l.s $f6, desconto1 #f6 é a dedução da faixa
	mul.s $f4,$f3,$f1 #f4 é o desconto 
	sub.s $f4, $f4, $f6
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

	l.s $f3, frac2 # aliquota
	l.s $f6, desconto2 #f6 é a dedução da faixa
	mul.s $f4,$f3,$f1 #f4 é o desconto 
	sub.s $f4, $f4, $f6
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
	l.s $f3, frac3 # aliquota
	l.s $f6, desconto3 #f6 é a dedução da faixa
	mul.s $f4,$f3,$f1 #f4 é o desconto 
	sub.s $f4, $f4, $f6
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

	l.s $f3, frac4 # aliquota
	l.s $f6, desconto4 #f6 é a dedução da faixa
	mul.s $f4,$f3,$f1 #f4 é o desconto 
	sub.s $f4, $f4, $f6
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
	
fim:
	li $v0, 10
	syscall