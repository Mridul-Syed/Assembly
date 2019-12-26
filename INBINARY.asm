INBINARY PROC
    
    XOR BX
    MOV AH,1
    INT 21H
    
WHILE_:

    CMP AL,0DH
    JE END_WHILE
    
    AND AL,0FH
    SHL BX
    OR BL,AL
    INT 21H
    JMP WHILE_
    
END_WHILE:
    
    RET
    
    INBINARY ENDP 