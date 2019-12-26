READ_STR PROC NEAR
    
    PUSH DI
    PUSH AX
    
    XOR BX.BX
    
    MOV AH,1
    
WHILE1:
    
    INT 21H
    CMP AL,0DH
    JE END_WHILE1
    STOSB
    INC BX
    JMP WHILE1
    
END_WHILE1: 

    POP AX
    POP DI
    
    RET
    
    READ_STR ENDP