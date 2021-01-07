.data
MESSAGE: .asciiz "O valor final e "
.text


main:
  add $t0, $0, $0
  add $s0, $0, $0
LOOP:
  bge $t0, 10, END

  addi $t0, $t0, 1
END:
  li $v0, 4
  la $a0, MESSAGE
  syscall
  li $v0, 1
  add $a0, $s0, $0
  syscall
  li $v0, 10
  syscall
