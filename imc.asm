.data

	msg1: .asciiz "Digite sua massa (kg): "
	msg2: .asciiz "Digite sua altura (m): "
	msg3: .asciiz "\nMagreza grave"
	msg4: .asciiz "\nMagreza moderada"
	msg5: .asciiz "\nMagreza leve"
	msg6: .asciiz "\nSaudável"
	msg7: .asciiz "\nSobrepeso"
	msg8: .asciiz "\nObesidade Grau I"
	msg9: .asciiz "\nObesidade Grau II (severa)"
	msg10: .asciiz "\nObesidade Grau III (mórbida)"
	msg11: .asciiz "O IMC é: "
	num1: .float 16.0
	num2: .float 17.0
	num3: .float 18.5
	num4: .float 25.0
	num5: .float 30.0
	num6: .float 35.0
	num7: .float 40.0
.text

main:

	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 6
	syscall
	mov.s $f1, $f0 #f1 é a massa
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 6
	syscall
	mov.s $f2, $f0 #f2 é a massa
	mul.s $f3, $f2, $f2 #f3 é a altura^2
	div.s $f4, $f1, $f3 #f4 é o imc
	
	li $v0, 4
	la $a0, msg11
	syscall
	
	mov.s $f12, $f4
	li $v0, 2
	syscall
	
	l.s $f5, num1
	c.lt.s $f4, $f5
	bc1t magreza
	
	l.s $f5, num2
	c.lt.s $f4,$f5
	bc1t moderada
	
	l.s $f5, num3
	c.lt.s $f4,$f5
	bc1t leve
	
	l.s $f5, num4
	c.lt.s $f4,$f5
	bc1t saudavel
	
	l.s $f5, num5
	c.lt.s $f4,$f5
	bc1t sobrepeso
	
	l.s $f5, num6
	c.lt.s $f4,$f5
	bc1t obesidade1
	
	l.s $f5, num7
	c.lt.s $f4,$f5
	bc1t obesidade2
	bc1f obesidade3
	
magreza:
	li $v0, 4
	la $a0, msg3
	syscall
	j fim

moderada:
	li $v0, 4
	la $a0, msg4
	syscall
	j fim
	
leve:
	li $v0, 4
	la $a0, msg5
	syscall
	j fim
	
saudavel:
	li $v0, 4
	la $a0, msg6
	syscall
	j fim
	
sobrepeso:
	li $v0, 4
	la $a0, msg7
	syscall
	j fim
	
obesidade1:
	li $v0, 4
	la $a0, msg8
	syscall
	j fim
	
obesidade2:
	li $v0, 4
	la $a0, msg9
	syscall
	j fim
	
obesidade3:
	li $v0, 4
	la $a0, msg10
	syscall
	j fim	
	
fim:
	li $v0, 10
	syscall