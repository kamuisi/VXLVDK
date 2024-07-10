
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; add your code here
mov bx, 0ffffh   ;16 bit trong so cao so dau tien   
mov cx, 0ac8eh   ;16 bit trong so thap so dau tien 

mov ax, 0003h   ;16 bit trong so cao so thu hai
mov dx, 0deffh   ;16 bit trong so thap so thu hai

add cx, dx
adc bx, ax

mov dh, 16      
print:  mov ah, 2
        mov dl, '0'
        test bx, 8000h
        jz zero
        mov dl, '1'
zero:   int 21h
        shl bx, 1
        sub dh, 1
        cmp dh, 0
        jg print
mov dh, 16
mov bx, cx  
sub var, 1
cmp var, 0
jg print



mov ah, 0
int 16h
 

ret


var DB 10b

