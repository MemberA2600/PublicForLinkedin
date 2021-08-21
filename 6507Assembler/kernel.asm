*Init Section
*---------------------------
* This is were variables and
* constants are asigned.
*
* This does not count into the
* ROM space.
*

random = $80
counter = $81
temp01 = $82
temp02 = $83
temp03 = $84
temp04 = $85
temp05 = $86
temp06 = $87
temp07 = $88
temp08 = $89
temp09 = $8a
temp10 = $8b
temp11 = $8c
temp12 = $8d
temp13 = $8e

item = $8f
frameColor = $90
			
*** Playfield Elements
pf0Pointer = $91		; 16 bits
pf1Pointer = $93		; 16 bits
pf2Pointer = $95		; 16 bits	
pfColorPointer = $97		; 16 bits 
bkColorPointer = $99		; 16 bits
bkBaseColor = $9b
pfBaseColor = $9c
pfIndex = $9d

************************
pfLines = $9e		; use only the low two bits  of $98 ???
NoGameMode = $9e	; if 7th bit set, don't draw the game section
bankToJump = $9e	;	; use only bites 2-4 of $98
			; 5-6 : FREE
************************
pfSettings = $9f	; Since CTRLPF 0-1 bits are fixed in the screen loop
pfEdges	= $9f		; 0-1: free
			; 2: Players move behind the pf
			; 3: Free
			; 4-5: Free
			; 6: 0: Objects stops at edges. 1: Object appear on opposite side
************************  7: If set, game checks edges in VBLANK.

*** Player Settings
P0SpritePointer = $a0		; 16bit
P0ColorPointer = $a2		; 16bit
P1SpritePointer = $a4		; 16bit
P1ColorPointer = $a6		; 16bit

****************************************	
P0Settings = $a8			; Bits 0-2 are sprite settings, 
P0Mirrored = $a8			; 3 is reflection, bits 4-5 are missile settings. 
P1Settings = $a9			
P1Mirrored = $a9			; Must be in order!
****************************************
P0Height = $aa
P1Height = $ab

****************************************
P0SpriteIndex = $ac			; low nibble is P0 sprite index
P1SpriteIndex = $ac			; high nibble is P1 sprite index
****************************************

*** Positions (Must be aligned!!)
P0Y = $ad	
P1Y = $ae	
M0Y = $af
M1Y = $b0

P0X = $b1
P1X = $b2
M0X = $b3
M1X = $b4

*** Fake Missile Colors
M0Color = $b5
M1Color = $b6


	; Constants
 
NTSC_Vblank =	169
NTSC_Overscan =	163

PAL_Vblank =	185
PAL_Overscan =	206



***************************
********* Start of 1st bank
***************************

*Enter Bank
*--------------------------
* Bank1 contains the main
* kernel and most game
* data
*

	fill 256	; We have to prevent writing on addresses taken by the SuperChip RAM.

EnterKernel
	LDA	frameColor	
	sta	WSYNC
	STA	COLUBK
  	ldx	#3 		; From m1 -> p0

HorPosLoop		
   	lda	P0X,X	
DivideLoop
	sbc	#15
   	bcs	DivideLoop
   	sta	temp01,X
   	sta	RESP0,X	
   	sta	WSYNC
   	dex
   	bpl	HorPosLoop	

	ldx	#3		; m1
   	ldy	temp04
   	lda	FineAdjustTable256,Y
   	sta	HMP0,X		
   
	dex			; m0
   	ldy	temp03
   	lda	FineAdjustTable256,Y
   	sta	HMP0,X	
   
	dex			; p1
   	ldy	temp02
   	lda	FineAdjustTable256,Y
   	sta	HMP0,X	

	dex			; p0
   	ldy	temp01
   	lda	FineAdjustTable256,Y
   	sta	HMP0,X	

   	sta	WSYNC
   	sta	HMOVE

	LDA	frameColor	; 3 
	STA 	COLUPF		; 3 

	LDA	#0	;2 
	STA 	ENAM0	;3 
	STA 	ENAM1	;3
	STA 	ENABL	; Disables missiles and ball 3 
	STA	GRP0	;3 
	STA	GRP1	; Sets player sprites to blank 3
 	STA	VDELP0	;3 
	STA	VDELP1  ;3 
	
	STA	PF1	;3 
	STA	PF2	;3 
	STA	PF0	;3 
	STA	temp03 	;3 Erase P1 sprite data
	


	LDA	pfSettings	;3 
	ORA	#%00000001	; Reflected playfield 2 
	AND	#%11111101	; Always get the original colors. 2 
	STA	CTRLPF		; 3 (54)

SettingUpP0SpriteAndMissile0

	LDA	P0Settings	;3 
	STA	REFP0		;3 
	AND	#%00110111	;2
	STA	NUSIZ0	; Sets P0 and M0 registers 3

	LDA	P0SpritePointer+1	; temp08 will store the sprite pointers high byte ; 3 (6)
	STA	temp07+1		; 2 (9)

	LDA	P0Y
	STA	temp09 	; temp09 stores P0 Y position.
	
SettingUpP1SpriteAndMissile1

	LDA	P1Settings
	STA	REFP1
	AND	#%00110111
	STA	NUSIZ1	; Sets P1 and M1 registers

	LDA	P1SpritePointer+1	; temp11 will store the sprite pointers high byte
	STA	temp10+1

	LDA	P1Y
	SEC		; Substract 1 because of the latency
	SBC	#1      ;
	STA	temp12 	; temp12 stores P1 Y position.


