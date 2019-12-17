NAME	PROG1
STACK  SEGMENT  STACK
    	STA  DB  50  DUP (?)
    	TOP  EQU  LENGTH  STA
STACK  ENDS
;
DATA SEGMENT 
       NUM  DW  0011101000000111B		;二进制字
       NOTES  DB  'The result is : ','$'
DATA  ENDS
;
CODE  SEGMENT
     	ASSUME  CS:CODE,DS:DATA,ES:DATA,SS:STACK
START:	MOV  AX,DATA
        MOV  DS,AX
        MOV  AX,STACK
        MOV  SS, AX
        MOV  SP,TOP						;堆栈指针赋值
        MOV  DX,OFFSET  NOTES
        MOV AH,09H
        INT   21H							;显示提示语
        MOV  BX,NUM
        MOV  CH,4							;十六进制位数
ROTATE :                                                           
MOV  CL, 4                                                        
ROL   BX,CL               			;4位二进制变为1位十六进制
MOV  AL,BL                                                       
AND   AL,0FH                                                     
ADD  AL,30H                                                      
CMP  AL,57                                                         
JLE    DISPLAY                                                   
ADD   AL,07H              			;十六进制数为ABCDEF
DISPLAY:
MOV  DL, AL 
MOV   AH,2 
INT  21H 							;十六进制数显示
DEC  CH
JNZ   ROTATE
MOV  AH,4CH
INT  21H
CODE  	ENDS
;
END   	START
