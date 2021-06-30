Init_Section
	; Variables
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
temp10 = $95
temp11 = $96
temp12 = $af
temp13 = $b6
temp14 = $b7
item = $97
frameColor = $9f
			
		; playfield Elements
pf1Pointer = $8c		; 16 bits
pf2Pointer = $8e		; 16 bits
pfBaseColor = $91
pfColorPointer = $92	;16 bits 
pfFixColor = $94		

pfIndex =	$8b

pfLines = $98		; use only the low two bits  of $98
NoGameMode = $98	; if 7th bit set, don't draw the game section
bankToJump = $98		; use only bites 2-4 of $98
			; 5-6 : FREE

pfSettings = $b2		; Since CTRLPF 0-1 bits are fixed in the screen loop
			; 0-1: free
			; 2: Players move behind the pf
			; 3: Free
			; 4-5: Ball size
			; 6: Free
			; 7: PFColor / BGColor switch


pf0Pointer = $99		; 16 bits

		; p0 settings
P0SpritePointer = $9b		; 16bit
P0ColorPointer = $9d		; 16bit

P0X	= $a0
P0Y 	= $ab			
P0Settings = $ac			; Bits 0-2 are sprite settings, 3 is reflection, bits 4-5 are missile settings. 
P0Mirrored = $ac
P0Height = $ad

P1SpritePointer = $b0		; 16bit
P1X	= $b5
P1Y 	= $b3			
P1Settings = $b4			; Bits 0-2 are sprite settings, 3 is reflection, bits 4-5 are missile settings. 
P1Mirrored = $b4
P1Height = $b4


P0SpriteIndex = $ae			; low nibble is P0 sprite index
P1SpriteIndex = $ae			; high nibble is P1 sprite index

pfLines = $98		; if 7th bit set, don't draw the game section
bankToJump = $98		; use only bites 2-4 of $98
			; 5-6 : FREE

pfSettings = $b2		; Since CTRLPF 0-1 bits are fixed in the screen loop
			; 0-1: free
			; 2: Players move behind the pf
			; 3: Free
			; 4-5: Ball size
			; 6: Free
			; 7: PFColor / BGColor switch


pf0Pointer = $99		; 16 bits

		; p0 settings
P0SpritePointer = $9b		; 16bit
P0ColorPointer = $9d		; 16bit

P0X	= $a0
P0Y 	= $ab			
P0Settings = $ac			; Bits 0-2 are sprite settings, 3 is reflection, bits 4-5 are missile settings. 
P0Mirrored = $ac
P0Height = $ad



P0SpriteIndex = $ae			; low nibble is P0 sprite index
P1SpriteIndex = $ae			; high nibble is P1 sprite index

	; Constants 
NTSCtimer = 163
PALtimer = 223


	fill 256	; We have to prevent writing on addresses taken by the SuperChip RAM.

StartTheROM

SettingsForTesting

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

	LDA	#3
	STA	pfLines 

	LDA	#0
	STA	pfBaseColor

	LDA	#<Dragon
	STA	P0SpritePointer
	LDA	#>Dragon
	STA	P0SpritePointer+1
	
	LDA	#<DragonColors
	STA	P0ColorPointer
	LDA	#>DragonColors
	STA	P0ColorPointer+1

	LDA	#55
	STA	P0X
	
	LDA	#13
	STA	P0Y

	LDA	#0
	STA	P0SpriteIndex ; 	Sets both indexes to 0;
	STA	pfIndex

	LDA	#12
	STA	P0Height

	LDA	#<UFO
	STA	P1SpritePointer
	LDA	#>UFO
	STA	P1SpritePointer+1

	LDA	#8
	STA	P1Height

	LDA	#93
	STA	P1X
	
	LDA	#28
	STA	P1Y


	; set this for static, we will see if we can add advanced colours.
	LDA	#$0e
	STA	COLUP1		

ScreenLoop	; This is where the loop begins.
WaitUntilOverScanTimerEnds
	CLC
	LDA 	INTIM
	BMI 	WaitUntilOverScanTimerEnds

SyncTheScreen
	LDA 	#2
	STA 	WSYNC  ; one line with VSYNC
	STA 	VSYNC	; enable VSYNC
	STA 	WSYNC 	; one line with VSYNC
	STA 	WSYNC 	; one line with VSYNC
	LDA 	#0
	STA 	WSYNC 	; one line with VSYNC
	STA 	VSYNC 	; turn off VSYNC
