.data
msg1: .asciiz"\nO n�mero � par!"
msg2: .asciiz"\nO n�mero � �mpar!"
msg3: .asciiz"\nDigite um n�mero inteiro: "
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