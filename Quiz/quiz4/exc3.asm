.text
add $s0, $0, $0
addi $t0, $0, 1
addi $t1, $0, 1000
loop:
  add $s0, $s0, $t0
  sll $t0, $t0, 1
  slt $t2, $t0, $t1
  bne $t2, $0, loop

