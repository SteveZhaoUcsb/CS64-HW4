# arithmetic.asm program
# CS 64, Z.Matni
#
# 1. Prompt the user for 3 inputs: a, b, c
# 2. Calculate 16*( a - 8*b) + 7*c using only one mult instruction
# 3. Print out the result

.text
main:
	# TODO: Write your code here!
	#input three vairables: a, b, c
	li $v0, 5
	syscall
	add $t0, $zero, $v0
	li $v0, 5
	syscall
	add $t1, $zero, $v0
	li $v0, 5
	syscall
	add $t2, $zero, $v0

	li   $t3, 5
	mult $t1, $t3
	mflo $t1

	# t0 = a - 5b
	sub  $t0, $t0, $t1

	# t0 = 8(a - 5b)
	sll  $t0, $t0, 3

	# t2 = 64c
	sll  $t2, $t2, 6

	add  $a0, $t0, $t2
	li $v0,1
	syscall

exit:
	# Exit SPIM: Write your code here!
	li $v0,10
	syscall