#codigo de strcpy com tamanhos fixos fixo

	.data
	.align 0
str.src:.asciz	"Teste do stcpy"
str.dst:.space  16	# Reserva essa quantidade de bytes

	.text
	.align 2
	.global main
	
main:	la s0,str.src
	la s1,str.dst
	
	
loop:	lb t0,0(s0)	#le o byte na string de origem
	sb t0,0(s1)	#escreve o byte na str de destino
	
	#pula para o prox byte de cada string
	addi,s0,s0,1
	addi,s1,s1,1
	
	bne t0,zero,loop #repete o loop ate chegar em algum byte que vale zero (\0) da string de origem
	
	addi a7,zero,4	 #printf str de destino
	la a0,str.dst
	ecall
	
	addi a7,zero,10	#encerra o programa
	ecall