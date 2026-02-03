.text
.globl main
main:
    addi x10,x0,5 #g
    addi x11,x0,6 #h
    addi x12,x0,2 #i
    addi x13,x0,2 #j
    addi x20,x0,0 #f
    li x18,0
    li x19,0

    #Start function
    jal x1,leaf
        li x10,1 #print ID
        ecall
    
    j Exit
    leaf:
        addi sp, sp, -12 # 3 elements so 3x4 is 12

        sw x18, 8(sp) #stack pushing 
        sw x19, 4(sp)
        sw x20, 0(sp) 
        add x18,x10,x11 #g+h
        add x19,x12,x13 #i+j
        sub x20,x18,x19 #f=(g+h)-(i+j)

        addi x11,x20,0 
        #start popping stack
        lw x20, 0(sp)
        lw x19, 4(sp)
        lw x18, 8(sp)
        addi sp, sp, 12 #free up space

        jalr x0,0(x1) # return address
    Exit:





end:
    j end