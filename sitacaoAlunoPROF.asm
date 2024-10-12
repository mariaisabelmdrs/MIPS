.data
msg1: .asciiz "\nC�lculo da Situa��o dos Alunos ao Final do Per�odo Letivo\n"
msg2: .asciiz "\nQuantas notas ser�o utilizada no c�lculo da M�dia? "
msg3: .asciiz " - Digite a nota do aluno: "
msg4: .asciiz "\n"
msg5: .asciiz "\nSitua��o do Aluno (a): "
msg6: .asciiz "\nAluno (a) Reprovado!\n "
msg7: .asciiz "\nAluno (a) Aprovado!\n "
msg8: .asciiz "\nAluno (a) em Prova Final!\n "
msg9: .asciiz "\nApura��o (M�dia): "
msg10: .asciiz "\nDeseja Apurar Novo Resultado? [1-Sim] / [2-Sair] "
.text
main:

# Descri��o dos Objetivos do Algoritmo
li $v0, 4
la $a0, msg1
syscall
# Informar ao programa a quantidade de notas que comp�em a m�dia
li $v0, 4
la $a0, msg2
syscall
li $v0, 6
syscall
mov.s $f10, $f0
li.s $f9, 1.0
#Enquanto $f9 � menor e igual a $f10 fa�a
enquanto:
#N�mero sequencial relativo ao passo da execu��o
li $v0, 2
mov.s $f12, $f9
syscall
#O usu�rio deve informar a nota do aluno
li $v0, 4
la $a0, msg3
syscall
li $v0, 6
syscall
mov.s $f2, $f0
#Acumulador das notas digitas pelo usu�rio
add.s $f3, $f3, $f2
#Contador da condi��o de execu��o do enquanto ($f9 menor ou igual a
$f10)
li.s $f11, 1.0
add.s $f9, $f9, $f11
#Se $f9 � menor ou igual a $f10, salte para o r�tulo enquanto
c.le.s $f9, $f10
bc1t enquanto
#----Fim do Enquanto -----
#Relebrando o Conte�do das nossas Vari�veis (registradores neste caso)
#$f3: cont�m a soma das notas do aluno (a) em ponto flutuante;
#$f10: cont�m o quantitativo de notas do aluno (a) em ponto flutuante;
#$f4: � o resultado do c�lculo da m�dia das notas do aluno (a)
#calculando a m�dia aritm�tica da nota do aluno (a):
div.s $f4, $f3, $f10
#Definindo a situa��o do Aluno (a)
#Compara��o: se $f1 � menor ou igual a $f2; se verdadeiro = 1, se falso = 0.
#igual a 1 salto para "se"; igual a 0 salto para "senao".
li.s $f13, 4.0
c.lt.s $f4, $f13
bc1t se
bc1f senao
se:
#Informar ao usu�rio a reprova��o do aluno (a)
li $v0, 4
la $a0, msg5
syscall
li $v0, 4
la $a0, msg6
syscall
j fimse
senao:
# se $f4 � maior ou igual a 7.0, informar aprova��o.
li.s $f14, 7.0
c.lt.s $f4, $f14
bc1t se2
bc1f senao2
se2:
#Informar ao usu�rio a aprova��o do aluno (a)
li $v0, 4
la $a0, msg5
syscall
li $v0, 4
la $a0, msg8
syscall
j fimse
senao2:
#Informar ao usu�rio que o aluno (a) est� na Prova Final!
li $v0, 4
la $a0, msg5
syscall
li $v0, 4
la $a0, msg7
syscall
j fimse
fimse:
#Informar a m�dia artim�tica alcan�ada pelo aluno (a)
li $v0, 4
la $a0, msg9
syscall
li $v0, 2
mov.s $f12, $f4
syscall
#Perguntar ao Usu�rio ses ele deseja sair do programa
li $v0, 4
la $a0, msg10
syscall
li $v0, 6
syscall
mov.s $f18, $f0
#Condi��o para retornar ao programa. Menor e igual a 1
li.s $f22, 1.0
c.le.s $f18, $f22
bc1t main