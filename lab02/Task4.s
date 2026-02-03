.text
.globl main
main: #Task 4
    addi x5,x0,2 #a
    addi x6,x0,3 #b
    addi x7,x0,0 # i
    li x10,0x200 #Array

    loop1:
        addi x29,x0,0 #j=0 whenever loop starts
        loop2: #else run the inner loop
            add x30,x7,x29 #i+j
            slli x11,x29,4 #4*j x 4 bytes (offset)
            add x12,x10,x11 #D[4*j]
            sw x30,0(x12) #D[4*j]=i+j
            addi x29,x29,1 #j++
            blt x29,x6,loop2 # to complete the j loop iterations if j<b then run loop 2 again

        addi x7,x7,1 #i++
        blt x7,x5,loop1 #if i <a then run i loop

    Exit:

end:
