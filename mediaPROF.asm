.data
    msg1:.asciiz "\nMédia Aritmética: \n"
    msg2:.asciiz "\nDigite a primeira nota: \n"
    msg3:.asciiz "\nDigite a segunda nota: \n"
    msg4:.asciiz "\nAlgoritmo de Cálculo de Média Simples: (N1+N2)/2\n"
    float_value: .float 2.0
.text
main:

#Mensagem referente ao objetivo do algoritmo
   li $v0, 4
   la $a0, msg4
   syscall
#Solicitar ao usuário a primeira nota...
   li $v0, 4
   la $a0, msg2
   syscall
   
   li $v0, 6
   syscall
   mov.s $f1, $f0
   
#Solicitar ao usuário a segunda nota...
   li $v0, 4
   la $a0, msg3
   syscall

   li $v0, 6
   syscall
   
   mov.s $f2, $f0
#Definição do quantitativo de notas...
   lwc1 $f3, float_value  # Carrega o valor de ponto flutuante 2.0 em $f3
   #li.s $f3, 2.0
   #add.s $f3, $zero, 2.0
#li.s $f1, 8.5
#li.s $f2, 6.0

#Somar e Dividir por 2...
   add.s $f4, $f1, $f2
   div.s $f10, $f4, $f3
#Mostrar resultado ao usuário....
   li $v0, 4
   la $a0, msg1
   syscall
   
   li $v0, 2
   mov.s $f12, $f10
   syscall