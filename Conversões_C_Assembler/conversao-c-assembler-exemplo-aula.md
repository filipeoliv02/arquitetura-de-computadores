


.data
print1: .asciiz "Insira o primeiro numero\n" 
print2: .asciiz "Insira o segundo numero\n" 
space: .asciiz " " 				
 
 
.text

li $v0, 4
la $a0, print1 
syscall

li $v0 , 5
add $t0, $v0, $0
syscall

li $v0, 4
la $a0, print2 
syscall

li $v0 , 5
add $t1, $v0, $0
syscall

#addi $t2, $0, 2
#div $t1 , $t2
#mfhi $t3
sra $t3, $t1,1
mul $t0, $t0, 3



li $v0,1
add $a0, $t0, $0
syscall

li $v0, 4
la $a0, space
syscall


li $v0,1
add $a0, $0, $t3
syscall



Exit:
li $v0, 10
 
syscall
