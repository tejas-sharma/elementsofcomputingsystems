// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.


// 1 - black
// 0 - white

// keyboard - 24576
// no key - 0

// @R1: op
// BLACKEN = 1
// WHITEN  = 0

// @R4: prev op

// @R2: Current Bit

// @R3: Remaining bits in row

@R1
M=0
@R4
M=0
@SCREEN
D=A
@R2
M=D
@512
D=A
@R3
M=D

@DISPATCHER
0;JEQ

(DISPATCHER)
@READBIT
0;JEQ
(POSTREADBIT)
@CHECKNEEDRESET
0;JEQ


// Reads a bit into current op register
(READBIT)
@24576
D=M
@SETWHITE
D;JEQ
@R1
M=1
@POSTREADBIT
0;JEQ
(SETWHITE)
@R1
M=0
@POSTREADBIT
0;JEQ

(POSTCHECKNEEDRESET)
@PERFORMOP
0;JEQ

// Checks to see if we will overflow 
(CHECKNEEDRESET)
@R1
D=M
@R4
D=D-M
@R5
M=D
@R1
D=M
@R4
M=D
@R5
D=M
@RESETWORKINGBIT
D;JNE
@8192
D=A
@R2
D=M-D
@RESETWORKINGBIT
D;JLT
@POSTCHECKNEEDRESET
0;JEQ

// Reset the working bit
(RESETWORKINGBIT)
@SCREEN
D=A
@R2
M=D
@512
D=A
@R3
M=D
@POSTCHECKNEEDRESET
0;JEQ


(PERFORMOP)
@R1
D=M
@WHITEN
D;JEQ
@R2
A=M
M=-1
@R2
M=M+1
@DISPATCHER
0;JEQ
(WHITEN)
@0
D=A
@R2
A=M
M=D
@R2
M=M+1
@R3
M=M-1
@DISPATCHER
0;JEQ