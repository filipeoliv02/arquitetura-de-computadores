.data
  a:  .float 1 2 3 4 5 6
  ZERO: .float 0.0
  TWO: .float 2.0
  THREE: .float 3.0
  space: .asciiz " "
.text

CONVERT:
  lw $t0, 0($a0)  # input = t0
  mtc1 $t0, $f3
  cvt.s.w $f3, $f3
  lwc1 $f0, ZERO  # result = $f0
  lwc1 $f2 , TWO
  add $t2, $0, $0 # i = t2
  la $t3, a
  add $t4, $0, $t2
  LOOP1:
    bge $t2, 6, END_LOOP1
    lw $t5, 0($t4)
    mtc1 $t5, $f1
    cvt.s.w $f1, $f1
    mul.s $f0, $f1, $f2
    add.s $f0, $f0, $f3
    sll $t5, $t2, 2
    add $t4, $t3, $t5
    addi $t2, $t2, 1
    j LOOP1
  END_LOOP1:
  lwc1 $f4, THREE
  div.s $f0, $f0, $f4
  swc1 $f0, 0($v0)
  jr $ra
FOO:
  lw $t0, 0($a0)
  mtc1 $t0, $f0
  cvt.s.w $f0, $f0
  lw $t1, 0($a1)
  mtc1 $t1, $f1
  cvt.s.w $f1, $f1
  lw $t2, 0($a2)
  mtc1 $t2, $f2
  cvt.s.w $f2, $f2
  lwc1 $f3, ZERO
  lwc1 $f4, ZERO
  mul.s $f3, $f0, $f1
  add.s $f4, $f3, $0
  mul.s $f3, $f1, $f2
  add.s $f4, $f4, $f3
  mul.s $f3, $f0, $f2
  add.s $f4, $f4, $f3
  swc1 $f4, 0($v0)
  jr $ra
MAIN:
  addi $t0, $0, 2
  addi $t1, $0, 3
  addi $t2, $0, 4

  lwc1 $f0, ZERO
  lwc1 $f1, ZERO
  lwc1 $f2, ZERO
  sw $t0, 0($a0)
  sw $t1, 0($a1)
  sw $t2, 0($a2)
  jal FOO
  lw $v0, 0($t0)
  mtc1 $v0, $f1
  cvt.s.w $f1, $f1
  li $v0, 6
  syscall
  swc1 $f1, 0($a0)
  jal CONVERT
  lw $v0, 0($t0)
  mtc1 $v0, $f2
  cvt.s.w $f2, $f2
  add.s $f12, $f1, $0
  li $v0, 2
  syscall
  la $a0, space
  li $v0, 4
  syscall
  add.s $f12, $f2, $0
  li $v0, 2
  syscall
  
  li $v0, 10
  syscall
