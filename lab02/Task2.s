.text
.globl main
main:

    # Assume that the variables x, a, b & c are signed integers and stored in x20, x21, x22, x23 respectively.
    # Make sure to first assign suitable values for b and c first.
3

    addi x20,x0,4 #x
    addi x21,x0,6 #a
    addi x22,x0,10 #b
    addi x23,x0,7 #c

    li x24,1
    li x25,2
    li x26,3
    li x27,4

    beq x20,x24,case1
    beq x20,x25,case2
    beq x20,x26,case3
    beq x20,x27,case4
    beq x0,x0,default

    case1:
    add x21,x22,x23 #a=b+c
    beq x0,x0,Exit

    case2: 
    sub x21,x22,x23 #a=b-c
    beq x0,x0,Exit

    case3:
    slli x21,x22,1 #a=b*2
    beq x0,x0,Exit

    case4:
    srli x21,x22,1 #a=b/2
    beq x0,x0,Exit

    default:
    addi x21,x0,0 #a=0
    beq x0,x0,Exit


    Exit:


end:
    j end