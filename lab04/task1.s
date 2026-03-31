.text
.globl main
main:
    addi x6,x0,5 # the factorial number we need
    addi x10,x0,5 # factorial=5
    addi x11,x0,1 # n variable
    li x5,1

0x7FFFFFF0    addi sp,sp,-8
    sw x6,4(sp) #store n
    sw x11 ,0(sp) #store Factorial

    jal x1, factorial
        addi x11, x10,0      # Save result to x11, copy x10 into x11
        li x10, 1        # Load service number
        ecall
    j end

    factorial:
        mul x10,x10,x11 #Factorial*=n
        addi x11,x11,1 #n++


        blt x11,x6,factorial
    Exit:

        lw x11,0(sp) #pop fatorial variable
        lw x6, 4(sp)
        addi sp,sp,8 #deallocate memory
        jalr x0,0(x1)


end:
    j end 

    #Compare the stack of this and recursive in worksheet
