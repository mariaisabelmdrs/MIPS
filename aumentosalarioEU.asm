.data
     salario: .asciiz "Informe seu salário: "
     NovoSalario: .asciiz "Seu novo salário é "
     porcentagem: .float 1.10
.text
    li $v0, 4
    la $a0, salario
    syscall
    
    li $v0, 6
    syscall
    
    #calculos 
    mov.s $f1, $f0
    
    lwc1 $f2, porcentagem   
    mul.s $f10, $f1, $f2
    
    li $v0, 4
    la $a0, NovoSalario
    syscall
     
    li $v0, 2
    mov.s $f12, $f10
    syscall                           