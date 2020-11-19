.data
MSG1: .asciiz "Insira a quantidade de numeros\n"
MSG2: .asciiz "Insira o proximo numero\n"
.align 2
VECTOR: .space 80   # 80 = 20 words  -> 1 word = 4 bytes


.text
MAIN:
  la $a0, MSG1        # print MSG1
  addi $v0, $0, 4
  syscall


  addi $v0, $0, 5     #scanf e grava o valor introduzido em $s0
  syscall
  add $s0, $0, $v0

  addi $t0, $0, 20
  slt $t0,$t0,$s0
  bne $t0, $0, MAIN


  la $s1, VECTOR      #carrega o endereco de VECTOR em $s1

LOOP1:
  beq $t0, $s0, END_LOOP1
  sll $t1, $t0, 2
  add $t1, $t1, $s1
  la $a0, MSG2
  addi $v0, $0, 4
  syscall

  addi $v0, $0, 5
  syscall
  sw $v0, 0($t1)

  addi $t0, $t0, 1
  j LOOP1
END_LOOP1:

  add $s2, $0, $0
  add $s3, $0, $0
  add $t0, $0, $0

LOOP2:
  beq $t0, $s0, END_LOOP2
  andi $t4, $t0, 1
  sll $t5, $t0, 2
  add $t5, $t5, $s1
  lw $t6, 0($t5)
  beq $t4, $0, SOMA_PAR
  add $s3, $s3, $t6
  j END_IF

SOMA_PAR:
  add $s2, $s2, $t6
END_IF:
  addi $t0, $t0, 1
  j LOOP2
END_LOOP2:

  sub $t7, $s2, $s3

  li $v0, 1
  add $a0, $0, $t7
  syscall

  li $v0, 10
  syscall
