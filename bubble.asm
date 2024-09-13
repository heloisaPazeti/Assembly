		.data
		.align 2
	
nums: 	.word  7, 5, 2, 1, 1, 3, 4

		.align 0

space:	.asciz	" "
	
		.text
		.align 2
		.global main
	
main:	addi s0, zero, 7				# s0 = max = 7
		addi t4, zero, 0				# t0 = i = 0
		addi t1, s0, -1					# t1 = j = max-1
		addi t2, t0, 1					# t2 = t0 + 1 = i + 1


loop1:	blt t1, t2, fimLoop1			# j < i+1

		addi t3, t1, -1					# t3 = j-1

		la s3, nums						# s3 = &nums
		addi a1, zero, 4				# a1 = 4

		mul a2, a1, t3					# a2 = 4*(j-1)
		add s3, s3, a2					# &s3 = &num[j-1]

		lw s1, 0(s3)					# s1 = num[j-1]
		addi s3, s3, 4					# &s3 = &num[j]
		lw s2, 0(s3)					# s2 = num[j]

		ble s1, s2, outIf				# s1 <= s2 -> out
		
		mv a0,s1						# a0 = nums[j-1]
		mv s1, s2						# nums[j-1] = nums[j]
		mv s2, a0 						# nums[j] = a0

		sw s2, 0(s3) 					# &nums[j] = nums[j]
		addi s3, s3, -4 
		sw s1, 0(s3)					# &nums[j-1] = nums[j-1]


		addi t1, t1, -1
		j loop1

outIf:

	addi t1, t1, -1
	j loop1
		 
fimLoop1:
		addi a3, zero, 6
		bgt t4, a3, print				# se i > 6 -> sai dos loops
		addi t4, t4, 1					# i++
		addi t2, t4, 1					# t2 = t1 +1
		addi t1, s0, -1					# t1 = max - 1

		j loop1

print: 

		addi s1, zero, 0				# i = 0
		addi a1, zero, 4				# a1 = 4
		la s3, nums						# s3 = &nums

printLoop:

		addi s0, zero, 6
		bgt s1, s0, fimProg				# if(i >= 7) end
		#addi a2, zero, 4

		#mul a2, a1, s1					# a2 = 4*i
		#add s3, s3, a2					# &s3 = &num[i]
		#lw s2, 0(s3)					# s2 = num[i]
		
		li a7, 1	 					# printa nums[i]
		lw a0, 0(s3)					# mv -> Move Value
		ecall

		addi a7, zero, 4	 			# printa espaço
		la a0, space
		ecall

		addi s1, s1, 1					# i++
		addi s3, s3, 4
		j printLoop

fimProg:

		addi a7, zero, 10				# encerra o programa
		ecall



# a0 - a1 - a2 - a3
# t0 - t1 - t2 - t3
# s0 - s1 - s2 - s3