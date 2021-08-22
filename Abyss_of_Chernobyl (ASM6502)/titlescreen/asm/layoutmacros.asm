
 ; the macro's used in the "titlescreen_layout.asm" file

 MAC draw_96x2_1
mk_96x2_1_on = 1
 jsr draw_bmp_96x2_1
 ENDM

 MAC draw_96x2_2
mk_96x2_2_on = 1

	sta	temp7
    	lda	#(((>(ret_point96x2-1)) & $0F) | $10)
    	pha
    	lda	#<(ret_point96x2-1)
    	pha
    	lda	#>(draw_bmp_96x2_2-1)
    	pha
    	lda	#<(draw_bmp_96x2_2-1)
    	pha
    	lda	temp7
    	pha
    	txa
    	pha
    	ldx	#3
    	jmp	BS_jsr
ret_point96x2
	
 ENDM

 MAC draw_96x2_3
mk_96x2_3_on = 1
 jsr draw_bmp_96x2_3
 ENDM

 MAC draw_48x1_1
mk_48x1_on = 1
mk_48x1_1_on = 1
 jsr draw_bmp_48x1_1
 ENDM

 MAC draw_48x1_2
mk_48x1_on = 1
mk_48x1_2_on = 1
 jsr draw_bmp_48x1_2
 ENDM

 MAC draw_48x1_3
mk_48x1_on = 1
mk_48x1_3_on = 1
 jsr draw_bmp_48x1_3
 ENDM

 MAC draw_48x2_1
mk_48x1_on = 1
mk_48x2_1_on = 1
 jsr draw_bmp_48x2_1
 ENDM

 MAC draw_48x2_2
mk_48x1_on = 1
mk_48x2_2_on = 1
 jsr draw_bmp_48x2_2
 ENDM

 MAC draw_48x2_3
mk_48x1_on = 1
mk_48x2_3_on = 1
 jsr draw_bmp_48x2_3
 ENDM

 MAC draw_score
mk_score_on = 1
 jsr draw_score_display
 ENDM

 MAC draw_gameselect
mk_gameselect_on = 1
 jsr draw_gameselect_display
 ENDM

 MAC draw_space 
 ldy #{1}
.loop
 sta WSYNC
 dey
 bne .loop
 ENDM 

 MAC draw_space_before
 ldy Space_Before
.loop2
 sta WSYNC
 dey
 bne .loop2
 ENDM 

