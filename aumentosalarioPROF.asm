.data
    msg1:.asciiz "\nDigite o Valor do Seu Salário: \n"
    msg2:.asciiz "\nO Valor do Salário com o Reajuste (10%) é: \n"
    porcentagem: .float 0.1    
.text
main:
#Solicitar ao usuário o valor do salário...
    li $v0, 4
    la $a0, msg1
    syscall
    
    li $v0, 6
    syscall
    
    mov.s $f1, $f0
#Percentual de reajuste (10%)...
    lwc1 $f4, porcentagem
#Multiplicação dos números...
    mul.s $f5, $f1, $f4
    add.s $f10, $f1, $f5
#Mostrar resultado ao usuário....
    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 2
    mov.s $f12, $f10
    syscall