.data
    msg1: .asciiz "Informe n1: "
    msg2: .asciiz "Informe n2: "
    media: .asciiz "A media � "
.text
    li $v0, 4
    la $a0, msg1
    syscall
    
    li $v0, 5
    syscall
    
    move $t1, $v0
    
    li $v0, 4
    la $a0, msg2
    syscall
    
    li $v0, 5
    syscall
    
    move $t2, $v0
    
    add $t3, $t1, $t2 #soma
    
    li $t4, 2 #divisor =2
    
    div $t3, $t4
    mflo $s0  # Move o quociente da divis�o inteira para $s0
    
    li $v0, 4
    la $a0, media
    syscall
    
    li $v0, 1       # Carrega o c�digo do servi�o de impress�o inteira no $v0
    move $a0, $s0    # Move o valor da m�dia para o argumento $a0
    syscall         # Chama o servi�o do sistema para imprimir o resultado