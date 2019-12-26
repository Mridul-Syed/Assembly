INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H

.DATA 
 NMBR1 DB '**********',0DH,0AH,'$'
 
 

.CODE
MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX 
   
   MOV CX,10

STAR:      
      MOV AH,9
      LEA DX,NMBR1
      INT 21H
      
      LOOP STAR
    
     
    
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN