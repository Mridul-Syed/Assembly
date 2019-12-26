INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H

.DATA
 PROMT DB 'TYPE A LINE OF TEXT:',0DH,0AH,'$' 
 NOCAP_MSG DB 0DH,0AH,'NO CAPITAL $'
 CAP_MSG DB 0DH,0AH,'FIRST CAPITAL = '
 FIRST DB ']'
       DB ' LAST CAPITAL = '
 LAST DB '@','$'
 
.CODE
MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,PROMT
    INT 21H
    
    MOV AH,1
    INT 21H

WHILE_:
    
    CMP AL,0DH
    JE END_WHILE 
    
    CMP AL,'A'
    JL END_IF
    CMP AL,'Z'
    JG END_IF
    
    CMP AL,FIRST
    JNL CHECK_LAST 
    MOV FIRST,AL
    
CHECK_LAST: 
    
    CMP AL,LAST
    JNG END_IF
    MOV LAST,AL
       
END_IF:

    INT 21H
    JMP WHILE_ 
    
END_WHILE:  

    MOV AH,9
    
    CMP FIRST,']'
    JNE CAPS
    LEA DX,NOCAP_MSG 
    JMP DISPLAY

CAPS:
    LEA DX,CAP_MSG
    
DISPLAY:

    INT 21H
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN
    