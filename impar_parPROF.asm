.data
msg1: .asciiz"\nO número é par!"
msg2: .asciiz"\nO número é ímpar!"
msg3: .asciiz"\nDigite um número inteiro: "
.text
main:
   li $v0, 4
   la $a0, msg3
   syscall
   
   li $v0, 5
   syscall
   
   add $t1, $v0, $zero
   rem $t2, $t1, 2
   
   beq $t2, 0, se
   j senao
   
se:
   li $v0, 4
   la $a0, msg1
   syscall
   j fimse
   
senao:
   li $v0, 4
   la $a0, msg2
   syscall
   
fimse: