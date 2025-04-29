# maximum.asm program
# CS 64, Z.Matni
#
# Get 3 integer inputs from the user (std.in)
# Reveal the maximum absolute value (e.g., entering -3, 2, 1 will give the answer 3)
# See assignment description for details

#Data Area (i.e. memory setup directive)
.data
	# TODO: Complete these incomplete declarations / initializations

	prompt:      .asciiz "Enter the next number:\n"
    newline:     .asciiz "\n"
	maximum:     .asciiz "Maximum: "

#Text Area (i.e. instructions/code directive)
.text

main:

	# TODO: Write your code here
    # You can have other labels expressed here, if you need to

	# print prompt
	li $v0, 4
    la $a0, prompt
    syscall

	# get input 1
	li $v0, 5
    syscall
	move $t0, $v0

	# print prompt
	li $v0, 4
    la $a0, prompt
    syscall

	# get input 2
	li $v0, 5
    syscall
	move $t1, $v0

	# print prompt
	li $v0, 4
    la $a0, prompt
    syscall

	# get input 3
	li $v0, 5
    syscall
	move $t2, $v0

	blt $t0, $zero, absolute1
second:
	blt $t1, $zero, absolute2
third:
	blt $t2, $zero, absolute3

	j done


absolute1:
	sub $t0, $zero, $t0
	j second

absolute2:
	sub $t1, $zero, $t1
	j third

absolute3:
	sub $t2, $zero, $t2
	j done

done:
	li $v0, 4
    la $a0, maximum
    syscall
	# figure out if 1 is greater than both 2 and 3
	li $a0, 1
	slt $a1, $t1, $t0
	slt $a2, $t2, $t0
	and $a3, $a1, $a2
	beq $a0, $a3, largest1

	# figure out if 2 is greater than both 1 and 3
	slt $a1, $t0, $t1
	slt $a2, $t2, $t1
	and $a3, $a1, $a2
	beq $a0, $a3, largest2

	# figure out if 3 is greater than both 1 and 2
	slt $a1, $t0, $t2
	slt $a2, $t1, $t2
	and $a3, $a1, $a2
	beq $a0, $a3, largest3

largest1:
	li $v0, 1
	move $a0, $t0
	syscall
	j exit

largest2:
	li $v0, 1
	move $a0, $t1
	syscall
	j exit

largest3:
	li $v0, 1
	move $a0, $t2
	syscall
	j exit

exit:
	li $v0, 4
	la $a0, newline
	syscall

	li $v0, 10
	syscall
	# TODO: Write code to properly exit a SPIM simulation

