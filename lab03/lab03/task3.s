.text
.globl main
main:
addi x5, x0, 10        
sw x5, 0x100(x0)        
addi x6, x0, 20        
sw x6, 0x104(x0)        
addi x7,x0, 30        
sw x7,0x108(x0)        


addi x10,x0,0x100       #a0 set to base adress 0x100
addi x11,x0,1           # index 1
jal x1,swap             address in x1
j exit                  


swap:
#allocating 3 word into stack
    addi sp, sp,-12    
    sw x5, 8(sp)        
    sw x6, 4(sp)        
    sw x7, 0(sp)        
#swapping
    slli x6,x11,2       # Multiplying index by 4 to get byte offset
    add  x6,x10,x6      # Adding offset to base address… x6 now points to v[k]
   
    lw x5,0(x6)         # Loading value of v[k] into x5
    lw x7,4(x6)         # Loading value of v[k+1] into x7
   
    sw x7,0(x6)         # Storing x7 into memory at v[k]
    sw x5,4(x6)         # Storing x5 into memory at v[k+1]
   
  # restoring register values from stack
    lw x5,0(sp)        
    lw x6,4(sp)        
    lw x7,8(sp)        
    addi sp,sp,12      
    jalr x0, 0(x1)      


    exit:
end:
    j end