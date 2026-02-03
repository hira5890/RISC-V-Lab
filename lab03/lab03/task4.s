.text
.globl main
main:

    li x10,0x100 #start char array1 x
    li x11,0x200 #start char array 2 y
    li t2, 'H'           
    sb t2, 0(x11)        # y[0] = 'H'
    li t2, 'i'           # ASCII of 'i'
    sb t2, 1(x11)        # y[1] = 'i'

    li t2, 0             # null terminator '\0'
    sb t2, 2(x11)        # y[2] = '\0'
    li x19,0 #i 

    jal x1,strcpy
        li x10,4
        ecall

    j end

    strcpy:
        addi sp,sp,-8 # 64 bits 
        sw x19, 0(sp) #index i
        loop:
            # add  t0, x10, x19        # &y[i] using indexing to access
            add  t0, x11, x19        # &x[i]
            lb t1,0(t0)  #t1=y[i]
            add t2, x10, x19   # t2 = &x[i]
            sb t1, 0(t2)    #x[i]=t1 #storing  
            #x[i]=y[i]
            beq t1,x0,Exit #loop condition y[i] !=\0
            addi x19,x19,1 #i++
            j loop

    Exit:
        lw x19,0(sp) #pop i
        addi sp, sp, 8 #free up space
        jalr x0, 0(x1) 

end:
   j end