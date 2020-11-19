.text

main: 
	add $t0, $0, $0
	add $s1, $0, $0
	
LOOP:
	slti $t0, $s0, 10
	beq $t0, $0, END
	add $a0, $s0, $0
	jal f
	add $s1, $s1, $v0
	addi $s0, $s0, 1
	j LOOP
	
END:
	addi $v0, $0, 10	#Termina o programa
	syscall	

f:
	slt $t0, $0, $a0 
	bne $t0, $0, POS
	sub $v0, $0, $a0
	J END1
POS:
	add $v0, $a0, $0
END1:
	jr $ra	
