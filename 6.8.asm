INCLUDE 'EMU8086.INC'

.MODEL SMALL
.STACK 100H

.DATA

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,2
    MOV DL,'?'
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    INT 21H
    MOV CL,AL
             
     CALL NEWLINE
     
    CMP CL,BL
    JGE L1
    XCHG CL,BL 
    
     
    
    
    L1:
     MOV AH,2
     MOV DL,BL
     INT 21H
     MOV DL,CL
     INT 21H
     
     MOV AH,4CH
     INT 21H
     
     MAIN ENDP 

NEWLINE PROC  
    
    
          MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    RET
    NEWLINE ENDP 

    

END MAIN