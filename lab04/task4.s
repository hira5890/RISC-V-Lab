.text
.globl main

main:
    addi x10, x0, 6      #n=6
    jal x1, fib          
    jal x0, stop        
fib:
    # stack allocation
    addi x2, x2, -16     
    sw x1, 12(x2)        
    sw x9, 8(x2)        
    sw x10, 4(x2)        

    # Base case n==0
    addi x11, x0, 0      
    beq x10, x0, fib_return

    # Base case n==1
    addi x11, x0, 1      
    addi x5, x0, 1       
    beq x10, x5, fib_return

   #Recursive Call fib(n-1)
    addi x10, x10, -1   #n=n-1
    jal x1, fib
    addi x9, x11, 0      

    # Recursive Call fib(n-2)
    lw x10, 4(x2)        # Restore original n
    addi x10, x10, -2    #n=n-2
    jal x1, fib          

    #final calculation
    add x11, x9, x11     

fib_return:
    #restoring registers and emptying stack
    lw x10, 4(x2)
    lw x9, 8(x2)
    lw x1, 12(x2)
    addi x2, x2, 16
    jalr x0, 0(x1)       

stop:
    jal x0, stop
