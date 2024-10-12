.data
msg1: .asciiz"\nDigite um número inteiro: "
msg2: .asciiz"\n"
.text
main:
li $t5, 0
li $v0, 4
la $a0, msg1
syscall
li $v0, 5
syscall
add $t0, $v0, $zero
enquanto:
mul, $t1, $t0, $t5
li $v0, 1
add $a0, $t1, $zero
syscall
li $v0, 4
la $a0, msg2
syscall
add $t5, $t5, 1
ble $t5, 10, enquanto
li $v0, 1
add $a0, $t1, $zero
syscall
li $v0, 4
la $a0, msg2
syscall
add $t5, $t5, 1
ble $t5, 10, enquanto