SetVBLANKTimer
	STA	VBLANK
	STA 	WSYNC

	CLC
 	LDA	#170
	STA	TIM64T

VBLANKCode

	BIT	pfLines 	; NoGameMode
	BPL	NoVBlankGameSkip	; if 7th bit set (for a title or game over screen), the main game section is skipped.	
	LDX	#0	
	JMP	WaitUntilVBlankTimerEnds
NoVBlankGameSkip

	LDA	frameColor
	STA	COLUBK
	STA 	COLUPF	

	LDA	#0
	STA 	ENAM0	; 
	STA 	ENAM1	;
	STA 	ENABL	; Disables missiles and ball
	STA	GRP0	;
	STA	GRP1	; Sets player sprites to blank

	; TODO: Setting player locations.

	STA	PF1
	STA	PF2	
	STA	PF0
	STA	temp11

	LDA	pfSettings
	ORA	#%00000001	; Reflected playfield
	AND	#%11111101	; Always get the original colors.
	STA	CTRLPF
SettingPointersEarly
SettingUpP0SpriteAndMissile0
	LDA	P0Settings
	STA	REFP0
	AND	#%00110111
	STA	NUSIZ0	; Sets P0 and M0 registers

	LDA	P0SpritePointer+1	; temp08 will store the sprite pointers high byte
	STA	temp07+1

	LDA	P0SpriteIndex
	AND	#%00001111	; Get low nibble for P0 index
	TAY			; Move it to Y for calculations
	LDA	P0SpritePointer

