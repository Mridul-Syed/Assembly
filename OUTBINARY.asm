OUTBINARY PROC
    
    MOV BX,AX
    MOV CX,16
    
L0:
    ROL BX,1
    JC ONE
    
    MOV AH,2
    MOV DL,'0'
    INT 21H
    
    JMP L1
    
ONE:
    
    MOV AH,2
    MOV DL,'1'
    INT 21H
    
L1:
    
    LOOP L0 
  
  
    RET
  
  
    OUTBINARY ENDP