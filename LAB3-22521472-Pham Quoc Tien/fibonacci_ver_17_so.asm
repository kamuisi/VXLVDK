
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt
org 100h
.data
     var1 DW 0d
     var2 DW 1d

.code 

mov ah, 1
int 21h   
sub al, 48d  
mov bl, 10d
mul bl
mov cx, ax
mov ah, 1 
int 21h
sub al, 48d         
add cl, al    
mov ah, 0eh
mov al, 13d
int 10h
mov al, 10d
int 10h
     
call Fib

mov ah, 1h
int 16h
  
    
               
ret


Fib PROC  
    add bh, 1
    push cx 
    mov cx, var1      
    push cx 
loop_print:   
    pop cx      
    mov ax, cx   
    cmp al, 10d   
    jb not_div
loop_div:  
    mov dl, 10d    
    div dl 
    mov cl, ah 
    push cx  
    add bh, 1 
    mov ah, 0
    cmp al, 9
    jg loop_div 
not_div:   
    mov dl, al
    add dl, 48d
    mov ah, 6
    int 21h      
               
    dec bh                    
    cmp bh, 0  
    jg loop_print  
    pop cx
    
    mov dl, 32d
    mov ah, 6
    int 21h
    
    
    mov dx, var1
    mov ax, var2 
    mov var1, ax
    add var2, dx
    
      
    
    loop a
    ret
    a: call Fib
Fib ENDP