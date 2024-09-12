		.data
		.align 0
	
nums: 	.word  7, 5, 2, 1, 1, 3, 4
	
		.text
		.align 2
		.global main
	
main:	addi s0, zero, 7				# s0 = max = 7
		addi t0, zero, 0				# t0 = i = 0
		addi t1, zero, 6				# t1 = j = max-1
		addi t2, t0, 1					# t2 = t0 + 1 = i + 1

loop1:	bge t1, t2, fimLoop1			# j >= i+1i

		addi t3, t1, -1					# t3 = j-1
		blt (t3)nums, (t1)nums, outIf
		
		add a0, zero, (t3)nums			# a0 = nums[j-1]
		add (t3)nums, zero, (t1)nums	# nums[j-1] = nums[j]
		add (t1)nums, zero, a0 			# nums[j] = a0

		
		addi t1, t1, -1
		j loop1

outIf:

	addi t1, t1, -1
	j loop1
		 
fimLoop1:

		bgt t0, 6, print		# se i > 6 -> sai dos loops
		addi t0, t0, 1			# i++
		addi t2, t0, 1			# t2 = t1 +1
		j loop1

print: 

		addi s1, zero, 0		# i = 0
		bge s1, 7, fimProg		# if(i >= 7) end

		addi a7, zero, 4	 	# printa numero
		la a0,(s1)nums			# printa nums[i]
		ecall

		addi s1, s1, 1			# i++
		j print

fimProg:

		addi a7, zero, 10		# encerra o programa
		ecall