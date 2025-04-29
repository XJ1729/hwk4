# arithmetic.asm program
# CS 64, Z.Matni
#
# 1. Prompt the user for 3 inputs: a, b, c
# 2. Calculate 16*( a - 8*b) + 7*c using only one mult instruction
# 3. Print out the result

.text
main:
	# TODO: Write your code here!
	li $v0, 5
	syscall

	move $a1, $v0

	li $v0, 5
	syscall

	move $a2, $v0

	li $v0, 5
	syscall

	move $a3, $v0

	sll $a2, $a2, 3

	sub $a0, $a1, $a2

	sll $a0, $a0, 4

	li $t0, 7

	mult $a3, $t0

	mflo $a3

	add $a0, $a0, $a3

	li $v0, 1
	syscall





exit:
	# Exit SPIM: Write your code here!
	li $v0, 10
	syscall
