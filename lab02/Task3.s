.text
.globl main
main:

    li x22, 0          # initializing i = 0
    li x23, 0          # initialize sum = 0
    li x10, 10         # condition checking
    li x12, 0x200      # Base address of array 

    LOOP:
    slli x3, x22, 2    # x3=i*4
    add  x4, x3, x12   # x4=base address+address of a[i]
    sw   x22, 0(x4)    # a[i]=i
    addi x22, x22, 1   # increment i by 1
    blt  x22, x10, LOOP 

    li x22, 0          # i=0 reset

    LOOP2:
    slli x3, x22, 2    # x3 = i*4
    add  x4, x3, x12   # x4=address of a[i]
    lw   x1, 0(x4)     # Loading value from a[i] into x1
    add  x23, x23, x1  # sum=sum +a[i]
    addi x22, x22, 1   # increment i by 1
    blt  x22, x10, LOOP2

end:
    j end              