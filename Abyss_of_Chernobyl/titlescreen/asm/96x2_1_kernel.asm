draw_bmp_96x2_1

	lda	Segment
	CMP	#4
	BCC	TTTT
	RTS
TTTT
	ldy magassag3

	dey
	lda kezdet
	sta temp1


	
	lda #3
	sta NUSIZ0	;3=Player and Missile are drawn twice 32 clocks apart 
	sta NUSIZ1	;3=Player and Missile are drawn twice 32 clocks apart 





	sta HMCLR		;3

	lda titleframe
	and #1
	beq jmp_pf96x2_1_frame0
	jmp pf96x2_1_frame1
jmp_pf96x2_1_frame0
	jmp pf96x2_1_frame0

pf96x2_1_frame0
	;postion P0 and P1
	sta WSYNC
	lda #%11100000
	sta HMP0
	lda #%00010000
	sta HMP1
	sta WSYNC

	sleep 28
	sta RESP0
	sleep 14
	sta RESP1
	sta WSYNC
	sta HMOVE

	sta WSYNC
	sta HMCLR
	sta WSYNC

	sleep 4
	jmp pfline_96x2_1_frame0
	;align so our branch doesn't unexpectedly cross a page...
	if >. != >[.+$70]
	align 256
	endif

pfline_96x2_1_frame0
	lda #$80 	;2
	sta HMP0 	;3
	sta HMP1 	;3

	lda bmp_96x2_1_06,y ;4
	sta GRP1	 ;3

	lda bmp_96x2_1_00,y 
	sta GRP0
	lda bmp_96x2_1_02,y 
	sta GRP0
	lda bmp_96x2_1_04,y 
	sta GRP0

	sleep 2
	
	lda bmp_96x2_1_08,y
	sta GRP1
	lda bmp_96x2_1_10,y
	sta GRP1

	lda bmp_96x2_1_01,y 
	sta GRP0

		cpy	#23
	BCC	Smaller1
	cpy	#26
	BCS	Larger1
	ldx	Color2
	sleep  2
	jmp	ColorDone1

Smaller1
	ldx	Color3
	sleep 5
	jmp ColorDone1
Larger1
	ldx	Color1
	sleep 4
ColorDone1

	;sta WSYNC 	;=0
	sta HMOVE	;3 - NORMAL HMOVE

	

	

	lda #0			;2
	sta HMP0		;3
	sta HMP1		;3

	sleep 8

	lda bmp_96x2_1_07,y	
	sta GRP1

	lda bmp_96x2_1_03,y   ;5
	sta GRP0	;3 =  8
	lda bmp_96x2_1_05,y   ;5
	sta GRP0	;3 =  8

	sleep 2

	lda bmp_96x2_1_09,y   ;5
	sta GRP1	;3 =  8
	lda bmp_96x2_1_11,y  ;5
	sta GRP1	;3 =  8

	sleep 2
	stx	COLUP0
	stx	COLUP1


	sta HMOVE 	;3 - CYCLE 74 HMOVE 
	sleep 2
	dey

	cpy temp1 	;3
	bne pfline_96x2_1_frame0		;2/3

pf96x2_1_0codeend
 ;echo "critical code #1 in 96x2_1 is ",(pf96x2_1_0codeend-pfline_96x2_1_frame0), " bytes long."

	lda #0
	sta GRP0
	sta GRP1
	jmp pfdone_96x2_1


pf96x2_1_frame1

	;postion P0 and P1
	sta WSYNC
	lda #%00100000
	sta HMP0
	lda #0
	lda #%11110000
	sta HMP1
	sta WSYNC
	sleep 32
	sta RESP0
	sleep 12
	sta RESP1
	sta WSYNC
	sta HMOVE

	sta WSYNC
	sta HMCLR



	sta WSYNC
	sleep 3
	jmp pfline_96x2_1_frame1

	;align so our branch doesn't unexpectedly cross a page...
	if >. != >[.+$70]
	align 256
	endif

pfline_96x2_1_frame1

	sta HMOVE



	lda bmp_96x2_1_07,y ;4
	sta GRP1	 ;3

	lda #$0 	;2
	sta HMP0 	;3
	sta HMP1 	;3

	lda bmp_96x2_1_01,y 
	sta.w GRP0
	lda bmp_96x2_1_03,y 
	sta GRP0
	lda bmp_96x2_1_05,y 
	sta GRP0

	sleep 2
	
	lda bmp_96x2_1_09,y
	sta GRP1
	lda bmp_96x2_1_11,y
	sta GRP1

	lda bmp_96x2_1_00,y 
	sta GRP0

	sta.w HMOVE	;3 - cycle 74



	;sta WSYNC 	;=0 -----------------------------------------

	lda bmp_96x2_1_06,y	
	sta GRP1


			cpy	#23
	BCC	Smaller2
	cpy	#26
	BCS	Larger2
	ldx	Color2
	sleep  3
	jmp	ColorDone2

Smaller2
	ldx	Color3
	sleep 6
	jmp ColorDone2
Larger2
	ldx	Color1
	sleep 5
ColorDone2

	lda #$80		;2
	sta HMP0		;3
	sta HMP1		;3


	lda bmp_96x2_1_02,y   ;5
	sta GRP0	;3 =  8

	lda bmp_96x2_1_04,y   ;5
	sta GRP0	;3 =  8

	sleep 2

	lda bmp_96x2_1_08,y   ;5
	sta GRP1	;3 =  8

	lda bmp_96x2_1_10,y  ;5
	sta GRP1	;3 =  8

	sleep 4

	dey

	
 ifconst bmp_96x2_1_fade
	and bmp_96x2_1_fade
 else
	sleep 3
 endif
	sleep 2

	stx	COLUP0
	stx	COLUP1

	cpy temp1 	;2
	bne pfline_96x2_1_frame1		;2/3

pf96x2_1_1codeend
 ;echo "critical code #2 in 96x2_1 is ",(pf96x2_1_1codeend-pfline_96x2_1_frame1), " bytes long."

	lda #0
	sta GRP0
	sta GRP1

pfdone_96x2_1



	sta WSYNC ; debug

	rts

