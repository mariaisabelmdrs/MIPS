.data
msg1: .asciiz "\nCálculo da Situação dos Alunos ao Final do Período Letivo\n"
msg2: .asciiz "\nQuantas notas serão utilizada no cálculo da Média? "
msg3: .asciiz " - Digite a nota do aluno: "
msg4: .asciiz "\n"
msg5: .asciiz "\nSituação do Aluno (a): "
msg6: .asciiz "\nAluno (a) Reprovado!\n "
msg7: .asciiz "\nAluno (a) Aprovado!\n "
msg8: .asciiz "\nAluno (a) em Prova Final!\n "
msg9: .asciiz "\nApuração (Média): "
msg10: .asciiz "\nDeseja Apurar Novo Resultado? [1-Sim] / [2-Sair] "
.text
main:

# Descrição dos Objetivos do Algoritmo
li $v0, 4
la $a0, msg1
syscall
# Informar ao programa a quantidade de notas que compõem a média
li $v0, 4
la $a0, msg2
syscall
li $v0, 6
syscall
mov.s $f10, $f0
li.s $f9, 1.0
#Enquanto $f9 é menor e igual a $f10 faça
enquanto:
#Número sequencial relativo ao passo da execução
li $v0, 2
mov.s $f12, $f9
syscall
#O usuário deve informar a nota do aluno
li $v0, 4
la $a0, msg3
syscall
li $v0, 6
syscall
mov.s $f2, $f0
#Acumulador das notas digitas pelo usuário
add.s $f3, $f3, $f2
#Contador da condição de execução do enquanto ($f9 menor ou igual a
$f10)
li.s $f11, 1.0
add.s $f9, $f9, $f11
#Se $f9 é menor ou igual a $f10, salte para o rótulo enquanto
c.le.s $f9, $f10
bc1t enquanto
#----Fim do Enquanto -----
#Relebrando o Conteúdo das nossas Variáveis (registradores neste caso)
#$f3: contém a soma das notas do aluno (a) em ponto flutuante;
#$f10: contém o quantitativo de notas do aluno (a) em ponto flutuante;
#$f4: é o resultado do cálculo da média das notas do aluno (a)
#calculando a média aritmética da nota do aluno (a):
div.s $f4, $f3, $f10
#Definindo a situação do Aluno (a)
#Comparação: se $f1 é menor ou igual a $f2; se verdadeiro = 1, se falso = 0.
#igual a 1 salto para "se"; igual a 0 salto para "senao".
li.s $f13, 4.0
c.lt.s $f4, $f13
bc1t se
bc1f senao
se:
#Informar ao usuário a reprovação do aluno (a)
li $v0, 4
la $a0, msg5
syscall
li $v0, 4
la $a0, msg6
syscall
j fimse
senao:
# se $f4 é maior ou igual a 7.0, informar aprovação.
li.s $f14, 7.0
c.lt.s $f4, $f14
bc1t se2
bc1f senao2
se2:
#Informar ao usuário a aprovação do aluno (a)
li $v0, 4
la $a0, msg5
syscall
li $v0, 4
la $a0, msg8
syscall
j fimse
senao2:
#Informar ao usuário que o aluno (a) está na Prova Final!
li $v0, 4
la $a0, msg5
syscall
li $v0, 4
la $a0, msg7
syscall
j fimse
fimse:
#Informar a média artimética alcançada pelo aluno (a)
li $v0, 4
la $a0, msg9
syscall
li $v0, 2
mov.s $f12, $f4
syscall
#Perguntar ao Usuário ses ele deseja sair do programa
li $v0, 4
la $a0, msg10
syscall
li $v0, 6
syscall
mov.s $f18, $f0
#Condição para retornar ao programa. Menor e igual a 1
li.s $f22, 1.0
c.le.s $f18, $f22
bc1t main