FinishPreparation
	TSX			;2
	STX	item		; Save the stack pointer 3 (5)

	LDA	#42	; 2 (7)
	TAX		; 2 (9)
	lsr		; 2 (11)
	lsr		; 2 (13)
	
	tay		;2 (15)

	LDA	(pfColorPointer),y	; 5 (20)
	CLC				; 2 (22)
	ADC	pfBaseColor 		; 3 (25)
	STA	temp02		; savePFColor 3 (28)

	LDA	(bkColorPointer),y 	; 5 (31)
	CLC				; 2 (33)
	ADC	bkBaseColor 		; 3 (34)
	STA	temp04		; saveBKColor 3 (36)

	LDY 	P1Height		; 3 (39)  		
	LDA	(P1ColorPointer),y	; 5 (44)
	STA	COLUP1		; Load first color 3 (47)

	STA	WSYNC
	
	LDX  	#42		; 2
	LDA	#14		; 2(4)
	CLC			; 2(6)
	ADC	pfIndex		; 3(9)
	STA	temp01		; Save pfIndex 3(12)	
	TAY			; 2(14)

	LDA	(pf0Pointer),y	; 5(19)
	STA	PF0		; 3(22)	
	STA	temp05		; 3(25)
	asl			; 2(27)
	asl			; 2(29)
	asl			; 2(31)
	asl			; 2(33)
	STA	temp06		; 3(36)


	sleep	9

	LDA	(pf2Pointer),y	; 5(45)
	STA	PF2		; 3(50)

	LDA	(pf1Pointer),y	; 5(55)
	STA	PF1		; 3(58)

	sleep	12
	
	LDA	temp02			; 3(73)	
	JMP	StartWithoutWSYNC	; 3(76)

NoP0DrawNow
	LDA	M0Color		; 3
	STA	COLUP0		; 3
	LDA	#0	  	; 2
	sleep	5		; 5

	JMP	saveP0Sprite	; 3 	 

NoP1DrawNow
	LDA	M1Color		; 3
	STA	COLUP1		; 3
	LDA	#0	  	; 2
	sleep	5		; 5

	JMP	saveP1Sprite	; 3 

DrawingTheScreen
	; temp01 = pfIndex
	; temp02 = pfColor
	; temp03 = P1 Sprite data
	; temp04 = bkColor
	; temp05 = P0 / 1
	; temp06 = P0 / 2
	; temp07, temp08 = P0 sprite pointers
	; temp09 = p0 Y
	; temp10, temp11 = P1 sprite pointers
	; temp12 = p1height
	; temp13 = lineNum

FirstLine
	STA	WSYNC		; 3 (76)
StartWithoutWSYNC
	STA	COLUPF		; 3 (3)
	LDA	temp04		; 3 (6)
	STA	COLUBK		; 3 (9)


	LDA	temp05		; 3 (12)
	STA	PF0		; 3 (15)


	LDA 	P0Height 	; 3 (18)
	DCP	temp09 		;  temp09 contains P0Y!  ; 5 (23)
	BCC	NoP0DrawNow	; 2 (25)
	LDY	temp09		; 3 (28)
	LDA	(P0ColorPointer),y 	; 5 (33)
	STA	COLUP0		; 3 (36)
	LDA	(temp07),y 	; 5 (41)
saveP0Sprite
	TAY			;2 (43)
	; 28

	LDA	temp06		; 3 (46)	
	STA	PF0		; 3 (49)


	STX	temp13		; 3 (52) Saves the lineNum
	ldx 	#$1e		; Address of ENAM1 2 (51) 
	txs			; 2 (53) 
	LDX	temp13		; 3 (55) Retrive the lineNum
	sleep	2
	

	LDA	temp03		; 3 (67)
	STY	GRP0		; 2 (70)
	STA	GRP1		; 3 (73)
MiddleLine

	LDY	temp01		; 3 (76)

	LDA	(pf0Pointer),y	; 5 (5)
	STA	PF0		; 3 (8)
	STA	temp05		; 3 (11)

	LDA	(pf1Pointer),y	; 5 (16)
	STA 	PF1		; 3 (19)

	LDA	(pf2Pointer),y	; 5 (24)
	STA 	PF2		; 3 (27)
	LDA	temp05		; 3 (30)
	asl			; 2 (32)
	asl			; 2 (34)
	asl			; 2 (36)
	asl			; 2 (38)
	STA	PF0		; 3 (41)
	STA	temp06		; 3 (44)

	TXA			; 2 (46)
	lsr			; 2 (48)
	lsr			; 2 (50)
	TAY			; 2 (52)

	cpx	M1Y		; 3
	php			; 3
	cpx	M0Y		; 3
	php			; 3 (12)

	LDA	(pfColorPointer),y	; 6 (73)
	STA	temp02		; 3 (76)
LastLine

	LDA	temp05		; 3 (3)
	STA	PF0		; 3 (6)

	LDA	(bkColorPointer),y ;5 (11)
	CLC	 		; 2 (13)
	ADC	bkBaseColor	; 3 (16)	
	STA	temp04		; 3 (19)


	LDA 	P1Height 	; 3 (21)
	DCP	temp12 		;  temp12 contains P0Y!  ; 5 (26)
	BCC	NoP1DrawNow	; 2 (28)
	LDY	temp12		; 3 (31)
	LDA	(P1ColorPointer),y 	; 5 (36)
	STA	COLUP1	; 3 (39)
	LDA	(temp10),y 	; 5 (44)
