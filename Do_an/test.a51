org 0h
	mov TMOD, #1d
	acall Res_back
	main:	
	
	mov R2, #8d
	mov R4, #8d
	lcall Send_0
	lcall Send_1
	acall Res_back
	
	ljmp main
	
	Delay:
	mov TH0, #0h
	mov TL0, #0h
	setb TR0
	loop: jnb TF0, loop
	clr TF0
	clr TR0
	djnz R1, Delay
	ret
	
	Res_back:
	mov R1, #113d
	clr P2.2
	wait:
	djnz R1, wait
	ret
	
	Send_1:
	setb P2.2
	nop
	clr P2.2
	
	setb P2.2
	nop
	clr P2.2
	
	setb P2.2
	nop
	clr P2.2
	
	setb P2.2
	nop
	clr P2.2
	
	setb P2.2
	nop
	clr P2.2
	
	setb P2.2
	nop
	clr P2.2
	
	setb P2.2
	nop
	clr P2.2
	
	setb P2.2
	nop
	clr P2.2
	
	setb P2.2
	nop
	clr P2.2
	
	setb P2.2
	nop
	clr P2.2
	
	setb P2.2
	nop
	clr P2.2
	
	setb P2.2
	nop
	clr P2.2
	
	setb P2.2
	nop
	clr P2.2
	
	setb P2.2
	nop
	clr P2.2
	
	setb P2.2
	nop
	clr P2.2
	
	setb P2.2
	nop
	clr P2.2
	
	setb P2.2
	nop
	clr P2.2
	
	setb P2.2
	nop
	clr P2.2
	
	setb P2.2
	nop
	clr P2.2
	
	setb P2.2
	nop
	clr P2.2
	
	setb P2.2
	nop
	clr P2.2
	
	setb P2.2
	nop
	clr P2.2
	
	setb P2.2
	nop
	clr P2.2
	
	setb P2.2
	nop
	clr P2.2
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
END