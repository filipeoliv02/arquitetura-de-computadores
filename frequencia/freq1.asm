#$s2=i

        add $s2,$0,$0

loop:   

    
        beq $s2,10,exit

        add $s0,$s0,$s2

        addi $s2,$s2,1

        j loop

exit:

        addi $v0,$0,1

        add $a0,$0,$s0

        syscall
