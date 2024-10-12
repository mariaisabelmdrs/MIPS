.data
    num1: .asciiz "numero 1 "
    num2: .asciiz "numero 2 "
    num3: .asciiz "numero 3 "
    resultado: .asciiz "O produto é "
.text
    li $v0, 4
    la $a0, num1
    syscall
    
    li $v0, 5
    syscall
     
     move $t1, $v0 
     
    li $v0, 4
    la $a0, num2
    syscall
    
     li $v0, 5
     syscall
     
     move $t2, $v0 
     
    li $v0, 4
    la $a0, num3
    syscall
    
     li $v0, 5
     syscall
     
     move $t3, $v0 
     
     mul $t4, $t1, $t2
     mul $t5, $t3, $t4
     
     li $v0, 4
    la $a0, resultado
    syscall
    
     li $v0, 1
     move $a0, $t5
     syscall