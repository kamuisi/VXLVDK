#include <REGX52.H>
org 0h
	ljmp init
org 1bh
	lcall Clock
	reti
org 02bh
	lcall Change_Effect
	reti
	
org 30h
	init:
	mov TMOD, #00010001b
	mov IE, #10101000b
	mov TH1, #0ffh
	mov TL1, #0fdh
	mov TH2, #0h
	mov TL2, #0h
	mov R0, #1d
	mov R2, #16d
	mov R7, #1d
	lcall Send_1
	lcall Res_back
	main:
	acall Get_sample
	clr TR1
	setb TR2
	clr TR2
	
	mov A, R7
	subb A, #1d
	jz E_1
	subb A, #1d
	jz E_2
	subb A, #1d
	jz E_3
	
	E_1:
	acall Effect_1
	jmp exit_main
	E_2:
	acall Effect_2
	jmp exit_main
	E_3:
	acall Effect_3
	
	exit_main:
	ljmp main
	
	
	
	Get_sample:
	setb TR1
	setb P2.1
	acall Delay
	mov B, P1    ;doc adc
	
	mov A, #0ffh ;tinh khoang cach
	subb A, B
	
	cjne R0, #1d, not_first_time
	mov R0, #0d
	mov R5, A   ;luu khoang cach
	mov B, #16d
	div AB
	mov R3, A ;chia khoang cach thanh 16 doan aka 16 led
	jmp exit_Get_sample
	not_first_time:
	mov R6, A  ;luu khoang cach vao bo nho tam
	subb A, R5 ;so sanh khoang cach giua mau dau va mau moi
	jc valid ;nhay neu A < R5
	mov R4, #16d
	jmp exit_Get_sample 
	
	valid:
	mov A, R6
	mov B, R3
	div AB
	mov R4, A ;tinh so led tat
	
	exit_Get_sample:
	ret
	
	Effect_1:
	mov A, R4
	subb A, #16d
	jnc Turn_Off_Effect_1 ; kiem tra R4 >= 16 khong
	cjne R4, #0d, Calc_Effect_1
	mov R2, #16d
	mov R4, #1d
	jmp Turn_On_Effect_1
	
	Calc_Effect_1:
	mov A, #16d
	subb A, R4 ;tinh so led bat
	mov R2, A
	
	Turn_On_Effect_1:
	lcall Send_1
	Turn_Off_Effect_1:
	lcall Send_0
	lcall Res_back
	ret
	
	Effect_2:
	mov A, R4
	subb A, #16d
	jc All_led_on ; kiem tra R4 < 16 khong
	mov R2, #1d
	mov R4, #16d
	jmp Turn_Off_Effect_2
	
	All_led_on:
	cjne R4, #0d, Calc_Effect_2
	mov R2, #16d
	jmp Turn_On_Effect_2
	
	Calc_Effect_2:
	mov A, #16d
	subb A, R4 ;tinh so led bat
	mov R2, A
	
	Turn_Off_Effect_2:
	lcall Send_0
	Turn_On_Effect_2:
	lcall Send_1
	lcall Res_back
	ret
	
	Effect_3:
	mov A, R4
	subb A, #16d
	mov R2, #0d  ;neu dieu kien duoi dung thi khong bat led
	jnc Turn_Off_Effect_3 ; kiem tra R4 >= 16 khong
	cjne R4, #0d, Calc_Effect_3
	mov R2, #8d ;nua thanh led dau
	mov A, #8d  ; nua thanh led sau
	jmp Turn_Half_First_On_Effect_3
	
	Calc_Effect_3:
	mov A, #16d
	subb A, R4 ;tinh so led bat
	mov B, #2d
	div AB
	mov R2, A
	mov A, B
	add A, R4
	mov R4, A    ;xu ly so led tat bi le bang cach cong so du sau phep chia
	mov A, R2
	
	Turn_Half_First_On_Effect_3:
	lcall Send_1
	mov R2, A
	subb A, #8d
	jnc Turn_Half_Second_On_Effect_3 ;kiem tra co phai bat full 2 thanh led
	
	Turn_Off_Effect_3:
	lcall Send_0
	mov A, R2
	subb A, #1d
	jc exit_effect_3
	
	Turn_Half_Second_On_Effect_3:
	lcall Send_1
	
	exit_effect_3:
	lcall Res_back
	ret

	Change_Effect:
	inc R7
	cjne R7, #4d, exit_change
	mov R7, #1d
	exit_change:
	mov TH2, #0h
	mov TL2, #0h
	clr TF2
	reti
	
	Delay:
	mov TH0, #0feh
	mov TL0, #0f9h
	setb TR0
	loop: jnb TF0, loop
	clr TF0
	clr TR0
	ret
	
	Res_back:
	mov R1, #113d
	clr P2.2
	wait:
	djnz R1, wait
	ret
	
	Send_1:
	setb P2.2
	clr P2.2
	nop
	setb P2.2
	clr P2.2
	nop
	setb P2.2
	clr P2.2
	nop
	setb P2.2
	clr P2.2
	nop
	setb P2.2
	clr P2.2
	nop
	setb P2.2
	clr P2.2
	nop
	setb P2.2
	clr P2.2
	nop
	setb P2.2
	clr P2.2
	nop
	setb P2.2
	clr P2.2
	nop
	setb P2.2
	clr P2.2
	nop
	setb P2.2
	nop
	clr P2.2
	setb P2.2
	clr P2.2
	nop
	setb P2.2
	clr P2.2
	nop
	setb P2.2
	nop
	clr P2.2
	setb P2.2
	nop
	clr P2.2
	setb P2.2
	clr P2.2
	nop
	setb P2.2
	clr P2.2
	nop
	setb P2.2
	clr P2.2
	nop
	setb P2.2
	nop
	clr P2.2
	setb P2.2
	clr P2.2
	nop
	setb P2.2
	clr P2.2
	nop
	setb P2.2
	nop
	clr P2.2
	setb P2.2
	clr P2.2
	nop
	setb P2.2
	clr P2.2
	nop




	djnz R2, Send_1
	ret
	
	Send_0:
	setb P2.2
	clr P2.2
	nop
	
	setb P2.2
	clr P2.2
	nop
	
	setb P2.2
	clr P2.2
	nop
	
	setb P2.2
	clr P2.2
	nop
	
	setb P2.2
	clr P2.2
	nop
	
	setb P2.2
	clr P2.2
	nop
	
	setb P2.2
	clr P2.2
	nop
	
	setb P2.2
	clr P2.2
	nop
	
	setb P2.2
	clr P2.2
	nop
	
	setb P2.2
	clr P2.2
	nop
	
	setb P2.2
	clr P2.2
	nop
	
	setb P2.2
	clr P2.2
	nop
	
	setb P2.2
	clr P2.2
	nop
	
	setb P2.2
	clr P2.2
	nop
	
	setb P2.2
	clr P2.2
	nop
	
	setb P2.2
	clr P2.2
	nop
	
	setb P2.2
	clr P2.2
	nop
	
	setb P2.2
	clr P2.2
	nop
	
	setb P2.2
	clr P2.2
	nop
	
	setb P2.2
	clr P2.2
	nop
	
	setb P2.2
	clr P2.2
	nop
	
	setb P2.2
	clr P2.2
	nop
	
	setb P2.2
	clr P2.2
	nop
	
	setb P2.2
	clr P2.2
	nop
	djnz R4, Send_0
	ret
	
	Clock:
	jb P2.3, zero
	setb P2.3
	jmp exit_clock
	zero:
	clr P2.3
	exit_clock:
	mov TH1, #0ffh
	mov TL1, #0fdh
	ret
END