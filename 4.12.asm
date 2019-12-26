INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H

.DATA 
 NMBR1 DB '**********',0DH,0AH,'$'
 C1 DB '*** '
 NAME1 DB ?
 NAME2 DB ?
 NAME3 DB ?
 C3 DB '*** ',0AH,0DH,'$'
 
 

.CODE
MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX 
    
    MOV AH,1
    INT 21H 
    MOV NAME1,AL 
    MOV AH,1
    INT 21H 
    MOV NAME2,AL 
    MOV AH,1
    INT 21H 
    MOV NAME3,AL
    
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL, 0AH
    INT 21H
   
   MOV CX,5

STAR1:      
      MOV AH,9
      LEA DX,NMBR1
      INT 21H
      
      LOOP STAR1 
      
 MOV AH,9
      LEA DX,C1
      INT 21H
          
      
      
  MOV CX,5

STAR:      
      MOV AH,9
      LEA DX,NMBR1
      INT 21H
      
      LOOP STAR
    
     
    
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN