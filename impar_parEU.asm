.data
     msg: .asciiz "Forneça um numero: "
     impar: .asciiz "O numero é impar!"
     par: .asciiz "O numero é par!"
.text
     li $v0, 4
     la $a0, msg
     syscall
     
     li $v0, 5
     syscall
     
     move $t1, $v0
     
     li $t3, 2
     
     div $t1, $t3
     
     mfhi $t5
     
     beq $t5, $zero, ImprimePar
     
     li $v0, 4
     la $a0, impar
     syscall
     
     li $v0, 10
     syscall
     
     ImprimePar:
              li $v0, 4
              la $a0, par
              syscall
     
              li $v0, 10
              syscall