# Conversão C para Assembler

## C

`main (){

   int i,s = 0;

   for (i = 0; i!=10; i++){
   
   s=s+i;
   
   }
}`

## Assembler 

`main:
   
   add $s0, $0, $0
   
   add $s1, $0, $0
   
   addi $t0, $0, 10

   LOOP:
   
   beq $s0, $t0, END
   
   add $s1, $s1, $s0
   
   addi $s0, $s0, 1
   
   j LOOP

END:`


---


## C

`g = A[i];`

## Assembler

`add $t0, $t1, $0

 sll $t0, $t0,2

 add $t0, $t0, $s5

 lw $t0, 0($t0)`

