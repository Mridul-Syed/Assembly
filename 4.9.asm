INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H

.DATA 
 NMBR1 DB ?,0DH,0AH
 NMBR2 DB ?,0AH,0DH
 NMBR3 DB ?,0DH,0AH,'$'
 

.CODE
MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX 
    
    PRINT 'ENTER THREE INITIALS : '
       
       MOV AH,1
       INT 21H
    MOV NMBR1,AL
    
    
    INT 21H
    MOV NMBR2,AL
    
    INT 21H
    MOV NMBR3,AL
    
    
      MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    
    MOV AH,9
    LEA DX, NMBR1
    INT 21H
    
     
    
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN