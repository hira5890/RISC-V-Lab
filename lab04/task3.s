.text
.globl main

main:

    addi x10, x0, 0x100      # base address of array
    addi x11, x0, 4          # size of array

    # initializing array
    addi x12, x0, 2
    sw x12, 0(x10)
    addi x12, x0, 5
    sw x12, 4(x10)
    addi x12, x0, 8
    sw x12, 8(x10)
    addi x12, x0, 0
    sw x12, 12(x10)

    # null condition checks
    beq x10, x0, exit
    beq x11, x0, exit

    addi x13, x0, 0          # i=0

outerloop:
    bge x13, x11, exit       # if i>=len
    addi x14, x13, 0         # j=i

innerloop:
    bge x14, x11, next_i
    slli x15, x13, 2
    add  x15, x10, x15
    lw   x16, 0(x15)         # a[i]
    slli x17, x14, 2
    add  x17, x10, x17
    lw   x18, 0(x17)         # a[j]
    bge  x16, x18, no_swap
    addi x19, x16, 0         # temp = a[i]
    sw   x18, 0(x15)
    sw   x19, 0(x17)

no_swap:

    addi x14, x14, 1
    j innerloop

next_i:

    addi x13, x13, 1
    j outerloop

exit:
    j exit
