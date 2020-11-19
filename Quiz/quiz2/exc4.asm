.data
A: .word 1 3 5 7 9 11 13 15
MSG: .asciiz "O valor final é "

.text

  add $t0, $t0, $0
  addi $t1, $0, 8
  la $t2, A
  add $t4, $0, $t2
LOOP:
  beq $t0, $t1, END_LOOP

	lw $t3, 0($t4)
	add $s0, $s0, $t3

	addi $t0, $t0, 1
	sll $t3, $t0, 2		#j=i*4
	add $t4, $t2, $t3	#k=&A+i*4
	j LOOP
END_LOOP:

  li $v0, 4
  la $a0, MSG
  syscall

  li $v0, 1
  add $a0, $s0, $0
  syscall

  li $v0, 10
  syscall
