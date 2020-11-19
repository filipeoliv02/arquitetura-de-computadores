.data
MSG1: .asciiz "Insira o numero de numeros\n"
MSG2: .asciiz "\nInsira um numero\n"
MSG3: .asciiz "\nA soma e:\n"

.align 2
INPUT:  .space 4

.text
  li $v0, 4       # print MSG
  la $a0, MSG1
  syscall

  li $v0, 5       # scanf and stores at $t0 after
  syscall
  add $t0, $0, $v0 # condição limite do for quando i for igual a $t0 ele sai fora
  add $t1, $0, $0  # i do 'for'
  add $t3, $0, $0
LOOP:
  beq $t1, $t0, END

  li $v0, 4
  la $a0, MSG2
  syscall
  li $v0, 5
  syscall

  slt $t2, $v0, $0
  beq $t2, $0, IF
BACK:
  addi $t1, $t1, 1
  j LOOP

IF:
  add $t3, $t3, $v0
  j BACK


END:
  li $v0,4
  la $a0, MSG3
  syscall
  li $v0, 1
  add $a0, $0, $t3
  syscall
  li $v0, 10
  syscall
