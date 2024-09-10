	.data
	.align 0
	
nums: 	.word  7, 5, 2, 1, 1, 3, 4
	
	.text
	.align 2
	.global main
	
main:	addi s0, zero, 7	# s0 = max = 7
	addi t0, zero, 0	# t0 = i = 0
	addi t1, zero, 6	# t1 = j = max-1

loop1: ble t0, s0-1, fimloop	# for(i=0; i <= max-1; i++)

	j loop1
	
	
loop2:	bge t1, t0+1, loop	# for(j=6; j >= i+1; j--)
				
	ble num[t1-1], num[t1], endLoop2	# if (num[j-1] <= num[j]) break;
	
	add t2, zero, nums[t1-j]		# aux = num[j-1]
	add num[j-1], zero, num[j]		# num[j-1] := num[j];
	add num[j], zero, t2			# num[j]:= aux;
	
endLoop2:	
	j loop2Done
	j loop2
	 
loop2Done:	

	j loop1