DISPLAY_STR PROC NEAR
    
    PUSH AX
    PUSH SI
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    
L1:
    
    LODSB
    MOV DL,AL
    INT 21H 
    LOOP L1
    
    POP SI
    POP AX
    
    RET
    
    DISPLAY_STR ENDP
    