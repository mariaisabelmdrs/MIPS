.data

	msg1: .asciiz "Digite a largura do lado 1: "
	msg2: .asciiz "Digite a altura do lado 1: "
	msg3: .asciiz "Digite a largura do lado 2: "
	msg4: .asciiz "Digite a altura do lado 2: "
	msg5: .asciiz "Digite a largura do lado 3: "
	msg6: .asciiz "Digite a altura do lado 3: "
	msg7: .asciiz "nDigite a largura do lado 4: "
	msg8: .asciiz "Digite a altura do lado 4: "
	msg9: .asciiz "Digite a largura do fundo: "
	msg10: .asciiz "Digite a altura do fundo: "
	msg11: .asciiz "Digite a largura do ladrilho: "
	msg12: .asciiz "Digite a altura do ladrilho: "
	msg13: .asciiz "total de ladrilhos a ser comprado é: "
	zero: .float 0.0
	
.text

main:
	l.s $f4, zero

	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 6
	syscall
	mov.s $f1, $f0 #base
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 6
	syscall
	mov.s $f2, $f0 #altura
	mul.s $f3, $f2, $f1 #area
	add.s $f4, $f4, $f3 #soma da area
	
	#lado 2
	li $v0, 4
	la $a0, msg3
	syscall
	
	li $v0, 6
	syscall
	mov.s $f1, $f0 #base
	
	li $v0, 4
	la $a0, msg4
	syscall
	
	li $v0, 6
	syscall
	mov.s $f2, $f0 #altura
	mul.s $f3, $f2, $f1 #area
	add.s $f4, $f4, $f3 #soma da area
	
	#lado 3
	li $v0, 4
	la $a0, msg5
	syscall
	
	li $v0, 6
	syscall
	mov.s $f1, $f0 #base
	
	li $v0, 4
	la $a0, msg6
	syscall
	
	li $v0, 6
	syscall
	mov.s $f2, $f0 #altura
	mul.s $f3, $f2, $f1 #area
	add.s $f4, $f4, $f3 #soma da area
	
	#lado 4
	li $v0, 4
	la $a0, msg7
	syscall
	
	li $v0, 6
	syscall
	mov.s $f1, $f0 #base
	
	li $v0, 4
	la $a0, msg8
	syscall
	
	li $v0, 6
	syscall
	mov.s $f2, $f0 #altura
	mul.s $f3, $f2, $f1 #area
	add.s $f4, $f4, $f3 #soma da area
	
	#fundo
	li $v0, 4
	la $a0, msg9
	syscall
	
	li $v0, 6
	syscall
	mov.s $f1, $f0 #base
	
	li $v0, 4
	la $a0, msg10
	syscall
	
	li $v0, 6
	syscall
	mov.s $f2, $f0 #altura
	mul.s $f3, $f2, $f1 #area
	add.s $f4, $f4, $f3 #soma da area
	
	#ladrilho
	li $v0, 4
	la $a0, msg11
	syscall
	
	li $v0, 6
	syscall
	mov.s $f1, $f0 #base
	
	li $v0, 4
	la $a0, msg12
	syscall
	
	li $v0, 6
	syscall
	mov.s $f2, $f0 #altura
	mul.s $f5, $f2, $f1 #area do ladrilho
	
	li $v0, 4
	la $a0, msg13
	syscall
	
	div.s $f12, $f4, $f5
	li $v0, 2
	syscall