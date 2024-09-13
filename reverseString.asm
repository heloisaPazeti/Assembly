        .data
        .align 2

size:   .word   100

        .text
        .align 2
        .globl main

main:

        ########################################################## READ STRING

        li a7, 9            # ecall alocate memory
	    lw a0, size         # a0 = size
	    addi a0, a0, 1      # a0 = size+1 = str + /0
	    ecall               # ecall alocates in a0 size bytes

        mv s0, a0           # s0 = &a0 -> original text

        li a7, 9            # ecall alocate memory
	    lw a0, size         # a0 = size
	    addi a0, a0, 1      # a0 = size+1 = str + /0
	    ecall               # ecall alocates in a0 size bytes

        mv s1, a0           # s1 = &a0 -> reversed text 

        li a7, 8            # ecall to read string
	    mv a0, s0           # a0 = &original
	    lw a1, size         # a1 = size
	    addi a1, a1, 1      # a1 = size+1 = str + /0
	    ecall               # reads a1 bytes and stores in s0

        ########################################################## 

        addi t0 zero, 0     # t0 = count = 0
        add t1, zero, s0    # t1 = &s0
        lb a2, 0(t1)        # a2 = stringOriginal[0]
       
        li t3, 0            # t1 = /0
        li t4, 10           # t4 = /n

countChar:

        beq a2, t3, setString       # if char = /0 -> end of string
        beq a2, t4, setString       # if char = /n -> end of string

        addi t0, t0, 1              # count++
        addi t1, t1, 1              # t1 = &t1[i+1]
        lb a2, 0(t1)                # t2 = t1[i+1]

        j countChar

setString:

        add t1, zero, t0 
        addi t1, t1, -1                 # t1 = count - 1 -> taking of /0 or /n
        addi t0, zero, 0                # t0 = i = 0

        mv s2, s0                       # s2 = &original
        mv s3, s1                       # s3 = &reversed

        add s2, s2, t1                  # s2 = &reversed[count - 1]


reverseString:

        bgt t0, t1, printString         # if i > count-1 {printString()} 

        lb a1, 0(s2)	                    # le o byte na string de origem
        sb a1, 0(s3)	                    # escreve o byte na str de destino

        addi s2, s2, -1
        addi s3, s3, 1


        addi t0, t0, 1      #i++
        j reverseString

printString:

        addi a7,zero,4	 #printf str de destino
		mv a0, s1
		ecall

        addi a7,zero,10	#encerra o programa
		ecall

############################################################### USED REGISTERS

# a0, a1
# t0, t1, t2
# s0, s1, s2, s3