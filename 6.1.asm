INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H

.DATA

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,2
    MOV CX,256
    MOV DL,0
   
PRINT_LOOP:
    INT 21H
    INC DL
    LOOP PRINT_LOOP
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN