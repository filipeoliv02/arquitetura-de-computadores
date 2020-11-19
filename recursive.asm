  #{f(0)=1
  #{f(n)=2*f(n-1)-n+1
  #
  # $v0 <- f($a0)

f:
  addi $sp,$sp,-8
  sw $ra, 4($sp)
  addi $v0, $v0, 1
  beq $a0, $0, END
  sw $a0, 0($sp)
  addi $a0, $a0, 1
  jal f
  sll $v0, $v0, 1
  lw $a0, 0($sp)
  sub $v0, $v0, $a0
  addi $v0, $v0, $1
END:
  lw $ra, 4($sp)
  addi $sp, $sp, 8
  jr $ra