saveP1Sprite
	STA	temp03		; 3 (47) ;
	; 29

	sleep	4

	LDA	temp06		; 3 (53)
	STA	PF0		; 3 (56)

	DEX			; 2 (58)
	LDA	temp02		; 3 (61)

	CPX	#0		; 2 (63)
	BEQ	ResetAll  	; 2 (65)
	DEC	temp01		; 5 (70)
	JMP	FirstLine	; 3 (73)

ResetAll
	LDA	frameColor	; 3 (70)
	STA 	COLUBK		; 3 (73)
	STX	WSYNC		; 3 (76)
	STA 	COLUPF

	LDX	#0
	STX	PF0
	STX	PF1
	STX	PF2
	STX 	COLUBK
	STX	ENAM0
	STX	ENAM1

	STX	VDELP0
	STX	VDELP1
	STX	VDELBL
	STX	GRP0
	STX	GRP1
	LDX	item		; Retrieve the stack pointer
	TXS


JumpBackToBankScreenBottom

	lda	bankToJump
	lsr
	lsr
	AND	#%00000111	; Get the bank number to return
	tax
	
	SEC
	SBC	#2
	STA	temp01		
	CLC
	ADC	temp01		; ([bankNum - 2] * 2 )
	TAY			; Get the location of address from the table
		
		
	lda	ScreenJumpTable,y
   	pha
   	lda	ScreenJumpTable+1,y
   	pha
   	pha
   	pha
   	jmp	bankSwitchJump

ScreenJumpTable
	.byte	#>ScreenBottomBank2-1
	.byte	#<ScreenBottomBank2-1
*	.byte	#>ScreenBottomBank3-1
*	.byte	#<ScreenBottomBank3-1
*	.byte	#>ScreenBottomBank4-1
*	.byte	#<ScreenBottomBank4-1
*	.byte	#>ScreenBottomBank5-1
*	.byte	#<ScreenBottomBank5-1
*	.byte	#>ScreenBottomBank6-1
*	.byte	#<ScreenBottomBank6-1
*	.byte	#>ScreenBottomBank7-1
*	.byte	#<ScreenBottomBank7-1
*	.byte	#>ScreenBottomBank8-1
*	.byte	#<ScreenBottomBank8-1


*Calculations during VBLANK
*----------------------------
*

CalculateDuringVBLANK

* I always forget these!!
*
* X < Y
* LDA	X	
* CMP	Y
* BCS   else 	 
*
* X <= Y
*
* LDA	Y
* CMP	X
* BCC	else
*
* X > Y 
*
* LDA	Y
* CMP	X
* BCS	else
*
* X >= Y
*
* LDA	X
* CMP	Y
* BCC 	else
*

*CheckIfOutOfBorders
*--------------------------------------------
* This section will decide what should happen
* to the objects as they are touching the borders
* of the screen.

CheckIfOutOfBorders
	
	LDA	pfEdges
	BPL	CalculateIndexes	

	TSX
	STX	temp03	
	LDX	#3	; p0, p1, m0, m1


NextItemThings
*	
* temp01 - Largest X allowed
* temp02 - Largest Y allowed	
* temp03 - Stack pointer saved
* temp04 - EvenOrOdd
* temp05 - Temporal Storage
* temp06 - Smallest Y allowed
*
	TXA	
	TXS	
StillLargerThan1
	AND	#%00000001		; Even or Odd

NotLargerThan
	TAX
	STA	temp04
	LDA	P0Settings,x

	TSX
	CPX	#2
	BCS	ItsAMissile
	AND	#%00000111
	TAX	
	LDA	XHorBorderAddSprite,x
	JMP	NotAMissile
ItsAMissile	
	AND	#%00110000
	lsr
	lsr
	lsr
	lsr
	TAX
	LDA	XHorBorderAddMissile,x		
NotAMissile
	STA	temp05
	LDA	#165	
	SEC	
	SBC	temp05
	STA	temp01

VerticalFun
	LDX	temp04
	LDA	P0Height,x
	TSX
	CPX	#2
	BCS	ItsAMissile2
	LDA	temp04
	JMP 	NotAMissile2
ItsAMissile2
	LDA	#1
NotAMissile2
	STA	temp05
	LDA	#43
	SEC
	SBC	temp05
	STA	temp02

VerticalFun2
	LDX	temp04
	LDA	P0Height,x
	TSX
	CPX	#2
	BCS	ItsAMissile3
	CLC	
	ADC	#2
	ADC	temp04

	JMP	NotAMissile3
ItsAMissile3
	LDA	#2
NotAMissile3
	STA	temp06

	LDA	pfEdges
	BVC	AppearOpposite

	TSX
	LDA	P0X,x
	CMP	#16
	BCS	NotSmallerThan
	LDA	#16
	STA	P0X,x	
	JMP	doYForNow
NotSmallerThan
	LDA	temp01
	CMP 	P0X,x
	BCS	doYForNow
	STA	P0X,x
doYForNow
	LDA	P0Y,x
	CMP	temp06
	BCS	NotLowerThan
	LDA	temp06
	STA	P0Y,x
NotLowerThan
	LDA	temp02
	CMP	P0Y,x
	BCS	PrepareForNext
	LDA	temp02
	STA	P0Y,x
PrepareForNext
	DEX	
	CPX	#255
	BNE	NextItemThings
	JMP	StackBackUp

