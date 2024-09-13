		.data
		.align 2
	
nums: 	.word  7, 5, 2, 1, 1, 3, 4

		.align 0

str.src:.asciz	"//"
str.dst:.asciz	"---"
	
		.text
		.align 2
		.global main
	
main:	addi s0, zero, 7				# s0 = max = 7
		addi t0, zero, 0				# t0 = i = 0
		addi t1, zero, 6				# t1 = j = max-1
		addi t2, t0, 1					# t2 = t0 + 1 = i + 1


loop1:	bgt t1, t2, fimLoop1			# j > i+1

		addi t3, t1, -1					# t3 = j-1

		la s3, nums						# s3 = &nums
		addi a1, zero, 4				# a1 = 4

		mul a2, a1, t3					# a2 = 4*(j-1)
		add s3, s3, a2					# &s3 = &num[j-1]


		addi a7, zero, 1	 			# printa nums[i]
		mv a0, t1						# mv -> Move Value
		ecall

		addi a7,zero,4	 #printf str de destino
		la a0,str.dst
		ecall

		addi a7, zero, 1	 			# printa nums[i]
		mv a0, t2						# mv -> Move Value
		ecall

		addi a7,zero,4	 #printf str de destino
		la a0,str.dst
		ecall

		addi a7, zero, 1	 			# printa nums[i]
		mv a0, t3						# mv -> Move Value
		ecall

		addi a7,zero,4	 #printf str de destino
		la a0,str.dst
		ecall

		addi a7, zero, 1	 			# printa nums[i]
		mv a0, a1						# mv -> Move Value
		ecall

		addi a7,zero,4	 #printf str de destino
		la a0,str.dst
		ecall

		addi a7, zero, 1	 			# printa nums[i]
		mv a0, a2						# mv -> Move Value
		ecall

		addi a7,zero,4	 #printf str de destino
		la a0,str.src
		ecall


		lw s1, 0(s3)					# s1 = num[j-1]
		addi s3, s3, 4					# &s3 = &num[j]
		lw s2, 0(s3)					# s2 = num[j]

		blt s1, s2, outIf
		
		add a0, zero, s1				# a0 = nums[j-1]
		add s1, zero, s2				# nums[j-1] = nums[j]
		add s2, zero, a0 				# nums[j] = a0

		addi t1, t1, -1
		j loop1

outIf:

	addi t1, t1, -1
	j loop1
		 
fimLoop1:
		addi a0, zero, 6
		bgt t0, a0, print				# se i > 6 -> sai dos loops
		addi t0, t0, 1					# i++
		addi t2, t0, 1					# t2 = t1 +1
		j loop1

print: 

		addi s1, zero, 0				# i = 0
		addi a1, zero, 4				# a1 = 4
		la s3, nums						# s3 = &nums

printLoop:

		bge s1, s0, fimProg				# if(i >= 7) end

		mul a2, a1, s1					# a2 = 4*i
		add s3, s3, a2					# &s3 = &num[i]
		lw s2, 0(s3)					# s2 = num[i]
		
		addi a7, zero, 1	 			# printa nums[i]
		mv a0, s2						# mv -> Move Value
		ecall

		addi s1, s1, 1					# i++
		j printLoop

fimProg:

		addi a7, zero, 10				# encerra o programa
		ecall



# a0 - a1 - a2
# t0 - t1 - t2 - t3
# s0 - s1 - s2 - s3