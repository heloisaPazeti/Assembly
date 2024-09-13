        .data
        .align 2

nums:   .word   1, 2, 3, 4

        .text
        .align 2
        .globl main

main:

        addi s0, zero, 4        # s0 -> size = 4
        addi s1, zero, 0        # s1 -> i = 0
        addi s2, zero, 0        # s2 -> sum = 0

for:    bge s1, s0, forEnd      # if s1 >= s0 (i >= 4) {break}

        la t0, nums				# t0 = &nums
        addi t1, zero, 4		# t1 = 4

        mul t2, t1, s1			# t2 = 4*i
        add t0, t0, t2			# &t0 = &num[i]

        lw s4, 0(t0)			# s4 = num[i]

        add s2, s2, s4          # s2 = s2 + s4 -> s2 += nums[i]
        addi s1, s1, 1          # i++

        j for


forEnd:

        li a7, 1	 					# printa int
        add a0, zero, s2				# printa soma
        ecall

        addi a7, zero, 10				# encerra o programa
        ecall