AppearOpposite
	TSX
	LDA	P0X,x
	CMP	#16
	BCS	NotSmallerThan2
	LDA	temp01
	SEC
	SBC	#1
	STA	P0X,x	
	JMP	doYForNow2
NotSmallerThan2
	LDA	temp01
	CMP 	P0X,x
	BCS	doYForNow2
	LDA	#17
	STA	P0X,x
doYForNow2
	LDA	P0Y,x
	CMP	temp06
	BCS	NotLowerThan2
	LDA	temp02
	SEC
	SBC	#1
	STA	P0Y,x
NotLowerThan2
	LDA	temp02
	CMP	P0Y,x
	BCS	PrepareForNext2
	LDA	temp06
	CLC
	ADC	#1
	STA	P0Y,x
PrepareForNext2
	DEX	
	CPX	#255
	BNE	NextItemThings

StackBackUp
	LDX	temp03
	TXS

CalculateIndexes
	LDA 	P0Height
	CLC
	ADC	#1
	STA	temp01	

	LDA	P0SpriteIndex	
	AND	#%00001111	; Get low nibble for P0 index
	TAY			; Move it to Y for calculations
	LDA	P0SpritePointer
	
CalculateP0PointerIndex
	; You can only have the maximum number of sprites 256/height that is always smaller than 16
	; (over 16 px height, you cannot use all 16 indexes because of the paging overflow that would break timing.

	CPY	#0
	BEQ	CalculateP0PointerIndexDone
	CLC	
	ADC	temp01
	DEY
	JMP	CalculateP0PointerIndex


CalculateP0PointerIndexDone
	STA	temp07		; temp10 will store the sprite pointers low byte
 
	LDA 	P1Height
	CLC
	ADC	#1
	STA	temp01	

	LDA	P1SpriteIndex	
	AND	#%11110000	; Get high nibble for P1 index
	lsr
	lsr
	lsr
	lsr
	TAY			; Move it to Y for calculations
	LDA	P1SpritePointer
	
CalculateP1PointerIndex
	; You can only have the maximum number of sprites 256/height that is always smaller than 16
	; (over 16 px height, you cannot use all 16 indexes because of the paging overflow that would break timing.

	CPY	#0
	BEQ	CalculateP1PointerIndexDone
	CLC	
	ADC	temp01
	DEY
	JMP	CalculateP1PointerIndex


CalculateP1PointerIndexDone
	STA	temp10		; temp10 will store the sprite pointers low byte

JumpBackToBankScreenTop

	lda	bankToJump
	lsr
	lsr
	AND	#%00000111	; Get the bank number to return
	tax
	
	SEC
	SBC	#2
	STA	temp01		
	CLC
	ADC	temp01		; ([bankNum - 2] * 2 )
	TAY			; Get the location of address from the table
		
		
	lda	VBlankJumpTable,y
   	pha
   	lda	VBlankJumpTable+1,y
   	pha
   	pha
   	pha
   	jmp	bankSwitchJump



FineAdjustTable256
VBlankJumpTable
	byte	#>VBlankEndBank2-1
	byte	#<VBlankEndBank2-1
*	byte	#>VBlankEndBank3-1
*	byte	#<VBlankEndBank3-1
*	byte	#>VBlankEndBank4-1
*	byte	#<VBlankEndBank4-1
*	byte	#>VBlankEndBank5-1
*	byte	#<VBlankEndBank5-1
*	byte	#>VBlankEndBank6-1
*	byte	#<VBlankEndBank6-1
*	byte	#>VBlankEndBank7-1
*	byte	#<VBlankEndBank7-1
*	byte	#>VBlankEndBank8-1
*	byte	#<VBlankEndBank8-1

	byte	#0	; Remove these after the
	byte	#0	; skeleton is finished!!
	byte	#0
	byte	#0
	byte	#0
	byte	#0
	byte	#0
	byte	#0
	byte	#0
	byte	#0
	byte	#0
	byte	#0

XHorBorderAddSprite
	byte	#8
	byte	#24
	byte	#40
	byte	#40
	byte	#72
	byte	#16
	byte	#72
	byte	#32
	

XHorBorderAddMissile
	byte	#1
	byte	#2
	byte	#4
	byte	#8

	fill 	214

FineAdjustTable
	byte	#$80
	byte	#$70
	byte	#$60
	byte	#$50
	byte	#$40
	byte	#$30
	byte	#$20
	byte	#$10
	byte	#$00
	byte	#$f0
	byte	#$e0
	byte	#$d0
	byte	#$c0
	byte	#$b0
	byte	#$a0
	byte	#$90

UnderTheTable


*Data Section
*-------------------------------
* Contains graphics data for the
* main kernel.

Zero
Null
None
	.BYTE	#0	; This is an empty byte for constant code usage.



	align 256

Data_Section

Castle_01
	BYTE %11111111
	BYTE %11111111
	BYTE %01111111
	BYTE %01111111
	BYTE %01111111
	BYTE %00111111
	BYTE %00111111
	BYTE %00001111
	BYTE %00001111
	BYTE %00001111
	BYTE %00001111
	BYTE %00000110
	BYTE %00000110
	BYTE %00000110
	BYTE %00011111
	BYTE %00011111
	BYTE %00000110
	BYTE %00000110
	BYTE %00000000
	BYTE %00000001
	BYTE %00000001
	BYTE %00000001
	BYTE %00000001
	BYTE %00000001
	BYTE %00000111
	BYTE %00000111
	BYTE %00001111
	BYTE %00001111
	BYTE %00001111
	BYTE %00001100
	BYTE %00001011
	BYTE %00001011
	BYTE %00111111
	BYTE %00111111
	BYTE %00110111
	BYTE %00110111
	BYTE %00110111
	BYTE %00110011
	BYTE %00000011
	BYTE %00000011
	BYTE %00000000
	BYTE %00000000	; 41


Castle_02
	BYTE %00111100
	BYTE %00111100
	BYTE %00111111
	BYTE %00111111
	BYTE %00111111
	BYTE %00111111
	BYTE %01111111
	BYTE %01111110
	BYTE %01111110
	BYTE %11111110
	BYTE %11111110
	BYTE %11111110
	BYTE %11111100
	BYTE %11111100
	BYTE %10000101
	BYTE %11111111
	BYTE %10000110
	BYTE %11111110
	BYTE %10000111
	BYTE %11001111
	BYTE %11111111
	BYTE %11111111
	BYTE %11111111
	BYTE %11111101
	BYTE %01111101
	BYTE %01111111
	BYTE %01111111
	BYTE %00111111
	BYTE %00111011
	BYTE %00111011
	BYTE %11110101
	BYTE %11110101
	BYTE %11111111
	BYTE %00111111
	BYTE %01101101
	BYTE %11101101
	BYTE %10001101
	BYTE %00001100
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000	;82

Mountain
	BYTE %11111100
	BYTE %11111100
	BYTE %11111100
	BYTE %11111110
	BYTE %11111111
	BYTE %11111111
	BYTE %11111111
	BYTE %11111111
	BYTE %11111111
	BYTE %11111111
	BYTE %01110111
	BYTE %01110111
	BYTE %01110111
	BYTE %01110111
	BYTE %01110111
	BYTE %01110111
	BYTE %01110111
	BYTE %01110111
	BYTE %00110011
	BYTE %00010001
	BYTE %00010000
	BYTE %00010000
	BYTE %00010000
	BYTE %00010000
	BYTE %00010000
	BYTE %00010000
	BYTE %11010000
	BYTE %11110000
	BYTE %11110000
	BYTE %01110000
	BYTE %00010000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00010001
	BYTE %00110011
	BYTE %01110111	; 123

Castle_Color
	BYTE	$04
	BYTE	$02
	BYTE	$04
	BYTE	$06
	BYTE	$08
	BYTE	$06
	BYTE	$04
	BYTE	$04
	BYTE	$06
	BYTE	$08
	BYTE	$06
	BYTE	$08
	BYTE	$06
	BYTE	$04	; 137


Castle_Background
	BYTE	$d6
	BYTE	$d8
	BYTE	$da
	BYTE	$1e
	BYTE	$1c
	BYTE	$1c
	BYTE	$1a
	BYTE	$3a
	BYTE	$38
	BYTE	$36
	BYTE	$38
	BYTE	$36
	BYTE	$4a
	BYTE	$46	; 151

Dragon
 	.byte %00000000
 	.byte %10000000
 	.byte %10001000
 	.byte %11010000
 	.byte %11110000
 	.byte %01111000
 	.byte %00111100
 	.byte %01111100
 	.byte %11011111
 	.byte %10011010
 	.byte %10001100
 	.byte %00000000
 	.byte %00000000	; 1 (163)
 	.byte %00100000
 	.byte %01000000
 	.byte %01000000
 	.byte %11011000
 	.byte %11100000
 	.byte %11111100
 	.byte %11111111
 	.byte %01111010
 	.byte %01101100
 	.byte %01100000
 	.byte %11000000
 	.byte %00000000	; 2 (175)
 	.byte %00010000
 	.byte %01100000
 	.byte %11001000
 	.byte %10010100
 	.byte %11101000
 	.byte %11110000
 	.byte %11111000
 	.byte %11111111
 	.byte %01111010
 	.byte %00011100
 	.byte %00000000
 	.byte %00000000	;4 (187)
 	.byte %00111000
 	.byte %01001100
 	.byte %11010010
 	.byte %10010000
 	.byte %11100000
 	.byte %11111100
 	.byte %11111111
 	.byte %11110000
 	.byte %01111110
 	.byte %00110100
 	.byte %00011000


DragonColors
	.byte #$84
	.byte #$86
	.byte #$88
	.byte #$8a
	.byte #$88
	.byte #$8a
	.byte #$88
	.byte #$88
	.byte #$8a
	.byte #$88
	.byte #$86
	.byte #$84	; 199

UFO
 	.byte #%00111100
 	.byte #%01111110
 	.byte #%11111111
 	.byte #%10110110
 	.byte #%11111111
 	.byte #%01011010
 	.byte #%00100100
 	.byte #%00011000
 	.byte #%00111100	; 1 (207)
 	.byte #%01111110
 	.byte #%11111111
 	.byte #%01101101
 	.byte #%11111111
 	.byte #%01011010
 	.byte #%00100100
 	.byte #%00011000
 	.byte #%00111100	; 2 (215)
 	.byte #%01111110
 	.byte #%11111111
 	.byte #%11011011
 	.byte #%11111111
 	.byte #%01011010
 	.byte #%00100100
 	.byte #%00011000	; 3 (223)

UFOColors
	byte #$02
	byte #$04
	byte #$96
	byte #$9c
	byte #$9e
	byte #$96
	byte #$04
	byte #$02	; 231


	saveFreeBytes
	rewind 1fd4

start_bank1 
	ldx	#$ff
   	txs
   	lda	#>(Start-1)
   	pha
   	lda	#<(Start-1)
   	pha
   	pha
   	txa
   	pha
   	tsx
   	lda	4,x	; get high byte of return address   
   	rol
   	rol
   	rol
	rol
   	and	#7	 
	tax
   	inx
   	lda	$1FF4-1,x
   	pla
   	tax
   	pla
   	rts
	rewind 1ffc
   	.byte 	#<start_bank1
   	.byte 	#>start_bank1
   	.byte 	#<start_bank1
   	.byte 	#>start_bank1

***************************
********* Start of 2nd bank
***************************
	Bank 2
	fill	256
	
*Enter Bank
*-----------------------------
*
* This is the section that happens
* everytime you go to a new screen.
* Should set the screen initialization
* here.
*

EnterScreenBank2

	LDA	#$48
	sta 	frameColor

	LDA	#<Mountain
	STA 	pf0Pointer 
	LDA	#>Mountain
	STA 	pf0Pointer+1

	LDA	#<Castle_01
	STA 	pf1Pointer 
	LDA	#>Castle_01
	STA 	pf1Pointer+1

	LDA	#<Castle_02
	STA 	pf2Pointer 
	LDA	#>Castle_02
	STA 	pf2Pointer+1

	LDA	#<Castle_Color
	STA 	pfColorPointer 
	LDA	#>Castle_Color
	STA 	pfColorPointer+1

	LDA	#0
	STA	pfBaseColor
	STA	bkBaseColor

	LDA	#<Dragon
	STA	P0SpritePointer
	LDA	#>Dragon
	STA	P0SpritePointer+1
	
	LDA	#<DragonColors
	STA	P0ColorPointer
	LDA	#>DragonColors
	STA	P0ColorPointer+1

	LDA	#<UFOColors
	STA	P1ColorPointer
	LDA	#>UFOColors
	STA	P1ColorPointer+1

	LDA	#<Castle_Background
	STA	bkColorPointer 
	LDA	#>Castle_Background
	STA	bkColorPointer+1	

	LDA	#82
	STA	P0X
	
	LDA	#18
	STA	P0Y

	LDA	#0
	STA	P0SpriteIndex ; 	Sets both indexes to 0;
	STA	M0Y
	STA	M1Y

	JSR	CallRandomBank2
	AND	#%01111111
	CLC
	ADC	#10
	STA	M0X
	JSR	CallRandomBank2
	AND	#%01111111
	CLC
	ADC	#10
	STA	M1X


	LDA	#26
	STA	pfIndex

	LDA	#11
	STA	P0Height

	LDA	#<UFO
	STA	P1SpritePointer
	LDA	#>UFO
	STA	P1SpritePointer+1

	LDA	#7
	STA	P1Height

	LDA	#96
	STA	P1X
	
	LDA	#33
	STA	P1Y

	LDA	#28
	STA	M0Y
	STA	M1Y

	LDA	#$0e
	STA	M0Color

	LDA	#$00
	STA	M1Color

	LDA	pfEdges 	; Sets the Edge detection and also sets it to
	AND	#%00111111	; make objects appear on the other side
	ORA	#%11000000
	STA	pfEdges
	


	; set this for static, we will see if we can add advanced colours.
	LDA	#$0e
	STA	COLUP1		

	JMP	WaitUntilOverScanTimerEndsBank2

*Overscan
*-----------------------------
*
* This is the place of the main
* code of this screen.
*

OverScanBank2

	CLC
        LDA	INTIM 
        BNE 	OverScanBank2

	LDA	#%11000010
	STA	VBLANK
	STA	WSYNC

    	LDA	#NTSC_Overscan
    	STA	TIM64T
	INC	counter

*Overscan Code
*-----------------------------
*
* This is where the game code
* begins.
*

	LDA	counter

	AND	#%00111111
	CMP	#%00111111
	BNE	NOINC

	LDA	pfIndex
	CMP	#27
	BCS	NOINC
	INC 	pfIndex
NOINC
	LDA	counter
	AND	#%00000111
	CMP	#%00000111
	BNE	.Sprite1IndexSetDone

.animateP0Sprite
    	LDA	P0SpriteIndex
	AND	#%00001111
     	CMP	#3
    	BCC	*+7
    	LDA	#0
    	jmp	*+7

	CLC
	ADC	#1

	STA	temp01
	LDA	P0SpriteIndex
	AND	#%11110000
	ORA	temp01
	STA	P0SpriteIndex
    	
.Sprite0IndexSetDone
.animateP1Sprite
    	LDA	P1SpriteIndex
	AND	#%11110000
	lsr
	lsr
	lsr
	lsr
     	CMP	#2
    	BCC	*+7
    	LDA	#0
    	jmp	*+7

	CLC
	ADC	#1
	asl
	asl
	asl	
	asl

	STA	temp01
	LDA	P1SpriteIndex
	AND	#%00001111
	ORA	temp01
	STA	P1SpriteIndex
	
	
.Sprite1IndexSetDone


MoveP0
	JMP	TESTING

	LDA	P0Settings
	AND 	#%00001000	
	CMP	#%00001000
	BEQ	FlyRight
	LDA	P0X
	CMP	#150
   	BCS	TurnRight
     	INC	P0X
	DEC	P1X
   	jmp	MovedP0
TurnRight
   	LDA	P0Settings
   	ORA	#8
   	STA	P0Settings
   	jmp	MovedP0
FlyRight
   	LDA	#20
   	CMP	P0X
  	BCS	TurnLeft
   	DEC	P0X
	INC	P1X
	JMP	MovedP0
TurnLeft
  	LDA	P0Settings
   	AND	#247
   	STA	P0Settings  

MovedP0
	LDA	counter
	AND	#%00011111
	CMP	#%00011111
	BNE	NoMoreMoveForSure


	LDA	counter
	BPL 	DirectionUpDown

	DEC	P0Y
	INC	P1Y
	JMP	NoMoreMoveForSure
DirectionUpDown
	INC	P0Y
	DEC	P1Y
NoMoreMoveForSure
	LDA	counter
	AND	#%00000001
	CMP	#%00000001
	BNE	NoMissileMovement
	INC	M0Y
	DEC	M1Y
	INC	M0X
	DEC	M1X
NoMissileMovement

	JMP	NOTESTING

TESTING
*	LDA	P1Settings
*	AND	#%11111000
*	ORA	#%00000000
*	STA	P1Settings
	INC	P0X
	DEC	P1X
	LDA	counter
	AND	#%00000111
	CMP 	#%00000111
	BNE	NoVerMove
*	INC	P0Y
	DEC	P1Y

NoVerMove
*	JMP 	NoMoreMoveForSure
NOTESTING

*VSYNC
*----------------------------
* This is a fixed section in
* every bank. Don't need to be
* at the same space, of course.

WaitUntilOverScanTimerEndsBank2
	CLC
	LDA 	INTIM
	BMI 	WaitUntilOverScanTimerEndsBank2

* Sync the Screen
*

	LDA 	#2
	STA 	WSYNC  ; one line with VSYNC
	STA 	VSYNC	; enable VSYNC
	STA 	WSYNC 	; one line with VSYNC
	STA 	WSYNC 	; one line with VSYNC
	LDA 	#0
	STA 	WSYNC 	; one line with VSYNC
	STA 	VSYNC 	; turn off VSYNC

* Set the timer for VBlank
*

	STA	VBLANK
	STA 	WSYNC

	CLC
 	LDA	#NTSC_Vblank
	STA	TIM64T

*VBLANK
*-----------------------------
* This is were you can set a piece
* of code as well, but some part may
* be used by the kernel.
*
VBLANKBank2



*SkipIfNoGameSet - VBLANK
*---------------------------------
*

	BIT	pfLines 		; NoGameMode
	BMI	VBlankEndBank2		; if 7th bit set (for a title or game over screen), the calculation part is skipped.		

*Costful Calculations in VBLANK
*--------------------------------------------------------
* There are some really costful calculations those would
* require a lot of WSYNCS during the draw section, to avoid
* that, we do them in VBLANK.
*

	LDA	#2
	asl
	asl			; Rol left two bits to save bankNumber
	STA	temp01

	LDA 	bankToJump
	AND	#%11100011	; Clear previous bankNumber
	ORA	temp01		; Save the bankNumber
	STA	bankToJump

	lda	#>(CalculateDuringVBLANK-1)
   	pha
   	lda	#<(CalculateDuringVBLANK-1)
   	pha
   	pha
   	pha
   	ldx	#1
   	jmp	bankSwitchJump

VBlankEndBank2
	CLC
	LDA 	INTIM
	BMI 	VBlankEndBank2

    	LDA	#230
    	STA	TIM64T


*ScreenTop
*--------------------------------  
* This is the section for the
* top part of the screen.
*



*SkipIfNoGameSet
*---------------------------------
*

	BIT	pfLines 		; NoGameMode
	BPL	JumpToMainKernelBank2	; if 7th bit set (for a title or game over screen), the main game section is skipped.	
	LDX	#0	
	JMP	ScreenBottomBank2


*JumpToMainKernel
*---------------------------------
* For this, the program go to main
* kernel in bank1.

JumpToMainKernelBank2

	LDA	#2
	asl
	asl			; Rol left two bits to save bankNumber
	STA	temp01

	LDA 	bankToJump
	AND	#%11100011	; Clear previous bankNumber
	ORA	temp01		; Save the bankNumber
	STA	bankToJump

	lda	#>(EnterKernel-1)
   	pha
   	lda	#<(EnterKernel-1)
   	pha
   	pha
   	pha
   	ldx	#1
   	jmp	bankSwitchJump

*ScreenBottom
*--------------------------------  
* This is the section for the
* bottom part of the screen.
*

ScreenBottomBank2
	JMP	OverScanBank2


*Routine Section
*---------------------------------
* This is were the routines are
* used by the developer.
*

CallRandomBank2
	LDA	random
	lsr
	BCC 	*+4
	EOR	#$d4
	EOR	counter
	STA	random
	rts	

*Data Section
*--------------------------------  
* Here goes the data used by
* custom ScreenTop and ScreenBottom
* elments.
*

	saveFreeBytes
	rewind 	2fd4
	
start_bank2
	ldx	#$ff
   	txs
   	lda	#>(Start-1)
   	pha
   	lda	#<(Start-1)
   	pha
   	pha
   	txa
   	pha
   	tsx
   	lda	4,x	; get high byte of return address  
   	rol
   	rol
   	rol
	rol
   	and	#7	 
	tax
   	inx
   	lda	$1FF4-1,x
   	pla
   	tax
   	pla
   	rts
	rewind 2ffc
   	.byte 	#<start_bank2
   	.byte 	#>start_bank2
   	.byte 	#<start_bank2
   	.byte 	#>start_bank2

***************************
********* Start of 3rd bank
***************************
	Bank 3
	fill	256
	
	saveFreeBytes
	rewind 	3fd4

start_bank3
	ldx	#$ff
   	txs
   	lda	#>(Start-1)
   	pha
   	lda	#<(Start-1)
   	pha
   	pha
   	txa
   	pha
   	tsx
   	lda	4,x	; get high byte of return address 
   	rol
   	rol
   	rol
	rol
   	and	#7	 
	tax
   	inx
   	lda	$1FF4-1,x
   	pla
   	tax
   	pla
   	rts
	rewind 3ffc
   	.byte 	#<start_bank3
   	.byte 	#>start_bank3
   	.byte 	#<start_bank3
   	.byte 	#>start_bank3

***************************
********* Start of 4th bank
***************************
	Bank 4
	fill	256
	
	saveFreeBytes
	rewind 	4fd4
	
start_bank4
	ldx	#$ff
   	txs
   	lda	#>(Start-1)
   	pha
   	lda	#<(Start-1)
   	pha
   	pha
   	txa
   	pha
   	tsx
   	lda	4,x	; get high byte of return address  
   	rol
   	rol
   	rol
	rol
   	and	#7	 
	tax
   	inx
   	lda	$1FF4-1,x
   	pla
   	tax
   	pla
   	rts
	rewind 4ffc
   	.byte 	#<start_bank4
   	.byte 	#>start_bank4
   	.byte 	#<start_bank4
   	.byte 	#>start_bank4


***************************
********* Start of 5th bank
***************************
	Bank 5
	fill	256
	
	saveFreeBytes
	rewind 	5fd4
	
start_bank5
	ldx	#$ff
   	txs
   	lda	#>(Start-1)
   	pha
   	lda	#<(Start-1)
   	pha
   	pha
   	txa
   	pha
   	tsx
   	lda	4,x	; get high byte of return address   
   	rol
   	rol
   	rol
	rol
   	and	#7	 
	tax
   	inx
   	lda	$1FF4-1,x
   	pla
   	tax
   	pla
   	rts
	rewind 5ffc
   	.byte 	#<start_bank5
   	.byte 	#>start_bank5
   	.byte 	#<start_bank5
   	.byte 	#>start_bank5

***************************
********* Start of 6th bank
***************************
	Bank 6
	fill	256
	
	saveFreeBytes
	rewind 	6fd4
	
start_bank6
	ldx	#$ff
   	txs
   	lda	#>(Start-1)
   	pha
   	lda	#<(Start-1)
   	pha
   	pha
   	txa
   	pha
   	tsx
   	lda	4,x	; get high byte of return address   	
   	rol
   	rol
   	rol
	rol
   	and	#7	 
	tax
   	inx
   	lda	$1FF4-1,x
   	pla
   	tax
   	pla
   	rts
	rewind 6ffc
   	.byte 	#<start_bank6
   	.byte 	#>start_bank6
   	.byte 	#<start_bank6
   	.byte 	#>start_bank6

***************************
********* Start of 7th bank
***************************
	Bank 7
	fill	256
	
	saveFreeBytes
	rewind 	7fd4
	
start_bank7
	ldx	#$ff
   	txs
   	lda	#>(Start-1)
   	pha
   	lda	#<(Start-1)
   	pha
   	pha
   	txa
   	pha
   	tsx
   	lda	4,x	; get high byte of return address   	
   	rol
   	rol
   	rol
	rol
   	and	#7	 
	tax
   	inx
   	lda	$1FF4-1,x
   	pla
   	tax
   	pla
   	rts
	rewind 7ffc
   	.byte 	#<start_bank7
   	.byte 	#>start_bank7
   	.byte 	#<start_bank7
   	.byte 	#>start_bank7

***************************
********* Start of 8th bank
***************************
	Bank 8
	fill	256
	
	
	align 256
	
Start
   	sei
   	cld
   	ldy	#0
   	lda	$D0
   	cmp	#$2C		;check RAM location #1   	bne	MachineIs2600
   	lda	$D1
   	cmp	#$A9		;check RAM location #2   	bne	MachineIs2600
   	dey
MachineIs2600
	ldx	#0
  	txa
clearmem
   	inx
   	txs
   	pha
	cpx	#$ff
   	bne	clearmem	; Clear the RAM.

	LDA	$F080		; Sets two values for the SC RAM 
	STA	$80		; to Random and Counter variables
	LDA	$F081
	STA	$81

	LDY	#0
	TAY		
ClearSCRAM
	STA 	$F000,Y
	INY
	BPL 	ClearSCRAM

	lda	#>(EnterScreenBank2-1)
   	pha
   	lda	#<(EnterScreenBank2-1)
   	pha
   	pha
   	pha
   	ldx	#2
   	jmp	bankSwitchJump

	saveFreeBytes
	rewind 	8fd4

bankSwitchCode
 	ldx	#$ff
   	txs
   	lda	#>(Start-1)
   	pha
   	lda	#<(Start-1)
   	pha
bankSwitchReturn
	pha
	txa
   	pha
   	tsx
   	lda	4,x	; get high byte of return address	
	rol
   	rol
   	rol
   	rol
   	and	#7	
	tax
   	inx
bankSwitchJump
   	lda	$1FF4-1,x
   	pla
   	tax
   	pla
   	rts
	rewind 8ffc	   
   	.byte 	#<Start
  	.byte 	#>Start
   	.byte 	#<Start
  	.byte 	#>Start