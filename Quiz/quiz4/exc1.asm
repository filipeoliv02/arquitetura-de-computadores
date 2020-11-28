.data
MSG: .asciiz "The final value is "

.text

main:

add $t0, $0, $0     # 0000 0000 0000 0000 0100 0000 0010 0000 = 0x00004020
add $s0, $0, $0     # 0000 0000 0000 0000 1000 0000 0010 0000 = 0x00008020
addi $t1, $0, 10    # 0010 0000 0000 1001 0000 0000 0000 1010 = 0x2009000A


LOOP:
  slt $t2, $t0, $t2 #
  beq $t2, $0, END
  add $s0, $s0, $t0
  addi $t0, $t0, 1
  j LOOP            # 0000 1000 0000 0000 0000 0000 0000 0011 = 0x08000003
END:
addi $v0,$0, 4
la $a0, MSG
syscall
addi $v0, $0, 1
add $a0, $0, $s0
syscall
add $v0, $0, 10
syscall


