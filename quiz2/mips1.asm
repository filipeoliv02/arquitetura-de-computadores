.data
a: .word 1 3 5 7
VAL1: .asciiz "val1: "
VAL2: .asciiz " val2: "
.text

j MAIN


FOO:
addi $sp, $sp, -16
sw $ra, 0($sp)
sw $a0, 4($sp)
sw $a1, 8($sp)
sw $a2, 12($sp)
jal BAR
add $t0, $v0, $0

add $a0, $a1, $0
add $a1, $a2, $0
jal BAR
add $t1, $v0, $0

lw $a0, 12($sp)
lw $a1, 4($sp)
jal BAR
add $t2, $v0, $0

add $v0, $t0, $t1
add $v0, $v0, $t2
lw $ra, 0($sp)
jr $ra

BAR:
mul $v0, $a0, $a1
jr $ra

BAZ:
addi $sp, $sp, -8
sw $ra, 0($sp)
add $t0, $0, $0
add $t1, $0, $0
addi $t2, $0, 3
LOOP1:
slt $t3, $t2, $t0
bne $t3, $0, END_L1
la $t4, a
add $t4, $t4, $t0
lw $a0, 0($t4)

jal F_REC
add $t1, $t1, $v0
addi $t0, $t0, 1
j BAZ
END_L1:
lw $ra, 0($sp)
add $v0, $t1, $0
jr $ra

F_REC:
sw $ra, 4($sp)
addi $t5, $0, 1
beq $a0, $t5, RETURN1
addi $a0, $a0, -1
jal F_REC
sll $v0, $v0, 1
lw $ra, 4($sp)
jr $ra

RETURN1:
jr $ra

MAIN:
addi $a0, $0, 2
addi $a1, $0, 3
addi $a2, $0, 7


li $v0, 4
la $a0, VAL1
syscall

jal FOO
add $a0, $v0, $0
li $v0, 1
syscall

li $v0, 4
la $a0, VAL2
syscall

jal BAZ
add $a0, $v0, $0
li $v0, 1
syscall


