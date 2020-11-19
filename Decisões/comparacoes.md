# (x<y)

slt $t2, $t0, $t1

bne $t2, $0, COND


# (x>y)

slt $t2, $t1, $t0

bne $t2, $0, COND


# (x>=y)

slt $t2, $t0, $t1

beq $t2, $0, COND


# (x<=y)

slt $t2, $t1, $t0

beq $t2, $0, COND

