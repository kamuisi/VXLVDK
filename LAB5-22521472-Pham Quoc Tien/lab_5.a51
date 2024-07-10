org 0000h
ljmp main
org 0003h
lcall Handler_Button_0
reti
org 0013h
lcall Handler_Button_1
reti
org 001Bh
lcall Handler_T1
reti
org 40h
main:
db 3fh
db 6h
db 5bh
db 4fh
db 66h
db 6dh
db 7dh
db 7h
db 7fh
db 6fh
org 1000h
mov R0, #0h
mov R1, #0h
mov R2, #0h
mov R3, #0h

mov R4, #3fh
mov R5, #3fh
mov R6, #3fh
mov R7, #3fh

mov IE, #10001101b
mov IP, #1b
setb IT0
setb IT1
mov TMOD, #00010001b
mov TH1, #0h
mov TL1, #0h
setb TR1
Loop:
mov P0, R7
clr P2.0
acall Delay
setb P2.0
mov P0, R6
clr P2.1
acall Delay
setb P2.1
mov P0, R5
clr P2.2
acall Delay
setb P2.2
mov P0, R4
clr P2.3
acall Delay
setb P2.3
sjmp Loop

Delay:
mov TH0, #0ech
mov TL0, #078h
setb TR0
wait: jnb TF0, wait
clr TF0
clr TR0
ret
	
Handler_T1:

mov a, b
add a, #1d
mov b, a
cjne a, #16d, return
mov b, #0h

Tang_1s:
inc R0
cjne R0, #10d, num_1_0
mov R0, #0h
mov dptr, #40h
mov A, R0
movc A, @A+dptr
mov R4, A
inc R1
cjne R1, #10d, num_2_0
mov R1, #0h
mov dptr, #40h
mov A, R1
movc A, @A+dptr
mov R5, A
inc R2
cjne R2, #10d, num_3_0
mov R2, #0h
mov dptr, #40h
mov A, R2
movc A, @A+dptr
mov R6, A
inc R3
cjne R3, #10d, num_4_0
mov R3, #0h
mov dptr, #40h
mov A, R3
movc A, @A+dptr
mov R7, A
	
return:
mov TH1, #0h
mov TL1, #0h
ret
	
num_1_0:
mov dptr, #40h
mov A, R0
movc A, @A+dptr
mov R4, A
ljmp return
num_2_0:
mov dptr, #40h
mov A, R1
movc A, @A+dptr
mov R5, A
ljmp return
num_3_0:
mov dptr, #40h
mov A, R2
movc A, @A+dptr
mov R6, A
ljmp return
num_4_0:
mov dptr, #40h
mov A, R3
movc A, @A+dptr
mov R7, A
ljmp return
	
Handler_Button_0: 
jb TR1, zero
setb TR1
ret
zero:
clr TR1
ret

Handler_Button_1:
jb P2.4, Tang_1s
dec R0
cjne R0, #-1d, num_1_0
mov R0, #9h
mov dptr, #40h
mov A, R0
movc A, @A+dptr
mov R4, A
dec R1
cjne R1, #-1d, num_2_0
mov R1, #9h
mov dptr, #40h
mov A, R1
movc A, @A+dptr
mov R5, A
dec R2
cjne R2, #-1d, num_3_0
mov R2, #9h
mov dptr, #40h
mov A, R2
movc A, @A+dptr
mov R6, A
dec R3
cjne R3, #-1d, num_4_0
mov R3, #9h
mov dptr, #40h
mov A, R3
movc A, @A+dptr
mov R7, A
ret
END