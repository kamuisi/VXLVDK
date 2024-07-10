org 0h
	ljmp init
org 1bh
	lcall Clock
	reti
	
	
org 30h
	init:
	mov TMOD, #00010001b
	mov IE, #10001000b
	mov TH1, #0ffh
	mov TL1, #0fdh
	;setb P2.1
	;setb TR1
	setb TR1
	setb P2.1
	acall Delay
	;clr P2.1
	clr TR1   
	
	jmp init
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
Delay:
	mov TH0, #0feh
	mov TL0, #0f9h
	setb TR0
	loop: jnb TF0, loop
	clr TF0
	clr TR0
	ret
END