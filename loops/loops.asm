.data
LINE: .asciiz " "

.text
add $t0 , $0, $0
addi $t1 , $0 ,10

LOOP:
 	beq $t0 , $t1, END
 	
	li $v0, 1
	add $a0, $t0, $0
	syscall

	li $v0,4
	la $a0, LINE
	syscall

	addi $t0,$t0,1

	j LOOP
END:
	li $v0 , 10
	syscall



