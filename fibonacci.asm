# fibonacci.asm program
# CMPSC 64, (c) 2025, Z.Matni
#
#    unsigned int n, f1 = 1, f2 = 1, i = 2, nextfib;
#    cout << "Enter a number:\n";
#    cin >> n;
#    if (n > 1) {
#        cout << "The first " << n << " numbers in the Fibonacci series are:\n";
#        cout << f1 << " " << f2;
#        while (i < n) {
#            nextfib = f1 + f2;
#            f1 = f2;
#            f2 = nextfib;
#            cout << " " << nextfib;
#            i++;
#        }
#    }
#   cout << endl;

.data
	prompt:     .asciiz "Enter a number:\n"
    first:      .asciiz "The first "
    numbers:    .asciiz " numbers in the Fibonacci series are:\n"
	spacech:    .asciiz " "
    newline:    .asciiz "\n"
	
.text
main:
# TODO: Follow the comments below, and the assignment description, 
#       as guides for how to write this assembly program.


# Print the prompt and get user input
	li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5
    syscall

    # move user input into $a1
    move $a1, $v0

# Initialize all registers needed in the program (as appropriate)
    li $t0, 1
    li $t1, 1
    li $t5, 2
# if (exit conditions are met) then go to exit
    ble $a1, $t0, exit
# otherwise:
    # print "The first " n " numbers in the Fibonacci series are:\n"
    li, $v0, 4
    la $a0, numbers
    syscall
    # print f1 " " f2
    li, $v0, 1
    move $a0, $t0
    syscall

    # print space
    li, $v0, 4
    la $a0, spacech
    syscall

    li, $v0, 1
    move $a0, $t1
    syscall

    # while loop:
while:
    # break if $t5 (i) is greater than or equal to $a1 (n)
    bge $t5, $a1, exit
    add $t2, $t0, $t1
    # move t1 into t0
    move $t0, $t1
    # move t3 into t1
    move $t1, $t2
    # print space
    li, $v0, 4
    la $a0, spacech
    syscall

    li, $v0, 1
    move $a0, $t2
    syscall

    # increment
    addi $t5, $t5, 1

    # jump back up to loop
    j while


exit:
# print newline
li $v0, 4
la $a0, newline
syscall

li $v0, 10
syscall
# quit program
