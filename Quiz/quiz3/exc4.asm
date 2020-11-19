.data




.text

j main

power:
  beq $a1, $0,  


main:

  addi $a0, $0, 2
  addi $a1, $0, 5
  
  jal power

  add $a0, $v0, 0
  addi $v0, $0, 1
  syscall

