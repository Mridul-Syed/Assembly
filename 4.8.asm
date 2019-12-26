INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H

.DATA 
 NMBR1 DB ?
 NMBR2 DB ?
 SUM DB ?,'$'

.CODE
MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX 
    
    PRINT '?'
    
    MOV AH,1
    INT 21H
    
    SUB AL,30H
    MOV NMBR1,AL
    
    INT 21H
    SUB AL,30H
    MOV NMBR2,AL
    
    ADD AL,NMBR1
    MOV SUM,AL 
    
    ADD SUM,30H
    
    PRINT 'THE SUM IS :'
    
    
    MOV AH,9
    LEA DX, SUM
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