CalculateP0PointerIndex
	; You can only have the maximum number of sprites 256/height that is always smaller than16
	; (over 16 px height, you cannot use all 16 indexes because of the paging overflow that would break timing.

	CPY	#0
	BEQ	CalculateP0PointerIndexDone
	CLC	
	ADC	P0Height
	DEY

	JMP	CalculateP0PointerIndex	
	
CalculateP0PointerIndexDone
	STA	temp07	; temp07 will store the sprite pointers low byte

	LDA	P0Y
	STA	temp09 	; temp09 stores P0 Y position.

	STA	WSYNC
SettingUpP1SpriteAndMissile1
	LDA	P1Settings
	STA	REFP1
	AND	#%00110111
	STA	NUSIZ1	; Sets P1 and M1 registers

	LDA	P1SpritePointer+1	; temp13 will store the sprite pointers high byte
	STA	temp12+1

	LDA	P1SpriteIndex
	AND	#%11110000	; Get high nibble for P1 index

	TAY			; Move it to Y for calculations
	LDA	P1SpritePointer

CalculateP1PointerIndex
	; You can only have the maximum number of sprites 256/height that is always smaller than16
	; (over 16 px height, you cannot use all 16 indexes because of the paging overflow that would break timing.

	CPY	#0
	BEQ	CalculateP1PointerIndexDone
	CLC	
	ADC	P1Height
	DEY

	JMP	CalculateP1PointerIndex
CalculateP1PointerIndexDone

	STA	temp12	; temp07 will store the sprite pointers low byte

	LDA	P1Y
	STA	temp14 	; temp14 stores P1 Y position.

WaitUntilVBlankTimerEnds
	CLC
	LDA 	INTIM
	BMI 	WaitUntilVBlankTimerEnds

    	LDA	#NTSCtimer
    	STA	TIM64T

	; TSX	
	; STX	item		; save the stack pointer


	BIT	pfLines 	; NoGameMode
	BPL	NoGameSkip	; if 7th bit set (for a title or game over screen), the main game section is skipped.	
	LDX	#0	
	JMP	ResetAll
NoGameSkip


	
SetHorPositionForP0
	LDA	P0X
	LDX	#0		; x = 0 means p0

	JSR	GetXPoz
	STA 	WSYNC

SetHorPositionForP1
	LDA	P1X
	LDX	#1		; x = 1 means p1

	JSR	GetXPoz
	STA 	WSYNC

SetHMOVE
	STA	HMOVE

FinishPreparation
	LDA	pfLines
	AND	#%00001111
	TAX
	LDA	#0

	STX	temp03
MultiLoop
	CPX	#0
	BEQ	MultiplyDone	
	CLC
	ADC	#14
	DEX	
	JMP	MultiLoop
MultiplyDone
	STA	temp01
	TAX	; Line countdown

	TAY			
	
	DEY	
	LDA	(pfColorPointer),y
	CLC
	ADC	pfBaseColor 
	STA	temp02		; savePFColor

	LDA	#14	
	CLC
	ADC	pfIndex
	STA	temp01		; Save pfIndex

	LDY 	P0Height 		
	DEY
	LDA	(P0ColorPointer),y	
	STA	COLUP0		; Save P0Color for static
	

	STA	WSYNC

	LDA	pfLines		; 3 
	AND	#%00000011	; 2 
	STA	temp03		; 3 

	sleep 	15

	LDY	temp01

	LDA	(pf0Pointer),y	
	STA	temp05		
	asl
	asl
	asl
	asl
	STA	temp06

	LDA	(pf1Pointer),y	
	STA	PF1		
	LDA	(pf2Pointer),y	
	STA	PF2		

	LDA	pfFixColor
	BIT	pfSettings		
	BPL	saveFixToBK
	STA	COLUPF	
	LDY	#0	
	JMP	savedFixToPF
saveFixToBK
	sleep	3
	STA	COLUBK	
savedFixToPF
	LDA	temp05		
	STA	PF0		

	JMP	StartWithoutWSYNC

.NoP0DrawNow
	LDA	#0		
	JMP	saveP0Sprite

.NoP1DrawNow
	LDA	#0		
	JMP	saveP1Sprite

.NoP0ColorNow
	LDA	#0		
	JMP	saveP0Color


saveToBK
	STA	COLUBK
	JMP	savedToBK

DrawingTheScreen
	; temp01 = pfIndex
	; temp02 = pfColor
	; temp03 = Number of additional lines
	; temp05 = P0 / 1
	; temp06 = P0 / 2
	; temp07, temp08 = P0 sprite pointers
	; temp09 = p0 Y
	; temp10 = temperary storage of new pf1
	; temp11 = counter to delay pf change
	; temp12 = p1 / 1
	; temp13 = p1 / 2
	; temp14 = p1height


FirstLine
	STA	WSYNC		; 3 (76)
StartWithoutWSYNC
	LDA	temp02		; 3 	
	BIT	pfSettings		; 3 (6)
	BMI	saveToBK	; 2 (8)
	STA	COLUPF		; 3 (11)
	sleep 	3		; 3 (14)
savedToBK
	LDA	temp05		; 3 (17)
	STA	PF0		; 3 (22)

	LDA	temp06		; 3 (25)
	STA	PF0		; 3 (28)

	LDA 	P0Height 		; 3 (31)
	DCP	temp09 		;  temp09 contains P0Y!  ; 5 (36)
	BCC	.NoP0DrawNow	; 2 (38)
	LDY	temp09		; 3 (41)
	LDA	(temp07),y	; 5 (46)
saveP0Sprite
	STA	GRP0		; 3 (49) ;

	LDA 	P1Height 		; 3 (31)
	DCP	temp14 		;  temp09 contains P0Y!  ; 5 (36)
	BCC	.NoP1DrawNow	; 2 (38)
	LDY	temp14		; 3 (41)
	LDA	(temp12),y	; 5 (46)
saveP1Sprite
	STA	GRP1		; 3 (49) ;

FillerLines	
	STA	WSYNC		; 3 (76)
	LDA	temp03		; 3
	CMP	#3		; 2 (5)
	BEQ	MoveOn		; 2 (7)
	LDA	temp05		; 3 (10)
	STA	PF0		; 3 (13)
	INC	temp03		; 5 (18)

	LDA 	P0Height 		; 3 (21)
	CMP	temp09 		;  temp09 contains P0Y!  ; 3 (24)
	BCC	.NoP0ColorNow	; 2 (26)
	LDY	temp09		; 3 (29)
	DEY			; 2 (31)
	LDA	(P0ColorPointer),y	; 5 (36)
saveP0Color
	STA	COLUP0		; 3 (39) ;

	LDA	temp06		; 3 (42)
	STA	PF0		; 3 (45)
	

	JMP	FillerLines		; 3 (73)


MoveOn
	; 7	
	LDA	temp05		; 3 (10)
	STA	PF0		; 3 (13)
	TXA			; 2 (15)
	lsr			; 2 (17)
	lsr			; 2 (19)
	TAY			; 2 (21)

	LDA	(pfColorPointer),y	; 6 (27) 
	CLC			; 2 (29)
	ADC	pfBaseColor 	; 3 (32)
	STA	temp02		; 3 (35)
	LDA	temp06		; 3 (38)
	STA	PF0		; 3 (41)
	
	sleep 	4		; 46

	INC	temp11		; 5 (51)
	LDA	pfLines		; 3 (54)
	AND	#%00000011	; 2 (56)
	STA	temp03		; 3 (59)

	CMP	temp11		; 2 (61)
	BNE	LastLine		; 2 (63)
	dec 	temp01		; 5 (68)
	LDA	#0		; 2 (70)
	STA	temp11		; 3 (73)
LastLine

	

	STA	WSYNC
	DEX			; 2
	LDA	temp05		; 3 (5)
	STA	PF0		; 3 (8)	

	LDY	temp01		; 3 (11)
	LDA	(pf1Pointer),y	; 6 (17)
	STA	temp10		; 3 (20) ; storing for next line

	sleep 	8

	LDA	temp06		; 3 (31)
	STA	PF0		; 3 (34)

	LDA	(pf0Pointer),y	; 6 (40)
	STA	temp05		; 3 (43)
	asl			; 2 (45)
	asl			; 2 (47)
	asl			; 2 (49)
	asl			; 2 (51)
	STA	temp06		; 3 (54)

	LDA	(pf2Pointer),y	; 6 (60)
	STA	PF2		; 3 (63)

	LDA	temp10		; 3 (66)

	CPX	#0		; 2 (68)
	BEQ	ResetAll		; 2 (70)
	STA	PF1		; 3 (73)

	JMP	StartWithoutWSYNC; 3 (76)

ResetAll
	STX	WSYNC
	LDA	frameColor
	STA 	COLUBK
	STX 	COLUPF

	STX	PF1
	STX	PF2
	STX 	COLUBK

	STX	VDELP0
	STX	VDELP1
	STX	VDELBL
	STX	GRP0
	STX	GRP1
	; LDX	item		; Retrieve the stack pointer
	; TXS


WaitForScreenCounterEnd
	CLC
        	LDA	INTIM 
        	BNE 	WaitForScreenCounterEnd

	LDA	#%11000010
	STA	VBLANK
	STA	WSYNC

    	LDA	#230
    	STA	TIM64T

OverScan
	INC	counter
	LDA	counter
	AND	#%00111111
	CMP	#%00111111
	BNE	NOINC

	LDA	pfIndex
	CMP	#24
	BCS	NOINC
	INC 	pfIndex
NOINC
	LDA	counter
	STA	COLUP1
	AND	#%00000111
	CMP	#%00000111
	BNE	.Sprite0IndexSetDone


	

.animateP0Sprite
    	LDA	P0SpriteIndex
	AND	#%00001111
     	CMP	#3
    	BNE	.NotEQ3
    	AND 	#%11110000
    	STA	P0SpriteIndex
    	jmp	.Sprite0IndexSetDone
.NotEQ3
	CLC
	ADC	#1
	STA	temp01
	LDA	P0SpriteIndex
	AND	#%11110000
	ORA	temp01
	STA	P0SpriteIndex
	
    	
.Sprite0IndexSetDone

	LDA	counter
	AND	#%10000000
	CMP	#%10000000
	BNE	AdvanceColorBG
AdvanceColorPF
	LDA	#<Castle_Color
	STA 	pfColorPointer 
	LDA	#>Castle_Color
	STA 	pfColorPointer+1

	LDA	#0
	STA	pfBaseColor

	LDA	#$1a
	STA	pfFixColor

	LDA	pfSettings
	AND	#%01111111
	STA	pfSettings

	JMP	EndColoring


AdvanceColorBG
	LDA	#<Castle_Background
	STA 	pfColorPointer 
	LDA	#>Castle_Background
	STA 	pfColorPointer+1

	LDA	#0
	STA	pfBaseColor

	LDA	#$04
	STA	pfFixColor

	LDA	pfSettings
	ORA	#%10000000
	STA	pfSettings

EndColoring
MoveP0
	LDA	P0Settings
	AND #%00001000	
	CMP	#%00001000
	BEQ	FlyRight
	LDA	P0X
	CMP	#134
   	BCS	TurnRight
     	INC	P0X
   	jmp	MovedP0
TurnRight
   	LDA	P0Settings
   	ORA	#8
   	STA	P0Settings
   	jmp	MovedP0
FlyRight
   	LDA	#0
   	CMP	P0X
  	BCS	TurnLeft
   	DEC	P0X
	JMP	MovedP0
TurnLeft
  	LDA	P0Settings
   	AND	#247
   	STA	P0Settings  

MovedP0


OverScanEnd
	JMP	ScreenLoop
GetXPoz
	STA	WSYNC	
	SEC			;2 
DivideLoopX
	SBC	#15		; 2 (4)
	BCS	DivideLoopX	; 3 (7)
	EOR	#7		; 2 (9)
	asl			; 2 (11)
	asl			; 2 (13)
	asl			; 2 (15)
	asl			; 2 (17)
	STA	HMP0,x		; 4 (21)	0: p0, 1: p1, 2: m0, 3: m1, 4: ball
	STA	RESP0,x		; 4 (25)
	rts			; 6 (31)

Zero
Null
None
	.BYTE	#0	; This is an empty byte for constant code usage.
	align 256
Data_Section

Castle_01
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
	BYTE %00000000	; 40


Castle_02
	BYTE %11111100
	BYTE %00111111
	BYTE %00111111
	BYTE %00111111
	BYTE %00111111
	BYTE %00111111
	BYTE %00111110
	BYTE %00111110
	BYTE %01111110
	BYTE %01111110
	BYTE %01111110
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
	BYTE %00000000	;80

Blank	
	.BYTE #%00000000
	.BYTE #%00000000
	.BYTE #%00000000
	.BYTE #%00000000
	.BYTE #%00000000
	.BYTE #%00000000
	.BYTE #%00000000
	.BYTE #%00000000
	.BYTE #%00000000
	.BYTE #%00000000
	.BYTE #%00000000
	.BYTE #%00000000
	.BYTE #%00000000
	.BYTE #%00000000
	.BYTE #%00000000
	.BYTE #%00000000
	.BYTE #%00000000
	.BYTE #%00000000
	.BYTE #%00000000
	.BYTE #%00000000
	.BYTE #%00000000
	.BYTE #%00000000
	.BYTE #%00000000
	.BYTE #%00000000
	.BYTE #%00000000
	.BYTE #%00000000
	.BYTE #%00000000
	.BYTE #%00000000
	.BYTE #%00000000
	.BYTE #%00000000
	.BYTE #%00000000
	.BYTE #%00000000
	.BYTE #%00000000
	.BYTE #%00000000
	.BYTE #%00000000
	.BYTE #%00000000
	.BYTE #%00000000
	.BYTE #%00000000
	.BYTE #%00000000
	.BYTE #%00000000	;120

Mountain
	BYTE %11111111
	BYTE %11111111
	BYTE %11111111
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
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000
	BYTE %00000000	; 160

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
	BYTE	$04	; 174


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
	BYTE	$46	; 188

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
 	.byte %00000000	; 1 (200)
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
 	.byte %00000000	; 2 (212)
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
 	.byte %00000000	;4 (224)
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


	align 256

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
	.byte #$84	; 12

UFO
 	.byte #%00111100
 	.byte #%01111110
 	.byte #%11111111
 	.byte #%10110110
 	.byte #%11111111
 	.byte #%01011010
 	.byte #%00100100
 	.byte #%00011000
 	.byte #%00111100	; 2 (20)
 	.byte #%01111110
 	.byte #%11111111
 	.byte #%01101101
 	.byte #%11111111
 	.byte #%01011010
 	.byte #%00100100
 	.byte #%00011000
 	.byte #%00111100	; 3 (28)
 	.byte #%01111110
 	.byte #%11111111
 	.byte #%11011011
 	.byte #%11111111
 	.byte #%01011010
 	.byte #%00100100
 	.byte #%00011000	; 4 (36)

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

	lda	#>(StartTheROM-1)
   	pha
   	lda	#<(StartTheROM-1)
   	pha
   	pha
   	pha
   	ldx	#1
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