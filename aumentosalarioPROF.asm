.data
    msg1:.asciiz "\nDigite o Valor do Seu Sal�rio: \n"
    msg2:.asciiz "\nO Valor do Sal�rio com o Reajuste (10%) �: \n"
    porcentagem: .float 0.1    
.text
main:
#Solicitar ao usu�rio o valor do sal�rio...
    li $v0, 4
    la $a0, msg1
    syscall
    
    li $v0, 6
    syscall
    
    mov.s $f1, $f0
#Percentual de reajuste (10%)...
    lwc1 $f4, porcentagem
#Multiplica��o dos n�meros...
    mul.s $f5, $f1, $f4
    add.s $f10, $f1, $f5
#Mostrar resultado ao usu�rio....
    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 2
    mov.s $f12, $f10
    syscall