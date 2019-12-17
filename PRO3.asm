NAME	PROG3
STACK  SEGMENT  STACK
    	STA  DB  50  DUP (?)
    	TOP  EQU  LENGTH  STA
STACK  ENDS

DATA SEGMENT
       MYSTRING  DB  'Please input: ','$'
DATA  ENDS

CODE  SEGMENT
     	ASSUME  CS:CODE,DS:DATA,ES:DATA,SS:STACK
START:	MOV  AX,DATA
        MOV  DS,AX
        MOV  AX,STACK
        MOV  SS,AX
        MOV  SP,TOP
	MOV  DX,OFFSET MYSTRING
	MOV  AH,09H
	INT  21H				
NEXTWORK:                                               
	MOV  AH,01H
	INT  21H
	CMP  AL,27
	JNZ  SOLVE
	MOV  AH,4CH
	INT  21H 			
SOLVE:
	MOV  DL,AL
	INC  DL
	MOV  AH,02H 
	INT  21H
	JNZ  NEXTWORK
CODE  	ENDS
END   	START
