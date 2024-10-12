.data
    msg1: .asciiz "Informe n1: "
    msg2: .asciiz "Informe n2: "
    media: .asciiz "A media é "
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
    mflo $s0  # Move o quociente da divisão inteira para $s0
    
    li $v0, 4
    la $a0, media
    syscall
    
    li $v0, 1       # Carrega o código do serviço de impressão inteira no $v0
    move $a0, $s0    # Move o valor da média para o argumento $a0
    syscall         # Chama o serviço do sistema para imprimir o resultado