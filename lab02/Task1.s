.text
.globl main
main:
    #Listing 3

    addi x19,x0,5 #i
    addi x20,x0,5 #j
    addi x21,x0,6 #g
    addi x22,x0,8 #h
    addi x23,x0,0 #f

    bne x19,x20,Else
    add x23,x21,x22
    beq x0,x0,Exit

    Else: sub x23,x21,x22

    Exit: 

    #Listing 4

    // assuming i in x22 and k in x24, and the base address of save in x25
    Loop:
        slli x10, x22, 2
        add  x10, x10, x25
        lw   x9, 0(x10)
        bne  x9, x24, Exit
        addi x22, x22, 1
        beq  x0, x0, Loop
    Exit:








end:
    j end
