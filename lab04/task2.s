.text
.globl main

main:
    addi x10, x0, 4        # n = 4 answer should be 10 in x10
    jal x1, triangular     # call function
    addi a7, x0, 1
    ecall

end:
    j end

triangular:
    addi sp, sp, -8        # populating stack
    sw x1, 4(sp)           # insert at positions
    sw x10, 0(sp)

    addi x5, x10, -1       # n-1
    bgt x5, x0, L1         # if x5>0 keep running loop

    addi x10, x0, 1        # base case when upper condition fails
    addi sp, sp, 8         # deallocate stack
    jalr x0, 0(x1)

L1:
    addi x10, x10, -1
    jal x1, triangular

    addi x6, x10, 0
    lw x10, 0(sp)

    addi x10, x0, 1        # base case when upper condition fails
    addi sp, sp, 8         # deallocate stack
    jalr x0, 0(x1)

L1:
    addi x10, x10, -1
    jal x1, triangular

    addi x6, x10, 0
    lw x10, 0(sp)
    lw x1, 4(sp)
    addi sp, sp, 8         # deallocate stack

    add x10, x10, x6       # will help in finding the answer
    jalr x0, 0(x1)
