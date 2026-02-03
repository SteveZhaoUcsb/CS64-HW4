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
li $v0,4
la $a0,prompt
syscall

li $v0,5
syscall
add $t0,$zero,$v0

# Initialize all registers needed in the program (as appropriate)
li $t7,1
addu $t1,$zero,$t7
addu $t2,$zero,$t7
li $t7,2
addu $t3,$zero,$t7
addu $t4,$zero,$zero

# if (exit conditions are met) then go to exit
li $t7,1
ble $t0,$t7,exit
# otherwise:
    # print "The first " n " numbers in the Fibonacci series are:\n"
    li $v0,4
    la $a0,first
    syscall

    li $v0,1
    move $a0,$t0
    syscall

    li $v0,4
    la $a0,numbers
    syscall

    # print f1 " " f2
    li $v0,1
    move $a0,$t1
    syscall

    li $v0,4
    la $a0,spacech
    syscall

    li $v0,1
    move $a0,$t2
    syscall
    
    # while loop:
loop:    
    bge $t3,$t0,while
    add $t4,$t1,$t2
    add $t1, $zero, $t2
    add $t2, $zero, $t4

    li $v0,4
    la $a0,spacech
    syscall

    li $v0,1
    move $a0,$t2
    syscall
    addi $t3, $t3, 1
    j loop

while:
exit:
# print newline
li $v0,4
    la $a0,newline
    syscall

# quit program
li $v0,10
syscall