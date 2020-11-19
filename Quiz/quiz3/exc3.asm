.data



.text

j main

fact_recu:
  bne $a0,$0, recu 
  addi $v0,$0,1 
  jr $ra 
recu: 
  addi $sp,$sp,-8 
  sw $ra,0($sp) 
  sw $a0,4($sp) 
  addi $a0,$a0,-1 
  jal fact_recu 
  lw $a0,4($sp) 
  mul $v0,$v0,$a0 
  lw $ra,0($sp) 
  addi $sp,$sp,8 
  jr $ra 
main:
  addi $a0,$0,5
  jal fact_recu
  add $a0, $v0, $0
  addi $v0, $0, 1
  syscall
