	.data
	.align 0
str1:	.asciz "Digite um número "
str2:	.asciz "O fatorial de "
str3:	.asciz " eh "

	.text
	.align 2
	.global main

main:	addi a7,zero,4	#printf str1
	la a0,str1
	ecall
	addi a7,zero,5	#scanf
	ecall
	add s0,zero,a0	#variavel n, eh o fatorial que queremos
	addi s1,zero,1	#fatorial, comeca com 1
	add s2,zero,s0	#count=n
	addi t0,zero,1   #condicao de parada, t0
	
loop:	bgt t0,s2,sloop #caso o count(s2), seja maior que a condicao de parada continua o loop
	#ble s2,t0,sloop outra opcao
	mul  s1,s1,s2 #fatorial(s1) recebe fatorial(s1) * count(s2)
	addi s2,s2,-1 #diminui o count
	j loop #volta pro loop que estamos acima
	
sloop:	addi a7,zero,4	#printf str2
	la a0,str2
	ecall
	
	addi a7,zero,1	#printf do numero digitado
	add a0,zero,s0
	ecall
	
	addi a7,zero,4	#printf str3
	la a0,str3
	ecall
	
	addi a7,zero,1	#printf do fatorial
	add a0,zero,s1
	ecall
	
	addi a7,zero,10	#encerra o programa
	ecall