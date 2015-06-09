// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.


// Start: 16384 
// End: 147456
// Every row has 512 bits

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

// Reads a bit into current op register
(READBIT)
@24576
D=M
@SETWHITE
D;JEQ
@R1
M=1
(SETWHITE)
@R1
M=0

// Checks to see if we will overflow 
(CHECKNEEDRESET)
@R1
D=M
@R4
D=D-M
@RESETWORKINGBIT
D;JEQ
@R2
D=M-147456
@RESETWORKINGBIT
D;JLT

// Reset the working bit
(RESETWORKINGBIT)
@R2
M=16384
@R3
M=512
@R1
D=M
@R4
M=D

(PERFORMOP)
@R1
D=M
@WHITEN
D;JEQ

(WHITEN)