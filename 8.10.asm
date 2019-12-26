.MODEL SMALL 
.DATA 
START DB 0AH,0DH 
HLF DB ?,' Half  '
QUA DB ?,' Quarter  ' 
DIM DB ?,' Dimes  ' 
NIC DB ?,' Nickels  ' 
PEN DB ?,' Pennies ','$'

.CODE 
MAIN PROC  
    MOV AX,@DATA  
    MOV DS,AX   
    
    CALL INDEC   
    
    MOV BL,50    
    DIV BL
    OR AL,30H
    MOV HLF,AL 
    
    MOV AL,AH
    MOV AH,0
    MOV BL,25
    DIV BL
    OR AL,30H
    MOV QUA,AL  
    
    MOV AL,AH
    MOV AH,0
    MOV BL,10
    DIV BL
    OR AL,30H
    MOV DIM,AL 
    
    MOV AL,AH
    MOV AH,0
    MOV BL,25
    DIV BL
    OR AL,30H
    MOV NIC,AL 
    
    OR AH,30H
    MOV PEN,AH
    
    MOV AH,9
    LEA DX,START
    INT 21H    
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP

INCLUDE C:\TEST\INDEC.ASM

END MAIN
    
    
    