# maximum.asm program
# CS 64, Z.Matni
#
# Get 3 integer inputs from the user (std.in)
# Reveal the maximum absolute value (e.g., entering -3, 2, 1 will give the answer 3)
# See assignment description for details

#Data Area (i.e. memory setup directive)
.data
	# TODO: Complete these incomplete declarations / initializations
enter:	.asciiz  "Enter the next number:\n"
newline: .asciiz "\n"
max: .asciiz "Maximum: "
#Text Area (i.e. instructions/code directive)
.text

main:
	# TODO: Write your code here
li $v0, 4
la $a0, enter
syscall
li $v0, 5
syscall
move $t0, $v0

slt $t3, $t0, $zero
beq $t3, $zero, abs0_done
sub $t0, $zero, $t0
abs0_done:
 
li $v0, 4
la $a0, enter
syscall
li $v0, 5
syscall
move $t1, $v0

slt $t3, $t1, $zero
beq $t3, $zero, abs1_done
sub $t1, $zero, $t1
abs1_done:

li $v0, 4
la $a0, enter
syscall
li $v0, 5
syscall
move $t2, $v0

slt $t3, $t2, $zero
beq $t3, $zero, abs2_done
sub $t2, $zero, $t2
abs2_done:

	ble $t0, $t1, skip
		ble $t0, $t2, skip2
			move $a1, $t0
			j done
	skip2:
			move $a1, $t2
			j done
	skip:
		ble $t1, $t2, skip1
			move $a1, $t1
			j done
 	skip1:
	move $a1, $t2
	
done:
	li $v0, 4
	la $a0, max
	syscall
	li $v0,1
	move $a0,$a1
	syscall
	li $v0, 4
	la $a0, newline
	syscall
	

exit:
	# TODO: Write code to properly exit a SPIM simulation
	li $v0, 10
	syscall

