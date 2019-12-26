include 'emu8086.inc' 
.model small
.stack 100h
.data 
count db 0 
input_for_calculation db ?
input_for_display db ?
.code
main proc
mov ax,@data
mov ds,ax
  
print 'Enter the number : ' 
mov ah,1
int 21h 
mov input_for_display,al
sub al,48 
mov input_for_calculation,al 

mov dl,10
mov ah, 2
int 21h
mov dl,13
mov ah, 2
int 21h 


mov bx, 5 
mov cx, 5
L1:     

push cx
mov cx, bx  

L2:  
cmp count,12
jne next
call gun  

next: 
Mov dl,input_for_display
mov ah,2
int 21h 
MOV DL,09H
INT 21H 
inc count

loop L2

mov dl,10
mov ah, 2
int 21h
mov dl,13
mov ah, 2
int 21h 

 

pop cx

loop L1
  
 
mov ah,4ch
int 21h
main endp 

gun proc  
mov al,input_for_calculation 
mul input_for_calculation
CALL OUTDEC  
 

dec cx 
inc count


 
ret 

gun endp  

OUTDEC PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    
    OR AX,AX
    JGE @END_IF1
    
    PUSH AX
    MOV DL,'-'
    MOV AH,2
    INT 21H
    POP AX
    NEG AX
    
@END_IF1:
    
    XOR CX,CX
    MOV BX,10D
    
@REPEAT1:

    XOR DX,DX
    DIV BX
    PUSH DX
    INC CX
    
    OR AX,AX
    JNE @REPEAT1
    
    MOV AH,2
    
@PRINT_LOOP:
    
    POP DX
    OR DL,30H
    INT 21H
    LOOP @PRINT_LOOP 
     
    MOV AH,2
    MOV DL,09H
    INT 21H
    
    POP DX
    POP CX
    POP BX
    POP AX
    
      
      
    RET
    
    OUTDEC ENDP
    
    
end main