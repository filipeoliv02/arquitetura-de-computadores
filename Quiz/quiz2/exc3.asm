.data
MSG: .asciiz "Insira um numero\n"


.text
main:

  li $v0, 4
  la $a0, MSG
  syscall          # imprime a string MSG

  li $v0, 5
  syscall
  add $t0, $0, $v0
  subi $t1, $0, 1  # var i do loop
  add $t2 , $0, $0 # var resultado

LOOP:

  addi $t1, $t1, 1
  add $t2, $t2, $t1

  bne $t1, $t0, LOOP

  li $v0, 1
  add $a0, $0, $t2
  syscall

  li $v0, 10
  syscall


