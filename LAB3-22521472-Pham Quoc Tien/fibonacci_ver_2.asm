
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
     
fib:
    mov bx, var1
    push cx
    mov cx, 16d  
loop_print:    
    mov dl, '0'
    test bx, 32768d
    jz print 
    mov dl, '1'
print: 
    mov ah, 2
    int 21h        
    shl bx, 1
    loop loop_print  
    pop cx
    
    mov ah, 0eh
    mov al, 13d
    int 10h
    mov al, 10d
    int 10h
    
    
    mov ax, var1
    mov dx, var2 
    mov var1, dx
    add var2, ax
    
      
    
    loop fib
  

mov ah, 0h
int 16h
  
    
               
ret        
    



