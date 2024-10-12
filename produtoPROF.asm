.data
msg1:.asciiz "\nO Produto é: \n"
msg2:.asciiz "\nDigite o primeiro número real (n1): \n"
msg3:.asciiz "\nDigite o segundo número real (n2): \n"
msg4:.asciiz "\nDigite o terceiro número real (n3): \n"
msg5:.asciiz "\n.::Algoritmo: Cálculo do Produto de 3 Números Reais do Usuário.::\n"
ffloat: .float 2.0
.text
main:
#Mensagem referente ao objetivo do algoritmo
li $v0, 4
la $a0, msg5
syscall
#Solicitar ao usuário o primeiro número...
li $v0, 4
la $a0, msg2
syscall
li $v0, 6
syscall
mov.s $f1, $f0
#Solicitar ao usuário o segundo número...
li $v0, 4
la $a0, msg3
syscall
li $v0, 6
syscall
mov.s $f2, $f0
#Solicitar ao usuário o terceiro número...
li $v0, 4
la $a0, msg3
syscall
li $v0, 6
syscall
mov.s $f3, $f0
#Definição do quantitativo de notas...
#li.s $f4, 2.0
lwc1 $f4, ffloat
#li.s $f1, 8.5
#li.s $f2, 6.0
#Multiplicação dos números...
mul.s $f5, $f1, $f2
mul.s $f10, $f5, $f3
#Mostrar resultado ao usuário....
li $v0, 4
la $a0, msg1
syscall
li $v0, 2
mov.s $f12, $f10
syscall