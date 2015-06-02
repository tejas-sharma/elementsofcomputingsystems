// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

// R3 stores current computed value
@R3
M=0 

(LOOP)
// Decrement current counter
@R1
M=M-1
D=M
// If current counter < 0 -> return current computed value
@RETURN
D;JLT
// Else -> add and loop again
@R0
D=M
@R3
M=M+D
@LOOP
0;JMP

(RETURN)
@R3
D=M
@R2
M=D
@END
0;JMP

(END)
@END
0;JMP