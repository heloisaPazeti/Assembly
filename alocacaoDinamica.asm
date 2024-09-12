    	.data
    	.align 0            # Char são apenas 1 byte

strsrc: .asciz "Teste"

    	.align 2            # Porque inteiros são 4 bytes

ptr: 	.word              # Ponteiro

    	.text
    	.align 0
    	.globl main

main: # Contar número de caracteres na string origem

    	# s0 -> endereço string origem
    	# s1 -> endereço do ptr
    	# s2 -> endereço da string destino
    	# t0 -> conteudo da posição da string
    	# t1 -> contador
    	# t3 -> lendo e copiando a string

    	la s0, strsrc          	# la -> Load Adress -> colocou o endereço da string de origem no s0
    	lb t0, 0(s0)            # lb -> Load Byte -> quem vai receber, a posição do endereço
    	addi t1, zero, 1        # Colocando 1 no contador

loop1:

    	beq t0, zero, saiLoop     # if t0 == t1 saiLoop
    	addi s0, s0, 1          # Somamos um no endereço
    	lb t0, 0(s0)
    	addi t1, t1, 1          # Somamos 1 no contador
     
    	j loop1

saiLoop:                    # Aloca memória

    	addi, a7, zero, 9       # Passsando instrução de alocação
    	add a0, zero, t1        # Retonar no a0 o tamanho t1
    	ecall

    	la s1, ptr              # Load Adress
    	sw a0, 0(s1)            # Store Word -> word, where Store -> posição 0 de s1 -> byte mais significativo

    # Copiar em s0 endereço string origem e em s2 endereço da string destino
    # Repetindo caso tivesse perdido o valor de a0

    	la s0, strsrc          	# Colocando em s0 o endereço da string de origem
    	la s1, ptr              # Colocando em s1 o endereço do ponteiro
    	lw s2, 0(s1)            # Colocando em s2 o word da string destino

 loop2:   
 
    	lb t3, 0(s0)            # Lê o primeiro byte da string origem
    	sb t3, 0(s2)            # Copia o primeiro byte pro s2

    	addi s0, s0, 1          # Avança ponteiro de s0
    	addi s2, s2, 1          # Avança ponteiro de s2

    	bne t3, zero, loop2      # Compara se não são iguais

    	addi a7, zero, 4        # Código pra imprimir string
    	la s1, ptr              # Repetindo pra fixar
    	lw a0, 0(s1)            # Carrega pra a0 o primeiro byte de s1
    	ecall

    	addi a7, zero, 10       # Finalizar
    	ecall

    
