 	set romsize 64kSC
	set kernel_options no_blank_lines pfcolors background
	set optimization speed
      	set optimization inlinerand
 	set smartbranching on
 	set tv ntsc
	const pfres=23
	const pfrowheight=3
	const playerscores=2
	playfieldpos=3
_startagain
	asm
	lda	#0
	sta	a
	sta	b
	sta	c
	sta	d
	sta	e
	sta	f
	sta	g
	sta	h
	sta	i
	sta	j
	sta	k
	sta	l
	sta	m
	sta	n
	sta	o
	sta	p
	sta	q
	sta	r
	sta	s
	sta	t
	sta	u
	sta	v
	sta	w
	sta	y
	sta	z
	sta	AUDV0
	sta	AUDV1
	sta	AUDF0
	sta	AUDF1



	sta	w000
	sta	w001
	sta	w002
	sta	w003
	sta	w004
	sta	w005
	sta	w006
	sta	w007
	sta	w008
	sta	w009
	sta	w010
	sta	w011
	sta	w012
	sta	w013
	sta	w014
	sta	w015
	sta	w016
	sta	w017
	sta	w018
	sta	w019
	sta	w020
	sta	w021
	sta	w022
	sta	w023
	sta	w024
	sta	w025
	sta	w026
	sta	w027
	sta	w028
	sta	w029
	sta	w030
	sta	w031
	sta	w032
	sta	w033
	sta	w034
	sta	w035
	sta	w036
	sta	w037
	sta	w038
	sta	w039
	sta	w040
	sta	w041
	sta	w042
	sta	w043
	sta	w044
	sta	w045
	sta	w046
	sta	w047
	sta	w048
	sta	w049
	sta	w050
	sta	w051
	sta	w052
	sta	w053
	sta	w054
	sta	w055
	sta	w056
	sta	w057
	sta	w058
	sta	w059
	sta	w060
	sta	w061
	sta	w062
	sta	w063
	sta	w064
	sta	w065
	sta	w066
	sta	w067
	sta	w068
	sta	w069
	sta	w070
	sta	w071
	sta	w072
	sta	w073
	sta	w074
	sta	w075
	sta	w076
	sta	w077
	sta	w078
	sta	w079
	sta	w080
	sta	w081
	sta	w082
	sta	w083
	sta	w084
	sta	w085
	sta	w086
	sta	w087
	sta	w088
	sta	w089
	sta	w090
	sta	w091
	sta	w092
	sta	w093
	sta	w094
	sta	w095
	sta	w096
	sta	w097
	sta	w098
	sta	w099
	sta	w100
	sta	w101
	sta	w102
	sta	w103
	sta	w104
	sta	w105
	sta	w106
	sta	w107
	sta	w108
	sta	w109
	sta	w110
	sta	w111
	sta	w112
	sta	w113
	sta	w114
	sta	w115
	sta	w116
	sta	w117
	sta	w118
	sta	w119
	sta	w120
	sta	w121
	sta	w122
	sta	w123
	sta	w124
	sta	w125
	sta	w126
	sta	w127
end
Title_Var
	dim Channel_1Counter=a
	dim Channel_1Duration=c
	dim Channel_2Counter=w
	dim Channel_2Duration=z

	dim Space_Before = d
	dim titlescreencolor = e
	dim magassag1= f
	dim magassag2= g
	dim kezdet = h
	dim magassag3 = i
	dim counter= j
	dim Color1= k
	dim Color2= l
	dim Color3= m
	dim Segment=n
	dim TextColor=t

MainMenu_Var
	dim BaseColor=var0
	dim Selected=q
	dim magassag_end=r
	dim Add=s
	dim magassag2_end=u
	dim ShitColor=y
NotGreat_Var
	dim SoundPointer=c

Game_All_Vairables
	dim temp8=var2
	dim temp9=var3
	dim temp10=var4
	dim temp11=var5
	dim temp12=var6
	dim temp13=var35
	dim temp14=var36
	dim temp15=var37

	dim DroneFrekv=var23
	dim DroneWait=var25
	dim GeigerFade = var26
	dim RadCentX = var27
	dim RadCentY = var28

	dim GeigerCount = var29
Game_2_Variables

	dim Level=var0
	dim Sound=var7
	dim ChopSpeed=var8
	dim SpriteNumber=var9
	dim Chopter_X=var10
	dim ChopVSpeed=var11
	dim ChopDelayH=var14
	dim ChopDelayV=var13
	dim RopeValue=var18
	dim RopeMax=var19
	dim RopeMaxTemp=var20
	dim FireLevel=var21
	dim FireSprite=var22
	dim BallDirection=var30
	 dim BallPower=var31
	dim BallTempPower=var32
	dim BallTempDirection=var33
	dim FireLoop=var34

Game_3_Variables
	dim LightLooper=var7
	dim WaterLevel=var8
	dim GeigerCenter_X=var10
	dim GeigerCenter_Y=var11
	dim BuvarSprite=var13
	dim BuvarLives=var14
	dim Hardness=var19
	dim FallingMeter=var21
	dim PlaceOfDoor=var20
	dim GearX=var22
	dim GearY=var30
	dim StartPoz=var31
	dim SwimPower=var32
	dim GearSprite=var33

Game_4_Variables
	dim PFIndex=var7
	dim MadnessLevel=var8
	dim BoySprite=var10
	dim Scroller=var9
	dim AUD1Sound=var11
	dim FireDelay=var13
	dim Difficulty=var14
	dim EnemySprite = var17
	dim DeathCounter = var19
	dim MadTouch= var20

Game_5_Variables

	dim SoldierLeft=var9
	dim SoundEffect=var10
	dim TicTic=var11
	dim SoundFade=var13
	dim SoundWait=var14
	dim Haaard=var18

	dim Oszlop = var20
	dim OszlopMax = var21
	dim Sor= var22 
	dim SorMax= var23
	dim Volumer=var24

	dim SoldierSprite=var25
	dim PosX=var26
	dim PosY=var24
	dim SSS=var27
	dim Remain=var30
	dim ExtraLife=var29
	dim ForScore=var31

Game_0_Variables
	dim ReactorLoop=var9
	dim ReactorSpeed=var10
	dim Particles=var11
	dim Performance1=score
	dim Performance2=score+1
	dim Performance3=score+2
	dim ReactorCounter=var13
	dim WaterL = var24
	dim Score3IconPointer = a
	dim Score4IconPointer = c
	dim Score5IconPointer = j
	dim Score6IconPointer = l
	dim ColorPointer = e
	dim Rudak= var35
	dim Temperature=z
	dim SlowCounter =w

MiniVariables1
	dim Score1=var12	
	dim Score2=var17
	dim Score1IconPointer=lifepointer
	dim Score2IconPointer=var37
	dim ScoreColor=statusbarlength
	 ; var1{0}=1: Selected=2: goto DoShit  bank5
	 ; goto GameOver bank14


	magassag1=1
	magassag2=1
	kezdet=22

	Color1=$00
	Color2=$00
	Color3=$00
	counter=0
	Segment=0
	titlescreencolor=$00
	scorecolor=0
	BaseColor=$00	
	magassag_end=0
	Selected=3
	Add=$00
	TextColor=$00
	ShitColor=$00
	AUDV0=0: AUDV1=0
	
	goto RestartMusic_1
Title_Overscan_Code
	counter=counter+1

	
	on Segment goto Segment0 Segment1 Segment2 Segment3 Segment4 MainMenu
Segment0	
	if counter=4 then Color2=Color2+$01
	if counter=5 then counter=0
	if Color2=$0e then Segment=Segment+1: counter=0: Color1=$40: Color3=$8a: p{0} = 0
	goto SetHeight

Segment1
	if kezdet>0 && counter=3 then kezdet=kezdet-1
	if kezdet=0 then Segment=Segment+1: counter=0
	
	
	if counter=3 then counter=0
	goto ColorChange
Segment2
	if counter=3 then counter=0
	if joy0fire || switchreset then Segment=Segment+1: counter=0
	goto ColorChange
Segment3
	if counter=4 then counter=0 else goto SetHeight
	if Color1>$40 then Color1=Color1-$01 else Color1=$00
	if Color2>$00 then Color2=Color2-$01 else Segment=Segment+1: kezdet=23: magassag3=1: Add=$0c: Selected=0: TextColor=$30
	if Color3>$80 then Color3=Color3-$01 else Color3=$00
	if kezdet<22 then  kezdet=kezdet+2
	
	goto SetHeight

ColorChange
	if counter>0 then goto SetHeight
	if Color1<$41 then p{0}=0
	if Color1>$49 then p{0}=1
	if !p{0} then Color1=Color1+$01: Color3=Color3-$01 else Color1=Color1-$01: Color3=Color3+$01
SetHeight
	magassag3=48-kezdet
	Space_Before=88-magassag3
	Space_Before=Space_Before+kezdet

	goto GoSuber

Segment4
	Space_Before=20
	if Add>$00 then Add=Add-$01: titlescreencolor=titlescreencolor+$01 else Segment=Segment+1: p{0}=0: p{1}=0: p{2} =0: p{3} =0 : p{4} =0 : TextColor=$1a: goto MainMenu
	p{1}=!p{1}
	if p{1} then TextColor=TextColor+$01
	magassag1=243
	magassag_end=magassag1-44
	magassag2=81
	magassag2_end=magassag2-17

	goto GoSuber

MainMenu
	Space_Before=20: var1{0}=0
	if p{3} then goto ExitMenu 
	if joy0down && !p{0} && !p{1} then p{0} =1
	if switchselect && !p{0} && !p{1} && Selected<4 then p{0} =1
	if switchselect && !p{0} && !p{1} && Selected=4 then p{1} =1 : p{2} =1 
	if joy0up && !p{0} && !p{1} then p{1} =1
	if joy0fire && !p{0} && !p{1} then p{3} =1 : counter=0: BaseColor=$00: goto ExitMenu 
	if switchreset && !p{0} && !p{1} then p{3} =1 : counter=0: goto ExitMenu 

	if Selected>3 || !p{0} then goto NoDown
	magassag2=magassag2-1: TextColor=TextColor-$02
	if Add<titlescreencolor then Add=Add+$01

	if magassag2>80 then Selected=0: TextColor=$dc: goto NoUp
	if magassag2=67 then Selected=1: TextColor=$a6: goto NoUp
	if magassag2=52 then Selected=2: TextColor=$48: goto NoUp
	if magassag2=35 then Selected=3: TextColor=$8a: goto NoUp
	if magassag2<18 then Selected=4: TextColor=$1a: goto NoUp

	goto Retek

NoDown

	if Selected=0 || !p{1} then goto NoUp
	magassag2=magassag2+1: TextColor=TextColor+$02
	if p{2} && magassag2<79 then magassag2=magassag2+1: TextColor=TextColor+$02
	if Add<titlescreencolor then Add=Add+$01
	if magassag2>80 then Selected=0: TextColor=$dc: goto NoUp
	if magassag2=67 && !p{2}  then Selected=1: TextColor=$a6: goto NoUp
	if magassag2=52 && !p{2}  then Selected=2: TextColor=$48: goto NoUp
	if magassag2=35 && !p{2}  then Selected=3: TextColor=$8a: goto NoUp
	if magassag2<18 && !p{2}  then Selected=4: TextColor=$1a: goto NoUp

	goto Retek
NoUp
	p{0} = 0
	p{1} = 0 
	p{2} = 0 
	if Add>$00 then Add=Add-$01
	if Selected=0 then magassag1=243
	if Selected=1 then magassag1=193
	if Selected=2 then magassag1=142
	if Selected=3 then magassag1=90
	if Selected=4 then magassag1=44


	magassag_end=magassag1-44

Retek
	magassag2_end=magassag2-17

	goto GoSuber

ExitMenu
	BaseColor=$00

	if counter=66 then counter=0 : titlescreencolor=$1e: TextColor=$1e: ShitColor=$00: p{4} =1
	
	if p{4} then goto ExitPart2 
	titlescreencolor=titlescreencolor+$07: TextColor=$00: ShitColor=titlescreencolor
	AUDV0=titlescreencolor: AUDV1=titlescreencolor+$05: AUDC0=$02: AUDC1=$03: AUDF0=titlescreencolor: AUDF1=$40-titlescreencolor

	goto WAH
ExitPart2
	AUDV0=titlescreencolor-10: AUDV1=titlescreencolor-10
	AUDC0=2: AUDC1=3: AUDF0=25-titlescreencolor: AUDF1=30-titlescreencolor
	if counter>2 then counter=0 else goto GoSuber

	if titlescreencolor>$10 then titlescreencolor=titlescreencolor-$01: TextColor=TextColor-$01 else goto Not_Great bank4
WAH
	gosub Screen_Part1 bank2
	goto Title_Overscan_Code

GoSuber
	gosub Screen_Part1 bank2
	goto Music_Player
	asm
.RestartMusic_1
	LDA	#1

	STA	Channel_2Duration
	STA	Channel_1Duration
	LDA	#<.MusicChannel_1
	STA	Channel_1Counter
	LDA	#>.MusicChannel_1
	STA	Channel_1Counter+1

	LDA	#<.MusicChannel_2
	STA	Channel_2Counter
	LDA	#>.MusicChannel_2
	STA	Channel_2Counter+1

.Music_Player
.LoadNext1
	DEC	Channel_1Duration
	LDA	Channel_1Duration
	BNE	.LoadNext2
	LDX	#Channel_1Counter
	LDA	(0,x)
	INC	0,x
	BNE	*+4
	INC	1,x
	CMP	#255
	BNE	.Not255_1
	LDA	#<.MusicChannel_1
	STA	Channel_1Counter
	LDA	#>.MusicChannel_1
	STA	Channel_1Counter+1
	LDX	#Channel_1Counter
	LDA	(0,x)
	INC	0,x
	BNE	*+4
	INC	1,x
.Not255_1
	STA	AUDV0
	CMP	#0
	BEQ	.GotoDuration1
	lsr
	lsr
	lsr
	lsr
	STA	AUDC0
	LDX	#Channel_1Counter
	LDA	(0,x)
	INC	0,x
	BNE	*+4
	INC	1,x
	STA	AUDF0
.GotoDuration1
	LDX	#Channel_1Counter
	LDA	(0,x)
	INC	0,x
	BNE	*+4
	INC	1,x
	STA	Channel_1Duration
.LoadNext2
	DEC	Channel_2Duration
	LDA	Channel_2Duration
	BNE	.LoadNext3_0
	LDX	#Channel_2Counter
	LDA	(0,x)
	INC	0,x
	BNE	*+4
	INC	1,x
	CMP	#255
	BNE	.Not255_2
	LDA	#<.MusicChannel_2
	STA	Channel_2Counter
	LDA	#>.MusicChannel_2
	STA	Channel_2Counter+1
	LDX	#Channel_2Counter
	LDA	(0,x)
	INC	0,x
	BNE	*+4
	INC	1,x
.Not255_2
	STA	AUDV1
	CMP	#0
	BEQ	.GotoDuration2
	lsr
	lsr
	lsr
	lsr
	STA	AUDC1
	LDX	#Channel_2Counter
	LDA	(0,x)
	INC	0,x
	BNE	*+4
	INC	1,x
	STA	AUDF1
.GotoDuration2
	LDX	#Channel_2Counter
	LDA	(0,x)
	INC	0,x
	BNE	*+4
	INC	1,x
	STA	Channel_2Duration
.LoadNext3_0

	JMP	.Title_Overscan_Code
.MusicChannel_1
	.BYTE	#%11001010
	.BYTE	#17
	.BYTE	#23
	.BYTE	#%11001000
	.BYTE	#14
	.BYTE	#23
	.BYTE	#%11001010
	.BYTE	#11
	.BYTE	#23
	.BYTE	#%11001000
	.BYTE	#14
	.BYTE	#23
	.BYTE	#%11001010
	.BYTE	#12
	.BYTE	#46
	.BYTE	#%11001010
	.BYTE	#14
	.BYTE	#23
	.BYTE	#%11001000
	.BYTE	#15
	.BYTE	#23
	.BYTE	#%11001010
	.BYTE	#11
	.BYTE	#46
	.BYTE	#%11001010
	.BYTE	#12
	.BYTE	#45
	.BYTE	#%11001010
	.BYTE	#17
	.BYTE	#69
	.BYTE	#0
	.BYTE	#22
	.BYTE	#%11001010
	.BYTE	#14
	.BYTE	#23
	.BYTE	#%11001000
	.BYTE	#11
	.BYTE	#23
	.BYTE	#%01001010
	.BYTE	#29
	.BYTE	#23
	.BYTE	#%01001000
	.BYTE	#29
	.BYTE	#23
	.BYTE	#%01001010
	.BYTE	#26
	.BYTE	#46
	.BYTE	#%01001010
	.BYTE	#29
	.BYTE	#23
	.BYTE	#%11001000
	.BYTE	#10
	.BYTE	#23
	.BYTE	#%11001010
	.BYTE	#11
	.BYTE	#92
	.BYTE	#%01001010
	.BYTE	#31
	.BYTE	#46
	.BYTE	#%01001010
	.BYTE	#27
	.BYTE	#46
	.BYTE	#%01001010
	.BYTE	#23
	.BYTE	#23
	.BYTE	#%01001000
	.BYTE	#26
	.BYTE	#23
	.BYTE	#%11001010
	.BYTE	#11
	.BYTE	#45
	.BYTE	#0
	.BYTE	#22
	.BYTE	#%11001000
	.BYTE	#14
	.BYTE	#23
	.BYTE	#%11001010
	.BYTE	#15
	.BYTE	#23
	.BYTE	#%11001000
	.BYTE	#17
	.BYTE	#23
	.BYTE	#%11001010
	.BYTE	#11
	.BYTE	#23
	.BYTE	#%11001000
	.BYTE	#12
	.BYTE	#23
	.BYTE	#%11001010
	.BYTE	#10
	.BYTE	#69
	.BYTE	#0
	.BYTE	#23
	.BYTE	#%01001010
	.BYTE	#29
	.BYTE	#23
	.BYTE	#%11001000
	.BYTE	#10
	.BYTE	#23
	.BYTE	#%11001010
	.BYTE	#11
	.BYTE	#46
	.BYTE	#%11001010
	.BYTE	#12
	.BYTE	#23
	.BYTE	#%11001000
	.BYTE	#14
	.BYTE	#23
	.BYTE	#%11001010
	.BYTE	#11
	.BYTE	#46
	.BYTE	#%11001010
	.BYTE	#12
	.BYTE	#46
	.BYTE	#%11001010
	.BYTE	#17
	.BYTE	#91
	.BYTE	#%01001010
	.BYTE	#31
	.BYTE	#46
	.BYTE	#%01001010
	.BYTE	#27
	.BYTE	#46
	.BYTE	#%01001010
	.BYTE	#23
	.BYTE	#23
	.BYTE	#%01001000
	.BYTE	#26
	.BYTE	#23
	.BYTE	#%11001010
	.BYTE	#11
	.BYTE	#46
	.BYTE	#0
	.BYTE	#22
	.BYTE	#%11001000
	.BYTE	#14
	.BYTE	#23
	.BYTE	#%11001010
	.BYTE	#15
	.BYTE	#23
	.BYTE	#%11001000
	.BYTE	#17
	.BYTE	#23
	.BYTE	#%11001010
	.BYTE	#11
	.BYTE	#23
	.BYTE	#%11001000
	.BYTE	#12
	.BYTE	#23
	.BYTE	#%11001010
	.BYTE	#10
	.BYTE	#69
	.BYTE	#0
	.BYTE	#22
	.BYTE	#%01001010
	.BYTE	#29
	.BYTE	#23
	.BYTE	#%11001000
	.BYTE	#10
	.BYTE	#23
	.BYTE	#%11001010
	.BYTE	#11
	.BYTE	#46
	.BYTE	#%11001010
	.BYTE	#12
	.BYTE	#23
	.BYTE	#%11001000
	.BYTE	#14
	.BYTE	#23
	.BYTE	#%11001010
	.BYTE	#11
	.BYTE	#46
	.BYTE	#%11001010
	.BYTE	#12
	.BYTE	#46
	.BYTE	#%11001010
	.BYTE	#17
	.BYTE	#115
	.BYTE	#0
	.BYTE	#56
	.BYTE	#255
.MusicChannel_2
	.BYTE	#%00010100
	.BYTE	#28
	.BYTE	#11
	.BYTE	#0
	.BYTE	#12
	.BYTE	#%11001000
	.BYTE	#23
	.BYTE	#11
	.BYTE	#0
	.BYTE	#11
	.BYTE	#%00010100
	.BYTE	#28
	.BYTE	#12
	.BYTE	#0
	.BYTE	#11
	.BYTE	#%11001000
	.BYTE	#23
	.BYTE	#12
	.BYTE	#0
	.BYTE	#11
	.BYTE	#%00010100
	.BYTE	#19
	.BYTE	#12
	.BYTE	#0
	.BYTE	#11
	.BYTE	#%11001000
	.BYTE	#17
	.BYTE	#11
	.BYTE	#0
	.BYTE	#12
	.BYTE	#%00010100
	.BYTE	#19
	.BYTE	#11
	.BYTE	#0
	.BYTE	#12
	.BYTE	#%11001000
	.BYTE	#17
	.BYTE	#11
	.BYTE	#0
	.BYTE	#12
	.BYTE	#%00010100
	.BYTE	#18
	.BYTE	#11
	.BYTE	#0
	.BYTE	#12
	.BYTE	#%11001000
	.BYTE	#12
	.BYTE	#11
	.BYTE	#0
	.BYTE	#12
	.BYTE	#%00010100
	.BYTE	#18
	.BYTE	#11
	.BYTE	#0
	.BYTE	#12
	.BYTE	#%11001000
	.BYTE	#12
	.BYTE	#11
	.BYTE	#0
	.BYTE	#11
	.BYTE	#%00010100
	.BYTE	#28
	.BYTE	#12
	.BYTE	#0
	.BYTE	#11
	.BYTE	#%11001000
	.BYTE	#23
	.BYTE	#12
	.BYTE	#0
	.BYTE	#11
	.BYTE	#%00010100
	.BYTE	#28
	.BYTE	#12
	.BYTE	#0
	.BYTE	#11
	.BYTE	#%11001000
	.BYTE	#23
	.BYTE	#12
	.BYTE	#0
	.BYTE	#11
	.BYTE	#%00010100
	.BYTE	#23
	.BYTE	#12
	.BYTE	#0
	.BYTE	#11
	.BYTE	#%11001000
	.BYTE	#19
	.BYTE	#11
	.BYTE	#0
	.BYTE	#12
	.BYTE	#%00010100
	.BYTE	#23
	.BYTE	#11
	.BYTE	#0
	.BYTE	#12
	.BYTE	#%11001000
	.BYTE	#19
	.BYTE	#11
	.BYTE	#0
	.BYTE	#12
	.BYTE	#%00010100
	.BYTE	#19
	.BYTE	#11
	.BYTE	#0
	.BYTE	#12
	.BYTE	#%11001000
	.BYTE	#17
	.BYTE	#11
	.BYTE	#0
	.BYTE	#12
	.BYTE	#%00010100
	.BYTE	#31
	.BYTE	#11
	.BYTE	#0
	.BYTE	#12
	.BYTE	#%11001000
	.BYTE	#22
	.BYTE	#11
	.BYTE	#0
	.BYTE	#11
	.BYTE	#%00010100
	.BYTE	#23
	.BYTE	#12
	.BYTE	#0
	.BYTE	#11
	.BYTE	#%11001000
	.BYTE	#19
	.BYTE	#12
	.BYTE	#0
	.BYTE	#11
	.BYTE	#%00010100
	.BYTE	#23
	.BYTE	#12
	.BYTE	#0
	.BYTE	#11
	.BYTE	#%11001000
	.BYTE	#19
	.BYTE	#12
	.BYTE	#0
	.BYTE	#11
	.BYTE	#%00010100
	.BYTE	#25
	.BYTE	#12
	.BYTE	#0
	.BYTE	#11
	.BYTE	#%11001000
	.BYTE	#17
	.BYTE	#11
	.BYTE	#0
	.BYTE	#12
	.BYTE	#%00010100
	.BYTE	#25
	.BYTE	#11
	.BYTE	#0
	.BYTE	#12
	.BYTE	#%11001000
	.BYTE	#17
	.BYTE	#11
	.BYTE	#0
	.BYTE	#12
	.BYTE	#%00010100
	.BYTE	#28
	.BYTE	#11
	.BYTE	#0
	.BYTE	#12
	.BYTE	#%11001000
	.BYTE	#23
	.BYTE	#11
	.BYTE	#0
	.BYTE	#12
	.BYTE	#%00010100
	.BYTE	#28
	.BYTE	#11
	.BYTE	#0
	.BYTE	#12
	.BYTE	#%11001000
	.BYTE	#23
	.BYTE	#11
	.BYTE	#0
	.BYTE	#11
	.BYTE	#%00010100
	.BYTE	#28
	.BYTE	#12
	.BYTE	#0
	.BYTE	#11
	.BYTE	#%11001000
	.BYTE	#23
	.BYTE	#12
	.BYTE	#0
	.BYTE	#11
	.BYTE	#%00010100
	.BYTE	#28
	.BYTE	#12
	.BYTE	#0
	.BYTE	#11
	.BYTE	#%11001000
	.BYTE	#23
	.BYTE	#12
	.BYTE	#0
	.BYTE	#11
	.BYTE	#%00010100
	.BYTE	#19
	.BYTE	#12
	.BYTE	#0
	.BYTE	#11
	.BYTE	#%11001000
	.BYTE	#17
	.BYTE	#11
	.BYTE	#0
	.BYTE	#12
	.BYTE	#%00010100
	.BYTE	#19
	.BYTE	#11
	.BYTE	#0
	.BYTE	#12
	.BYTE	#%11001000
	.BYTE	#17
	.BYTE	#11
	.BYTE	#0
	.BYTE	#12
	.BYTE	#%00010100
	.BYTE	#19
	.BYTE	#11
	.BYTE	#0
	.BYTE	#12
	.BYTE	#%11001000
	.BYTE	#17
	.BYTE	#11
	.BYTE	#0
	.BYTE	#12
	.BYTE	#%00010100
	.BYTE	#19
	.BYTE	#11
	.BYTE	#0
	.BYTE	#12
	.BYTE	#%11001000
	.BYTE	#17
	.BYTE	#11
	.BYTE	#0
	.BYTE	#11
	.BYTE	#%00010100
	.BYTE	#28
	.BYTE	#12
	.BYTE	#0
	.BYTE	#11
	.BYTE	#%11001000
	.BYTE	#23
	.BYTE	#12
	.BYTE	#0
	.BYTE	#11
	.BYTE	#%00010100
	.BYTE	#28
	.BYTE	#12
	.BYTE	#0
	.BYTE	#11
	.BYTE	#%11001000
	.BYTE	#23
	.BYTE	#12
	.BYTE	#0
	.BYTE	#11
	.BYTE	#%00010100
	.BYTE	#25
	.BYTE	#12
	.BYTE	#0
	.BYTE	#11
	.BYTE	#%11001000
	.BYTE	#17
	.BYTE	#11
	.BYTE	#0
	.BYTE	#12
	.BYTE	#%00010100
	.BYTE	#18
	.BYTE	#11
	.BYTE	#0
	.BYTE	#12
	.BYTE	#%11001000
	.BYTE	#12
	.BYTE	#11
	.BYTE	#0
	.BYTE	#12
	.BYTE	#%00010100
	.BYTE	#28
	.BYTE	#11
	.BYTE	#0
	.BYTE	#12
	.BYTE	#%11001000
	.BYTE	#23
	.BYTE	#11
	.BYTE	#0
	.BYTE	#12
	.BYTE	#%00010100
	.BYTE	#28
	.BYTE	#11
	.BYTE	#0
	.BYTE	#12
	.BYTE	#%11001000
	.BYTE	#23
	.BYTE	#11
	.BYTE	#0
	.BYTE	#11
	.BYTE	#%00010100
	.BYTE	#25
	.BYTE	#12
	.BYTE	#0
	.BYTE	#11
	.BYTE	#%11001000
	.BYTE	#17
	.BYTE	#12
	.BYTE	#0
	.BYTE	#11
	.BYTE	#%00010100
	.BYTE	#25
	.BYTE	#12
	.BYTE	#0
	.BYTE	#11
	.BYTE	#%11001000
	.BYTE	#17
	.BYTE	#12
	.BYTE	#0
	.BYTE	#11
	.BYTE	#%00010100
	.BYTE	#28
	.BYTE	#12
	.BYTE	#0
	.BYTE	#11
	.BYTE	#%11001000
	.BYTE	#23
	.BYTE	#11
	.BYTE	#0
	.BYTE	#12
	.BYTE	#%00010100
	.BYTE	#28
	.BYTE	#11
	.BYTE	#0
	.BYTE	#12
	.BYTE	#%11001000
	.BYTE	#23
	.BYTE	#11
	.BYTE	#0
	.BYTE	#12
	.BYTE	#%00010100
	.BYTE	#28
	.BYTE	#11
	.BYTE	#0
	.BYTE	#12
	.BYTE	#%11001000
	.BYTE	#23
	.BYTE	#11
	.BYTE	#0
	.BYTE	#12
	.BYTE	#%00010100
	.BYTE	#28
	.BYTE	#11
	.BYTE	#0
	.BYTE	#12
	.BYTE	#%11001000
	.BYTE	#23
	.BYTE	#11
	.BYTE	#0
	.BYTE	#11
	.BYTE	#%00010100
	.BYTE	#19
	.BYTE	#12
	.BYTE	#0
	.BYTE	#11
	.BYTE	#%11001000
	.BYTE	#17
	.BYTE	#12
	.BYTE	#0
	.BYTE	#11
	.BYTE	#%00010100
	.BYTE	#19
	.BYTE	#12
	.BYTE	#0
	.BYTE	#11
	.BYTE	#%11001000
	.BYTE	#17
	.BYTE	#12
	.BYTE	#0
	.BYTE	#11
	.BYTE	#%00010100
	.BYTE	#19
	.BYTE	#12
	.BYTE	#0
	.BYTE	#11
	.BYTE	#%11001000
	.BYTE	#17
	.BYTE	#11
	.BYTE	#0
	.BYTE	#12
	.BYTE	#%00010100
	.BYTE	#19
	.BYTE	#11
	.BYTE	#0
	.BYTE	#12
	.BYTE	#%11001000
	.BYTE	#17
	.BYTE	#11
	.BYTE	#0
	.BYTE	#12
	.BYTE	#%00010100
	.BYTE	#28
	.BYTE	#11
	.BYTE	#0
	.BYTE	#12
	.BYTE	#%11001000
	.BYTE	#23
	.BYTE	#11
	.BYTE	#0
	.BYTE	#12
	.BYTE	#%00010100
	.BYTE	#28
	.BYTE	#11
	.BYTE	#0
	.BYTE	#12
	.BYTE	#%11001000
	.BYTE	#23
	.BYTE	#11
	.BYTE	#0
	.BYTE	#11
	.BYTE	#%00010100
	.BYTE	#25
	.BYTE	#12
	.BYTE	#0
	.BYTE	#11
	.BYTE	#%11001000
	.BYTE	#17
	.BYTE	#12
	.BYTE	#0
	.BYTE	#11
	.BYTE	#%00010100
	.BYTE	#18
	.BYTE	#12
	.BYTE	#0
	.BYTE	#11
	.BYTE	#%11001000
	.BYTE	#12
	.BYTE	#12
	.BYTE	#0
	.BYTE	#11
	.BYTE	#%00010100
	.BYTE	#28
	.BYTE	#12
	.BYTE	#0
	.BYTE	#11
	.BYTE	#%11001000
	.BYTE	#23
	.BYTE	#11
	.BYTE	#0
	.BYTE	#12
	.BYTE	#%00010100
	.BYTE	#28
	.BYTE	#11
	.BYTE	#0
	.BYTE	#12
	.BYTE	#%11001000
	.BYTE	#23
	.BYTE	#11
	.BYTE	#0
	.BYTE	#12
	.BYTE	#%00010100
	.BYTE	#28
	.BYTE	#11
	.BYTE	#0
	.BYTE	#12
	.BYTE	#%11001000
	.BYTE	#23
	.BYTE	#11
	.BYTE	#0
	.BYTE	#12
	.BYTE	#%00010100
	.BYTE	#28
	.BYTE	#11
	.BYTE	#0
	.BYTE	#12
	.BYTE	#%11001000
	.BYTE	#23
	.BYTE	#11
	.BYTE	#255
end


	

	bank 2 
Screen_Part1
 asm
 include "titlescreen/asm/titlescreen.asm"
end

DeadBuvar
	COLUP0=$00: bally=160: player1y=160: GeigerFade=0
	var24{0}=0 
	player0x=r008: player0y=r009
	asm
	LDA	BuvarSprite	
	CMP	#0
	BNE	.Dead2
end
Dead1
 	player0:
 	%01000010
 	%10100011
 	%00110101
 	%00011100
 	%01111100
 	%01111100
 	%01011100
 	%01111110
 	%01111111
 	%10111101
 	%10100011
 	%00011100
end
	goto Deads
Dead2
	asm
	CMP	#1
	BNE	.Dead3
end
 	player0:
 	%00000000
 	%01100110
 	%10111010
 	%00011000
 	%00111000
 	%01111100
 	%01010100
 	%01100110
 	%01010011
 	%00001000
 	%01000010
 	%10010001
end
	goto Deads
Dead3
	asm
	CMP	#2
	BNE	.Dead4
end
 	player0:
 	%00000000
 	%10000001
 	%00101000
 	%01011010
 	%00100000
 	%00001000
 	%01000010
 	%10010000
 	%00100100
 	%10000000
 	%00000001
 	%00100100
end
	goto Deads
Dead4
 	player0:
 	%00000000
 	%00010000
 	%00000000
 	%00000000
 	%01000010
 	%00000000
 	%00001000
 	%00000010
 	%00000000
 	%01000000
 	%00001000
 	%00000000
end


Deads
	if r017>0 then w017=r017-1 else w017=60: BuvarSprite=BuvarSprite+1
	AUDV1=0
	if r017>45 then AUDV0=r017-45: AUDF0=30-r017: AUDC0=2
	if BuvarSprite<4 then goto DDDD
	BuvarLives=BuvarLives-1
	AUDV0=0
	asm
	lda	#0
	sta	var1
	sta	var2
	sta	var3
	sta	var4
	sta	var5
	sta	var6
	sta	var7
	sta	var8
	sta	var9
	sta	var10
	sta	var11
	sta	var12
	sta	var13

	sta	var15
	sta	var16
	sta	var17
	sta	var18
	sta	var19
	sta	var20
	sta	var21
	sta	var22
	sta	var23
	sta	var24
	sta	var25
	sta	var26
	sta	var27
	sta	var28
	sta	var29
	sta	var30
	sta	var31
	sta	var32
	sta	var33
	sta	var34
	sta	var35
	sta	var36
	sta	var37
	sta	w000
	sta	w001
	sta	w002
	sta	w003
	sta	w004
	sta	w005
	sta	w006
	sta	w007
	sta	w010
	sta	w011
	sta	w012
	sta	w013
	sta	w014
	sta	w015
	sta	w016
	sta	w017
	sta	w018
	sta	w019
	sta	w020
	sta	w021
	sta	w022
	sta	w023
	sta	w024
	sta	w025
	sta	w026
	sta	w027
end
	if BuvarLives=0 then goto  GameOver bank14

	var1{0}=1
	pfcolors:
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$02
	$02
	$02
	$02
	$04
	$04
	$04
end
	temp8=0: temp9=0: temp10=0: GeigerCenter_X=0: GeigerCenter_Y=0: temp12=0: Hardness=0: player0y=160: bally=160: RadCentY=160
 	playfield:
 	X..............................X
 	X..............................X
 	X..............................X
 	X..............................X
 	X..............................X
 	X..............................X
 	X..............................X
 	X..............................X
 	X..............................X
	X..............................X
 	X..............................X
 	X..............................X
 	X..............................X
 	X..............................X
 	X..............................X
 	X..............................X
	X..............................X
 	X..............................X
 	X...............................
 	XXXXXXXXXXX.....................
 	XXXXXXXXXXXXXXXXX...............
 	XXXXXXXXXXXXXXXXXXXXXXX.........
 	XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 	XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
end
 	player1:
 	%00001110
 	%00001100
 	%00001100
 	%00011100
 	%01110110
 	%01110110
 	%01110110
 	%01111100
 	%00111110
 	%00011000
 	%00011110
 	%00001100
end
	asm

  	LDA	Score2
 	lsr
  	lsr
  	STA	ScoreColor
  	STA	scorecolor
end
	var15{3} = 0: player1x=21 
	if BuvarLives=1 then player1y=160 else player1y=57

	COLUP0=$00: COLUP1=$00

	asm
	LDA	#57
	STA	player0y
	STA	w009
end
	var15=0
	if BuvarLives=2 then player0x=37 else player0x=21
	w008=player0x
	goto GameLoop bank7
DDDD
	if r017>50 then gosub Redness bank8 else gosub Level0 bank8
	drawscreen
	goto DeadBuvar

BuvarComplete
	GeigerCenter_X=0: GeigerCenter_Y=0: temp12=0: GeigerCount=0: AUDV1=0: player0y=160: player1y=160: bally=160: RadCentY=160
	var24{0}=0 
	temp1=25-Hardness: if temp1>25 || temp1<5 then temp1=5
	temp1=temp1+Hardness*2
	if r014=temp1 then goto FillLamp
	temp1=Hardness
RRRRR
	dec score=score+10
	temp1=temp1-1
	if temp1>0 then goto RRRRR
	AUDV0=8: AUDC0=6: AUDF0=r014:  w014=r014+1
	drawscreen
	goto BuvarComplete
FillLamp
	if Score2<31 then AUDV0=8: AUDC0=1: AUDF0=31-Score2: Score2=Score2+1
	asm
  	LDA	Score2
 	lsr
  	lsr
  	STA	ScoreColor
  	STA	scorecolor
end
	if WaterLevel<10 then WaterLevel=WaterLevel+1: gosub SetWaterLevel bank8
	if Score2=31 then goto GenerateRoom bank8 
	drawscreen
	goto FillLamp
 	bank 3
Screen_Part2
 	asm
 	include "titlescreen/asm/titlescreen2.asm"

end
 	bank 4
	
Not_Great
	asm
	LDA	#2
	STA	VBLANK ; Turn off graphics display
	LDA	#0
	STA	AUDC0
	STA	AUDF0
	STA	AUDV0
	STA	AUDV1
ResetPointer
	LDA	#<WaveTable
	STA	SoundPointer
	LDA	#>WaveTable
	STA	SoundPointer+1 ; Reset Soundpointer
LoadSample
	LDX	#SoundPointer
	LDA	(0,x)
	CMP	#%10000000
	BEQ	VerticalSync
	INC	0,x
	BNE	*+4
	INC	1,x ; Load pointer, increase
	
	LDY	#11
DELAY1
	nop
	nop
	nop
	DEY
	BNE	DELAY1
	STA	AUDV0
	lsr
	lsr
	lsr
	lsr
	LDY	#12
DELAY2
	nop
	nop
	nop
	DEY
	BNE	DELAY2
	STA	AUDV0
	JMP	LoadSample
VerticalSync
end
	goto  Not_Great2 bank5
	asm
WaveTable
; Page 0
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%01111000
	.byte #%10001000
	.byte #%10011000
	.byte #%10011001
	.byte #%10001001
	.byte #%10001000
	.byte #%10001000
	.byte #%10011001
	.byte #%10011001
	.byte #%10011001
	.byte #%10011001
	.byte #%10011001
	.byte #%10011001
	.byte #%10011001
	.byte #%10011001
	.byte #%10011001
	.byte #%10011001
	.byte #%10101010
	.byte #%10011010
	.byte #%10011001
	.byte #%10011001
	.byte #%10011001
	.byte #%10001001
	.byte #%10001000
	.byte #%01110111
	.byte #%01110111
	.byte #%01100110
	.byte #%01100110
	.byte #%01010101
	.byte #%01010101
	.byte #%01100101
	.byte #%01100110
	.byte #%01100110
	.byte #%01100110
	.byte #%01100110
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01100111
	.byte #%01110111
	.byte #%10001000
	.byte #%10001000
	.byte #%01110111
	.byte #%01100110
	.byte #%01100110
	.byte #%01100110
	.byte #%01100110
	.byte #%01100111
	.byte #%01100110
	.byte #%01100110
	.byte #%01110111
	.byte #%10001000
	.byte #%10001000
	.byte #%10011001
	.byte #%10011001
	.byte #%10011001
	.byte #%10011001
	.byte #%10011001
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%01111000
	.byte #%10000111
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10011000
	.byte #%10001000
	.byte #%01110111
	.byte #%01110111
	.byte #%10000111
	.byte #%01111000
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%10001000
	.byte #%10001000
	.byte #%01111000
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01100111
	.byte #%01110110
	.byte #%10000111
	.byte #%10001000
	.byte #%01110111
	.byte #%10000111
	.byte #%10001000
	.byte #%10011001
	.byte #%10011001
	.byte #%10011000
	.byte #%10011001
	.byte #%10011001
	.byte #%10001001
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%10000111
	.byte #%10001000
	.byte #%01110111
	.byte #%01110111
	.byte #%01100110
	.byte #%01110111
	.byte #%01110111
	.byte #%01111000
	.byte #%01110111
	.byte #%10000111
	.byte #%10001000
	.byte #%10011001
	.byte #%10001001
	.byte #%10001000
	.byte #%01111000
	.byte #%01110111
	.byte #%01110111
	.byte #%01100110
	.byte #%01010110
	.byte #%01100101
	.byte #%01110110
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%10000111
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%10001000
	.byte #%10001001
	.byte #%01111000
	.byte #%01100110
	.byte #%01100110
	.byte #%01110110
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%10000111
	.byte #%10001000
	.byte #%10011000
	.byte #%10011001
	.byte #%10001000
	.byte #%10011000
	.byte #%10101010
	.byte #%10101010
	.byte #%01111001
	.byte #%01100110
	.byte #%01110110
	.byte #%01110111
	.byte #%10001000
	.byte #%10101001
	.byte #%10111010
	.byte #%10111011
	.byte #%10011010
	.byte #%01111000
	.byte #%01100111
	.byte #%01100110
	.byte #%01100110
	.byte #%01100111
	.byte #%01110111
	.byte #%10000111
	.byte #%10011000
	.byte #%10011001
	.byte #%10001000
	.byte #%01100111
	.byte #%01010110
	.byte #%01100110
	.byte #%10000111
	.byte #%10011001
	.byte #%10101010
	.byte #%10011001
	.byte #%01111001
	.byte #%01010110
	.byte #%01000100
	.byte #%01010100
	.byte #%01100101
	.byte #%01110110
	.byte #%10101001
	.byte #%10111011
	.byte #%10011010
	.byte #%10001001
	.byte #%10001000
	.byte #%01100111
	.byte #%01010101
	.byte #%01010101
	.byte #%01110110
	.byte #%10001000
	.byte #%10001000
	.byte #%01110111
	.byte #%01010110
	.byte #%01010101
	.byte #%01000100
	.byte #%01010100
	.byte #%01010101
	.byte #%01110110
	.byte #%10101001
	.byte #%10111011
	.byte #%10001010
	.byte #%01010110
	.byte #%01010100
	.byte #%10000110
	.byte #%10101001
	.byte #%10111011
	.byte #%11011100
	.byte #%11011101
	.byte #%10111100
	.byte #%10101010
	.byte #%01111000
	.byte #%01010110
	.byte #%01000100
	.byte #%01010100
	.byte #%01100110
	.byte #%01110110
	.byte #%01110111
	.byte #%01110111
	.byte #%01100110
	.byte #%01010101
	.byte #%01000100
	.byte #%01100101
	.byte #%10000111
	.byte #%10101001
	.byte #%10101010
	.byte #%10101011
	.byte #%10001010
	.byte #%01010111
	.byte #%01010101
	.byte #%01110110
	.byte #%10011000
	.byte #%11001010
	.byte #%11101101
	.byte #%11011110
	.byte #%10101100
	.byte #%10001001
	.byte #%01111000
	.byte #%01100111
	.byte #%01010110
	.byte #%01100110
; Page 1
	.byte #%01110110
	.byte #%10000111
	.byte #%10001000
	.byte #%10001001
	.byte #%01100111
	.byte #%01000101
	.byte #%01010100
	.byte #%01110110
	.byte #%01110111
	.byte #%01110111
	.byte #%10011000
	.byte #%10011001
	.byte #%01101000
	.byte #%00100100
	.byte #%00110010
	.byte #%01010100
	.byte #%01110111
	.byte #%10011001
	.byte #%10111011
	.byte #%10111011
	.byte #%10001010
	.byte #%01111000
	.byte #%01110111
	.byte #%01010111
	.byte #%01010101
	.byte #%10000110
	.byte #%10101010
	.byte #%10101010
	.byte #%10001001
	.byte #%10001000
	.byte #%01111000
	.byte #%01100111
	.byte #%01100110
	.byte #%01110110
	.byte #%01100111
	.byte #%01010101
	.byte #%10100111
	.byte #%10101011
	.byte #%00100110
	.byte #%00000000
	.byte #%01100001
	.byte #%11011010
	.byte #%11001110
	.byte #%10011010
	.byte #%10011000
	.byte #%10101010
	.byte #%10011010
	.byte #%10011001
	.byte #%10101010
	.byte #%01111001
	.byte #%01000101
	.byte #%01110101
	.byte #%10111001
	.byte #%10101011
	.byte #%01101000
	.byte #%00110100
	.byte #%00110010
	.byte #%01100100
	.byte #%10011000
	.byte #%10101010
	.byte #%10001010
	.byte #%01100111
	.byte #%10010111
	.byte #%11011011
	.byte #%10001100
	.byte #%00010100
	.byte #%00110000
	.byte #%11010111
	.byte #%11111111
	.byte #%11001111
	.byte #%01101001
	.byte #%01100101
	.byte #%10000111
	.byte #%10101001
	.byte #%10101010
	.byte #%10001001
	.byte #%01000110
	.byte #%01000100
	.byte #%10000110
	.byte #%10111010
	.byte #%01111010
	.byte #%00010100
	.byte #%00000000
	.byte #%01000010
	.byte #%10010111
	.byte #%10111010
	.byte #%10011010
	.byte #%01111000
	.byte #%01110111
	.byte #%10101001
	.byte #%10111100
	.byte #%01001000
	.byte #%00000000
	.byte #%01000000
	.byte #%11111010
	.byte #%11111111
	.byte #%01101011
	.byte #%00000001
	.byte #%01010001
	.byte #%10100111
	.byte #%10111011
	.byte #%10011010
	.byte #%01111000
	.byte #%01000101
	.byte #%01010100
	.byte #%10100111
	.byte #%11001011
	.byte #%10001010
	.byte #%00110101
	.byte #%00110010
	.byte #%10000101
	.byte #%11001010
	.byte #%11001100
	.byte #%10011010
	.byte #%01010111
	.byte #%01100101
	.byte #%10010111
	.byte #%10101011
	.byte #%01011001
	.byte #%00000001
	.byte #%00100000
	.byte #%11111000
	.byte #%11111111
	.byte #%10111111
	.byte #%00000100
	.byte #%00100000
	.byte #%11000111
	.byte #%11111111
	.byte #%10111110
	.byte #%01000111
	.byte #%00100011
	.byte #%01000011
	.byte #%10000110
	.byte #%10101001
	.byte #%01111001
	.byte #%00100100
	.byte #%00010001
	.byte #%01010011
	.byte #%10101000
	.byte #%10111011
	.byte #%10011011
	.byte #%01111000
	.byte #%01110111
	.byte #%10101001
	.byte #%11011100
	.byte #%10011100
	.byte #%00110110
	.byte #%01000010
	.byte #%11111000
	.byte #%11111111
	.byte #%11111111
	.byte #%00101000
	.byte #%00000000
	.byte #%01110010
	.byte #%11111100
	.byte #%11011111
	.byte #%01011001
	.byte #%00000010
	.byte #%00100000
	.byte #%01100100
	.byte #%10101000
	.byte #%10011010
	.byte #%01000111
	.byte #%00010010
	.byte #%00110001
	.byte #%10000101
	.byte #%10101001
	.byte #%10011010
	.byte #%01010111
	.byte #%01000100
	.byte #%01100101
	.byte #%10011000
	.byte #%10001001
	.byte #%00100101
	.byte #%00000000
	.byte #%01110010
	.byte #%11111101
	.byte #%11111111
	.byte #%01101101
	.byte #%00000000
	.byte #%00100000
	.byte #%11011000
	.byte #%11111111
	.byte #%10111111
	.byte #%01000111
	.byte #%00100010
	.byte #%01100011
	.byte #%10011000
	.byte #%10111011
	.byte #%10011010
	.byte #%01000110
	.byte #%00010010
	.byte #%01000010
	.byte #%10111000
	.byte #%11011101
	.byte #%10011100
	.byte #%01101000
	.byte #%01010101
	.byte #%10010111
	.byte #%11001011
	.byte #%10011100
	.byte #%00100110
	.byte #%00100000
	.byte #%11000110
	.byte #%11111111
	.byte #%11111111
	.byte #%01011100
	.byte #%00000000
	.byte #%01000000
	.byte #%11101010
	.byte #%11111111
	.byte #%10101110
	.byte #%01000111
	.byte #%00100010
	.byte #%00110011
	.byte #%01010100
	.byte #%10000111
	.byte #%10001000
	.byte #%01010111
	.byte #%00010011
	.byte #%00100001
	.byte #%01110100
	.byte #%11001010
	.byte #%10111101
	.byte #%01101001
	.byte #%00110101
	.byte #%01100100
	.byte #%10111001
	.byte #%10101011
	.byte #%00100110
	.byte #%00000000
	.byte #%01100001
	.byte #%11111100
	.byte #%11111111
	.byte #%01111101
	.byte #%00000010
	.byte #%00000000
	.byte #%10010100
	.byte #%11111101
	.byte #%11001110
	.byte #%10001010
	.byte #%01100110
	.byte #%01010101
	.byte #%01010101
	.byte #%01110110
	.byte #%10101000
	.byte #%11001011
	.byte #%10011011
	.byte #%01000111
	.byte #%00110011
	.byte #%01110101
	.byte #%11001010
	.byte #%11001101
	.byte #%01111010
	.byte #%01000101
	.byte #%01100101
; Page 2
	.byte #%10101000
	.byte #%10011010
	.byte #%00100110
	.byte #%00000000
	.byte #%01100001
	.byte #%11111011
	.byte #%11111111
	.byte #%10111111
	.byte #%00100110
	.byte #%00010001
	.byte #%01110100
	.byte #%10111001
	.byte #%10101011
	.byte #%10001001
	.byte #%01110111
	.byte #%01110111
	.byte #%01010110
	.byte #%00110100
	.byte #%01000011
	.byte #%10000110
	.byte #%10011001
	.byte #%10001001
	.byte #%01010110
	.byte #%01000101
	.byte #%01100101
	.byte #%10011000
	.byte #%10111011
	.byte #%10111011
	.byte #%10001001
	.byte #%01110111
	.byte #%10000111
	.byte #%10011001
	.byte #%01111000
	.byte #%01000101
	.byte #%01000011
	.byte #%10010111
	.byte #%11101100
	.byte #%11011110
	.byte #%01111010
	.byte #%00110101
	.byte #%00110011
	.byte #%01010100
	.byte #%01100110
	.byte #%01110110
	.byte #%10000111
	.byte #%10101001
	.byte #%10101010
	.byte #%10001001
	.byte #%01010110
	.byte #%01100101
	.byte #%10000111
	.byte #%10011000
	.byte #%10001000
	.byte #%10001000
	.byte #%10101001
	.byte #%10111011
	.byte #%10011010
	.byte #%01111000
	.byte #%01110111
	.byte #%10011000
	.byte #%10011001
	.byte #%10011001
	.byte #%10001000
	.byte #%01010111
	.byte #%01000101
	.byte #%01010101
	.byte #%10010111
	.byte #%10101010
	.byte #%10101011
	.byte #%10001001
	.byte #%01110111
	.byte #%01100110
	.byte #%01100110
	.byte #%01000101
	.byte #%00100011
	.byte #%00110010
	.byte #%01010100
	.byte #%01100101
	.byte #%01010110
	.byte #%01000101
	.byte #%01010101
	.byte #%01100110
	.byte #%10000111
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10011001
	.byte #%10101010
	.byte #%10111010
	.byte #%10111011
	.byte #%10111011
	.byte #%10101011
	.byte #%10101010
	.byte #%10001001
	.byte #%01100111
	.byte #%01100110
	.byte #%01110110
	.byte #%10011000
	.byte #%10011001
	.byte #%10101001
	.byte #%10101010
	.byte #%10101010
	.byte #%10011001
	.byte #%01111000
	.byte #%01100110
	.byte #%01100110
	.byte #%01100110
	.byte #%01110111
	.byte #%10000111
	.byte #%01110111
	.byte #%10000111
	.byte #%10001000
	.byte #%10001001
	.byte #%01100111
	.byte #%01100110
	.byte #%01100110
	.byte #%01100110
	.byte #%01100110
	.byte #%01100110
	.byte #%01110111
	.byte #%01110111
	.byte #%10001000
	.byte #%10011001
	.byte #%10101010
	.byte #%10011010
	.byte #%10001001
	.byte #%10001000
	.byte #%01111000
	.byte #%01110111
	.byte #%01010110
	.byte #%01000100
	.byte #%01000100
	.byte #%01010100
	.byte #%01100101
	.byte #%01110111
	.byte #%10011000
	.byte #%10011001
	.byte #%10001001
	.byte #%01111000
	.byte #%01110111
	.byte #%01110111
	.byte #%01100110
	.byte #%01100110
	.byte #%01110110
	.byte #%10000111
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10011001
	.byte #%10011001
	.byte #%10101010
	.byte #%10011010
	.byte #%10011001
	.byte #%10011001
	.byte #%10011001
	.byte #%01111000
	.byte #%01100111
	.byte #%01100101
	.byte #%01110110
	.byte #%10011000
	.byte #%10011001
	.byte #%10001001
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01100110
	.byte #%01100110
	.byte #%01110110
	.byte #%01110111
	.byte #%10000111
	.byte #%10001000
	.byte #%10001000
	.byte #%10011001
	.byte #%10001001
	.byte #%01111000
	.byte #%01100110
	.byte #%01100110
	.byte #%01110110
	.byte #%10000111
	.byte #%01110111
	.byte #%10001000
	.byte #%10011000
	.byte #%10101010
	.byte #%10111011
	.byte #%10011010
	.byte #%10011001
	.byte #%10001000
	.byte #%10001000
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%10000111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110110
	.byte #%01100110
	.byte #%01100110
	.byte #%01100110
	.byte #%01100110
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01100110
	.byte #%01110110
	.byte #%01110111
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10011000
	.byte #%10011001
	.byte #%10001001
	.byte #%10001000
	.byte #%10011001
	.byte #%10011001
	.byte #%10011001
	.byte #%10011001
	.byte #%10011001
	.byte #%10011001
	.byte #%10011001
	.byte #%10001001
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%01111000
	.byte #%01110111
	.byte #%01110111
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%01111000
	.byte #%01100111
	.byte #%01100110
	.byte #%01110110
	.byte #%01110111
; Page 3
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01100110
	.byte #%01100110
	.byte #%01100110
	.byte #%01110110
	.byte #%01110110
	.byte #%01110111
	.byte #%10000111
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%01111000
	.byte #%01110111
	.byte #%01100111
	.byte #%01110111
	.byte #%01110111
	.byte #%01111000
	.byte #%01110111
	.byte #%01110111
	.byte #%10001000
	.byte #%01111000
	.byte #%01110111
	.byte #%01110111
	.byte #%10001000
	.byte #%01111000
	.byte #%10001000
	.byte #%10011000
	.byte #%10011001
	.byte #%10001000
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01100110
	.byte #%01100110
	.byte #%01110111
	.byte #%01100111
	.byte #%01110110
	.byte #%10000111
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10011001
	.byte #%10011001
	.byte #%10001001
	.byte #%10011001
	.byte #%10011001
	.byte #%10011001
	.byte #%10001001
	.byte #%10001000
	.byte #%01110111
	.byte #%01100110
	.byte #%01110110
	.byte #%01110111
	.byte #%01100111
	.byte #%01100110
	.byte #%01110110
	.byte #%01110111
	.byte #%10000111
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10011001
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%01110111
	.byte #%10001000
	.byte #%10011000
	.byte #%10001001
	.byte #%01111000
	.byte #%01100110
	.byte #%01100110
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01100110
	.byte #%01110110
	.byte #%10000111
	.byte #%10001000
	.byte #%10001000
	.byte #%01110111
	.byte #%10000111
	.byte #%10001000
	.byte #%10001000
	.byte #%01110111
	.byte #%01110111
	.byte #%01100110
	.byte #%01110111
	.byte #%01110111
	.byte #%01100111
	.byte #%01100110
	.byte #%01100110
	.byte #%01100110
	.byte #%01100110
	.byte #%01110111
	.byte #%10001000
	.byte #%10011001
	.byte #%10011001
	.byte #%10001000
	.byte #%10001000
	.byte #%10011001
	.byte #%10011001
	.byte #%10011001
	.byte #%10011001
	.byte #%10011001
	.byte #%10011001
	.byte #%10011001
	.byte #%01111000
	.byte #%10000111
	.byte #%01111000
	.byte #%01100110
	.byte #%01010101
	.byte #%01110101
	.byte #%10001000
	.byte #%01100111
	.byte #%01110110
	.byte #%01110111
	.byte #%01100111
	.byte #%10000111
	.byte #%10011001
	.byte #%10011010
	.byte #%10001001
	.byte #%01111000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%01111000
	.byte #%10001000
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%10001000
	.byte #%01110111
	.byte #%01110111
	.byte #%10000111
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10011001
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01100111
	.byte #%01110111
	.byte #%01100110
	.byte #%01100110
	.byte #%01110110
	.byte #%01110111
	.byte #%01110111
	.byte #%01100111
	.byte #%01100111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%10000111
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%01111000
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%10001000
	.byte #%01110111
	.byte #%01110111
	.byte #%10011000
	.byte #%10011001
	.byte #%10011001
	.byte #%10011010
	.byte #%10101001
	.byte #%10101010
	.byte #%10001010
	.byte #%01110111
	.byte #%10010111
	.byte #%10011010
	.byte #%01101000
	.byte #%01100110
	.byte #%01110111
	.byte #%01100111
	.byte #%01010101
	.byte #%01110110
	.byte #%10001000
	.byte #%01100111
	.byte #%01100101
	.byte #%10000111
	.byte #%10001000
	.byte #%01110111
	.byte #%10000111
	.byte #%10011001
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%01111000
	.byte #%01100111
	.byte #%01110110
	.byte #%01110111
	.byte #%01100111
	.byte #%01100110
	.byte #%01110110
	.byte #%01100111
	.byte #%01100101
	.byte #%10000111
	.byte #%10011001
	.byte #%10001001
	.byte #%10011000
	.byte #%10011001
	.byte #%10001001
	.byte #%10011000
	.byte #%10101001
	.byte #%10101011
	.byte #%10001001
	.byte #%01110111
	.byte #%10001000
	.byte #%10011000
	.byte #%10101001
	.byte #%10101010
	.byte #%10101011
	.byte #%10001001
	.byte #%01110111
	.byte #%01100110
	.byte #%01010101
	.byte #%01010101
	.byte #%01010101
	.byte #%01100101
	.byte #%01100110
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01100110
	.byte #%01100110
	.byte #%01110111
; Page 4
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%01101000
	.byte #%00100101
	.byte #%00000000
	.byte #%01000010
	.byte #%10010110
	.byte #%11011011
	.byte #%11101110
	.byte #%11001101
	.byte #%10001010
	.byte #%01010110
	.byte #%01000100
	.byte #%01100101
	.byte #%01110111
	.byte #%10011000
	.byte #%10111010
	.byte #%10101011
	.byte #%01111001
	.byte #%01010110
	.byte #%01010101
	.byte #%01110110
	.byte #%10101001
	.byte #%10101010
	.byte #%10011010
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10000111
	.byte #%10101010
	.byte #%01111010
	.byte #%00110101
	.byte #%01000011
	.byte #%10111000
	.byte #%11111111
	.byte #%11111111
	.byte #%11101111
	.byte #%10011100
	.byte #%00100101
	.byte #%00010001
	.byte #%00110001
	.byte #%01100101
	.byte #%10011000
	.byte #%10101010
	.byte #%10011001
	.byte #%01010111
	.byte #%00000011
	.byte #%00000000
	.byte #%00100000
	.byte #%10000101
	.byte #%11001010
	.byte #%10111100
	.byte #%01111001
	.byte #%01100110
	.byte #%01100101
	.byte #%10000111
	.byte #%10101001
	.byte #%10101011
	.byte #%01011000
	.byte #%00110010
	.byte #%01110100
	.byte #%11101010
	.byte #%11111111
	.byte #%11111111
	.byte #%10011101
	.byte #%00100101
	.byte #%00000000
	.byte #%00000000
	.byte #%01100011
	.byte #%10010111
	.byte #%11001011
	.byte #%10101011
	.byte #%01101000
	.byte #%00100100
	.byte #%00000001
	.byte #%00010000
	.byte #%01110011
	.byte #%11101011
	.byte #%11111111
	.byte #%10101110
	.byte #%00110110
	.byte #%01000011
	.byte #%10000110
	.byte #%10011001
	.byte #%10111010
	.byte #%10111011
	.byte #%01001000
	.byte #%00010001
	.byte #%01110011
	.byte #%11111100
	.byte #%11111111
	.byte #%11111111
	.byte #%11011111
	.byte #%01011001
	.byte #%00000010
	.byte #%01000001
	.byte #%10100111
	.byte #%11001100
	.byte #%11011100
	.byte #%10111101
	.byte #%01001000
	.byte #%00010010
	.byte #%00000000
	.byte #%00000000
	.byte #%01010010
	.byte #%11011010
	.byte #%11111111
	.byte #%10011100
	.byte #%00110110
	.byte #%00010001
	.byte #%10000101
	.byte #%10011010
	.byte #%10001000
	.byte #%11001010
	.byte #%10011100
	.byte #%00000100
	.byte #%00000000
	.byte #%10010101
	.byte #%11101100
	.byte #%11111111
	.byte #%11111111
	.byte #%10011101
	.byte #%00000011
	.byte #%00000000
	.byte #%01000001
	.byte #%10010111
	.byte #%10111010
	.byte #%11011100
	.byte #%01101010
	.byte #%00000010
	.byte #%00000000
	.byte #%00010000
	.byte #%01100011
	.byte #%11011001
	.byte #%11111111
	.byte #%10111111
	.byte #%01010111
	.byte #%00110011
	.byte #%10000101
	.byte #%10111010
	.byte #%10101011
	.byte #%10111010
	.byte #%10111100
	.byte #%00110111
	.byte #%00000000
	.byte #%01100010
	.byte #%11011011
	.byte #%11111111
	.byte #%11111111
	.byte #%10111111
	.byte #%00000110
	.byte #%00000000
	.byte #%00110000
	.byte #%10100111
	.byte #%11011100
	.byte #%11101111
	.byte #%10001100
	.byte #%00100101
	.byte #%00000001
	.byte #%00010000
	.byte #%01010010
	.byte #%11011001
	.byte #%11101110
	.byte #%10011100
	.byte #%00110101
	.byte #%00100010
	.byte #%01110011
	.byte #%11011010
	.byte #%10111101
	.byte #%10111010
	.byte #%10101011
	.byte #%00111000
	.byte #%00000000
	.byte #%01110010
	.byte #%11011011
	.byte #%11111111
	.byte #%11111111
	.byte #%10111111
	.byte #%00010110
	.byte #%00000000
	.byte #%01000001
	.byte #%10010110
	.byte #%11101011
	.byte #%11111111
	.byte #%01101011
	.byte #%00000001
	.byte #%00000000
	.byte #%00000000
	.byte #%01010010
	.byte #%11101010
	.byte #%11011111
	.byte #%10001010
	.byte #%01000101
	.byte #%00110011
	.byte #%01110011
	.byte #%11111100
	.byte #%10111101
	.byte #%10101010
	.byte #%11001100
	.byte #%01011011
	.byte #%00000000
	.byte #%01100010
	.byte #%10111001
	.byte #%11101100
	.byte #%11111111
	.byte #%11001111
	.byte #%00000110
	.byte #%00000000
	.byte #%00110001
	.byte #%01110100
	.byte #%11101010
	.byte #%11111111
	.byte #%01101011
	.byte #%00010010
	.byte #%00010001
	.byte #%00000000
	.byte #%10000011
	.byte #%11111101
	.byte #%11001110
	.byte #%01111010
	.byte #%00110101
	.byte #%00100010
	.byte #%10000011
	.byte #%11001011
	.byte #%10001011
	.byte #%10010111
	.byte #%10111011
	.byte #%01001001
	.byte #%00010000
	.byte #%01100011
	.byte #%10101001
	.byte #%11111100
	.byte #%11111111
	.byte #%10111111
	.byte #%00100110
	.byte #%00010001
	.byte #%00100001
	.byte #%10000100
	.byte #%11111101
	.byte #%11111111
	.byte #%01101010
	.byte #%00100100
	.byte #%00000001
	.byte #%00000000
	.byte #%10000011
	.byte #%11011100
	.byte #%11001100
	.byte #%10001011
	.byte #%00100100
	.byte #%00010000
	.byte #%10010100
	.byte #%10101100
	.byte #%10001010
	.byte #%10111001
	.byte #%10101100
; Page 5
	.byte #%00110111
	.byte #%01000011
	.byte #%01110101
	.byte #%10101000
	.byte #%11111110
	.byte #%11111111
	.byte #%10011110
	.byte #%00110110
	.byte #%00000001
	.byte #%00000000
	.byte #%10010100
	.byte #%11101101
	.byte #%10111101
	.byte #%01101001
	.byte #%00010011
	.byte #%00000000
	.byte #%00000000
	.byte #%01110011
	.byte #%11001011
	.byte #%11001101
	.byte #%10001011
	.byte #%00110110
	.byte #%01000011
	.byte #%10110110
	.byte #%11001100
	.byte #%10001010
	.byte #%11001010
	.byte #%10101100
	.byte #%00110110
	.byte #%01000011
	.byte #%01100101
	.byte #%10010111
	.byte #%11111110
	.byte #%11111111
	.byte #%10011100
	.byte #%01000110
	.byte #%00000001
	.byte #%00110000
	.byte #%11001000
	.byte #%11111110
	.byte #%11101111
	.byte #%01111011
	.byte #%00000100
	.byte #%00000000
	.byte #%00100000
	.byte #%10000101
	.byte #%11011011
	.byte #%11011110
	.byte #%01111010
	.byte #%00010100
	.byte #%00110001
	.byte #%10000101
	.byte #%10000111
	.byte #%10000111
	.byte #%10011001
	.byte #%01101000
	.byte #%00110011
	.byte #%00100010
	.byte #%01000011
	.byte #%10110111
	.byte #%11111110
	.byte #%11111111
	.byte #%10101100
	.byte #%00110110
	.byte #%00000000
	.byte #%00110001
	.byte #%10100111
	.byte #%11111110
	.byte #%11011111
	.byte #%10001010
	.byte #%01000110
	.byte #%00000010
	.byte #%00110001
	.byte #%10000101
	.byte #%11101011
	.byte #%11101111
	.byte #%10001011
	.byte #%01010101
	.byte #%01110100
	.byte #%01111000
	.byte #%01110111
	.byte #%11011010
	.byte #%10101100
	.byte #%01011000
	.byte #%01000101
	.byte #%00100011
	.byte #%10000011
	.byte #%11101011
	.byte #%11111111
	.byte #%11011111
	.byte #%01011001
	.byte #%00000010
	.byte #%00000000
	.byte #%01000001
	.byte #%10100110
	.byte #%11001100
	.byte #%10111011
	.byte #%10001010
	.byte #%00010101
	.byte #%00000000
	.byte #%00100001
	.byte #%10010110
	.byte #%11111100
	.byte #%11011111
	.byte #%10001010
	.byte #%01010111
	.byte #%01100101
	.byte #%01110101
	.byte #%10101000
	.byte #%11011011
	.byte #%10101100
	.byte #%01111000
	.byte #%00110101
	.byte #%00110011
	.byte #%10010101
	.byte #%11111101
	.byte #%11111111
	.byte #%10111110
	.byte #%01010111
	.byte #%00000010
	.byte #%00010001
	.byte #%01010011
	.byte #%10101000
	.byte #%10101011
	.byte #%10101010
	.byte #%01101000
	.byte #%00100100
	.byte #%00000000
	.byte #%00010000
	.byte #%10000100
	.byte #%11001011
	.byte #%10111101
	.byte #%01111010
	.byte #%10011000
	.byte #%01000110
	.byte #%01100100
	.byte #%10101001
	.byte #%10101011
	.byte #%10011001
	.byte #%01000110
	.byte #%01100100
	.byte #%10011000
	.byte #%11011011
	.byte #%11111111
	.byte #%11011111
	.byte #%10011011
	.byte #%00110110
	.byte #%00100010
	.byte #%01000011
	.byte #%10000110
	.byte #%10101001
	.byte #%10011001
	.byte #%10001001
	.byte #%01000110
	.byte #%00110011
	.byte #%00010010
	.byte #%01000001
	.byte #%10101000
	.byte #%11011100
	.byte #%10111110
	.byte #%10101010
	.byte #%01110111
	.byte #%01110110
	.byte #%10000111
	.byte #%10101010
	.byte #%10011010
	.byte #%01110111
	.byte #%01110111
	.byte #%10011000
	.byte #%11001011
	.byte #%11101101
	.byte #%11001101
	.byte #%01111010
	.byte #%00110101
	.byte #%00000001
	.byte #%00100001
	.byte #%01100011
	.byte #%10000111
	.byte #%10111001
	.byte #%10101011
	.byte #%10001001
	.byte #%01010111
	.byte #%00110100
	.byte #%00100011
	.byte #%01010011
	.byte #%10101000
	.byte #%10111011
	.byte #%10101101
	.byte #%01011000
	.byte #%01100110
	.byte #%01010110
	.byte #%01010101
	.byte #%00110101
	.byte #%01000011
	.byte #%01010101
	.byte #%10010111
	.byte #%11101100
	.byte #%11111111
	.byte #%11001110
	.byte #%01111010
	.byte #%01000101
	.byte #%00010010
	.byte #%00110010
	.byte #%01100100
	.byte #%10010111
	.byte #%10111011
	.byte #%11011011
	.byte #%10111100
	.byte #%10001010
	.byte #%01010111
	.byte #%00110011
	.byte #%01000011
	.byte #%01110101
	.byte #%11011010
	.byte #%10101100
	.byte #%11001011
	.byte #%10001001
	.byte #%10001001
	.byte #%01100111
	.byte #%00110100
	.byte #%01000100
	.byte #%10000101
	.byte #%11001011
	.byte #%11111110
	.byte #%11111111
	.byte #%11101111
	.byte #%10001011
	.byte #%00110101
	.byte #%00010010
	.byte #%00000000
	.byte #%00100001
	.byte #%01010011
	.byte #%10010111
	.byte #%10111010
	.byte #%10111011
	.byte #%01111001
	.byte #%01010110
	.byte #%00100011
	.byte #%00100010
	.byte #%01010011
	.byte #%10001001
	.byte #%10111001
	.byte #%11001100
	.byte #%11001100
	.byte #%10001011
	.byte #%01000110
	.byte #%00010010
	.byte #%00010001
	.byte #%01010011
	.byte #%10100111
	.byte #%11111101
	.byte #%11111111
	.byte #%11011110
	.byte #%10001011
	.byte #%01000101
	.byte #%00010010
; Page 6
	.byte #%00000000
	.byte #%00100001
	.byte #%01100100
	.byte #%10111001
	.byte #%11001011
	.byte #%11011101
	.byte #%10111100
	.byte #%01111010
	.byte #%01010101
	.byte #%00110011
	.byte #%01010101
	.byte #%10000110
	.byte #%10101010
	.byte #%11001010
	.byte #%10101011
	.byte #%01111001
	.byte #%01000101
	.byte #%00100011
	.byte #%01000011
	.byte #%01100100
	.byte #%11001001
	.byte #%11111101
	.byte #%11111111
	.byte #%11001110
	.byte #%10001010
	.byte #%01000111
	.byte #%00110100
	.byte #%00110011
	.byte #%01010100
	.byte #%01110110
	.byte #%10101001
	.byte #%10101010
	.byte #%10101011
	.byte #%10001001
	.byte #%01010111
	.byte #%00110100
	.byte #%01000011
	.byte #%01010100
	.byte #%10000111
	.byte #%10111001
	.byte #%10111100
	.byte #%10001010
	.byte #%01010110
	.byte #%01000100
	.byte #%01000011
	.byte #%01100101
	.byte #%10101000
	.byte #%11011011
	.byte #%11101110
	.byte #%11011101
	.byte #%10011011
	.byte #%01010110
	.byte #%00110011
	.byte #%00100001
	.byte #%00110010
	.byte #%01000011
	.byte #%01100101
	.byte #%10010111
	.byte #%10011010
	.byte #%10011010
	.byte #%01111000
	.byte #%01000110
	.byte #%01010100
	.byte #%01100110
	.byte #%10000110
	.byte #%10101001
	.byte #%11011011
	.byte #%11011101
	.byte #%10101101
	.byte #%01101001
	.byte #%00110100
	.byte #%01000011
	.byte #%01110101
	.byte #%10111001
	.byte #%11101100
	.byte #%11011101
	.byte #%11001101
	.byte #%10011011
	.byte #%01110111
	.byte #%01000101
	.byte #%01000011
	.byte #%01000011
	.byte #%01100100
	.byte #%10000110
	.byte #%10011000
	.byte #%10101010
	.byte #%10011010
	.byte #%10011001
	.byte #%01111000
	.byte #%01010110
	.byte #%01000100
	.byte #%01000011
	.byte #%01100110
	.byte #%10000111
	.byte #%10011000
	.byte #%10001001
	.byte #%01110111
	.byte #%01000101
	.byte #%00110100
	.byte #%01010100
	.byte #%10000110
	.byte #%10111001
	.byte #%11011100
	.byte #%11001101
	.byte #%10101011
	.byte #%10011001
	.byte #%01111000
	.byte #%01100110
	.byte #%01010110
	.byte #%01100101
	.byte #%01110111
	.byte #%10001000
	.byte #%10011000
	.byte #%10001000
	.byte #%01111000
	.byte #%01111000
	.byte #%01110111
	.byte #%01110111
	.byte #%01100110
	.byte #%01100110
	.byte #%01110111
	.byte #%10011000
	.byte #%10101010
	.byte #%10101010
	.byte #%10011010
	.byte #%10001001
	.byte #%10001000
	.byte #%01110111
	.byte #%10000111
	.byte #%10011000
	.byte #%10011001
	.byte #%10011001
	.byte #%10001000
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01100111
	.byte #%01100110
	.byte #%01100110
	.byte #%01100110
	.byte #%01100110
	.byte #%01100110
	.byte #%01100110
	.byte #%01100110
	.byte #%01110111
	.byte #%01110111
	.byte #%01110110
	.byte #%10000111
	.byte #%10001000
	.byte #%10011001
	.byte #%10001000
	.byte #%10001000
	.byte #%01110111
	.byte #%01100110
	.byte #%01110111
	.byte #%10001000
	.byte #%01111000
	.byte #%01100111
	.byte #%01100111
	.byte #%01100111
	.byte #%01100110
	.byte #%01110110
	.byte #%10010111
	.byte #%10111010
	.byte #%11001011
	.byte #%10111100
	.byte #%10011010
	.byte #%01111000
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01111000
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%10000111
	.byte #%10011000
	.byte #%10011001
	.byte #%10011001
	.byte #%10001001
	.byte #%01111000
	.byte #%01110111
	.byte #%01100111
	.byte #%01110110
	.byte #%10000111
	.byte #%10011000
	.byte #%10011001
	.byte #%01111000
	.byte #%01100111
	.byte #%01100111
	.byte #%01100110
	.byte #%01110111
	.byte #%10000111
	.byte #%10001000
	.byte #%10000111
	.byte #%10001000
	.byte #%01111000
	.byte #%01100111
	.byte #%01100101
	.byte #%01100110
	.byte #%01110111
	.byte #%01110111
	.byte #%10001000
	.byte #%10011001
	.byte #%10101010
	.byte #%10011010
	.byte #%10001001
	.byte #%01111000
	.byte #%01110111
	.byte #%01010110
	.byte #%01100101
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%10001000
	.byte #%10001001
	.byte #%10001000
	.byte #%01110111
	.byte #%10000111
	.byte #%10011001
	.byte #%10011001
	.byte #%10011001
	.byte #%10001000
	.byte #%10001001
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%01110111
	.byte #%01110111
	.byte #%01111000
	.byte #%01110111
	.byte #%01110111
	.byte #%10001000
	.byte #%01111000
	.byte #%10000111
	.byte #%01110111
	.byte #%01110110
	.byte #%01110111
	.byte #%01110111
	.byte #%10000111
	.byte #%10001000
	.byte #%10001001
	.byte #%10001000
	.byte #%01110111
	.byte #%01100110
	.byte #%01110110
	.byte #%10000111
	.byte #%10001000
; Page 7
	.byte #%01111000
	.byte #%01110111
	.byte #%01110111
	.byte #%10000111
	.byte #%01111000
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01111000
	.byte #%10001000
	.byte #%10001000
	.byte #%10011001
	.byte #%10011001
	.byte #%10011010
	.byte #%10101010
	.byte #%01111000
	.byte #%01100110
	.byte #%01100101
	.byte #%01100110
	.byte #%01110110
	.byte #%01110111
	.byte #%01110111
	.byte #%01100111
	.byte #%01100110
	.byte #%01110110
	.byte #%10000111
	.byte #%10001000
	.byte #%10001000
	.byte #%10011001
	.byte #%10011010
	.byte #%10001001
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%01111000
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%10000111
	.byte #%10001000
	.byte #%01111000
	.byte #%01100111
	.byte #%01010101
	.byte #%01100110
	.byte #%01110110
	.byte #%10101000
	.byte #%10011001
	.byte #%10001001
	.byte #%01111000
	.byte #%01110111
	.byte #%01100110
	.byte #%01110110
	.byte #%01110111
	.byte #%01110111
	.byte #%10001000
	.byte #%10001000
	.byte #%01111000
	.byte #%01100111
	.byte #%01100110
	.byte #%01100111
	.byte #%10000111
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10011000
	.byte #%10011001
	.byte #%10001001
	.byte #%10001000
	.byte #%01111000
	.byte #%01110111
	.byte #%10001000
	.byte #%10011001
	.byte #%10011001
	.byte #%10001000
	.byte #%01111000
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%10000111
	.byte #%10001000
	.byte #%10001000
	.byte #%01110111
	.byte #%01110111
	.byte #%10000111
	.byte #%10000111
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%01100111
	.byte #%01100110
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01111000
	.byte #%01100110
	.byte #%01010101
	.byte #%01010100
	.byte #%01010101
	.byte #%01100110
	.byte #%10000111
	.byte #%10011001
	.byte #%10101010
	.byte #%10101010
	.byte #%10001001
	.byte #%01111000
	.byte #%01110111
	.byte #%01110111
	.byte #%10001000
	.byte #%01111000
	.byte #%01111000
	.byte #%10000111
	.byte #%10001000
	.byte #%01110111
	.byte #%01110111
	.byte #%10001000
	.byte #%10001000
	.byte #%10011000
	.byte #%10011001
	.byte #%10001000
	.byte #%10001000
	.byte #%10000111
	.byte #%10011000
	.byte #%10001000
	.byte #%10001000
	.byte #%01110111
	.byte #%01110111
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%01110111
	.byte #%01110111
	.byte #%01110110
	.byte #%01100111
	.byte #%01110110
	.byte #%01111000
	.byte #%01110111
	.byte #%01111000
	.byte #%01110111
	.byte #%01110111
	.byte #%10000111
	.byte #%01110111
	.byte #%01111000
	.byte #%10000111
	.byte #%10011001
	.byte #%10101001
	.byte #%10101010
	.byte #%10101011
	.byte #%01111001
	.byte #%01100110
	.byte #%01100110
	.byte #%01100110
	.byte #%10000111
	.byte #%10101001
	.byte #%10101010
	.byte #%10111011
	.byte #%10001010
	.byte #%01100111
	.byte #%00110101
	.byte #%00010010
	.byte #%00110001
	.byte #%01010100
	.byte #%10010111
	.byte #%10101001
	.byte #%10101010
	.byte #%01111000
	.byte #%01000110
	.byte #%01000011
	.byte #%01010101
	.byte #%01100101
	.byte #%10010111
	.byte #%10101010
	.byte #%10011001
	.byte #%10001000
	.byte #%01110111
	.byte #%10000111
	.byte #%10011000
	.byte #%10011001
	.byte #%10001001
	.byte #%10001000
	.byte #%10001001
	.byte #%01110111
	.byte #%10101000
	.byte #%10011010
	.byte #%10001000
	.byte #%10011000
	.byte #%10011001
	.byte #%10101001
	.byte #%11001011
	.byte #%10111100
	.byte #%10001010
	.byte #%01010111
	.byte #%00110100
	.byte #%00110011
	.byte #%01100100
	.byte #%10001000
	.byte #%10011001
	.byte #%10011001
	.byte #%10001000
	.byte #%01010110
	.byte #%00110100
	.byte #%01000011
	.byte #%01100101
	.byte #%01110110
	.byte #%10011001
	.byte #%01111000
	.byte #%10000111
	.byte #%10011000
	.byte #%10101010
	.byte #%01111001
	.byte #%01110110
	.byte #%10001000
	.byte #%01010111
	.byte #%00110100
	.byte #%01110101
	.byte #%10101001
	.byte #%11001011
	.byte #%11101101
	.byte #%10111110
	.byte #%01011000
	.byte #%00100100
	.byte #%00100010
	.byte #%01000011
	.byte #%10000110
	.byte #%11001010
	.byte #%11001100
	.byte #%10011011
	.byte #%01101000
	.byte #%00110100
	.byte #%00100011
	.byte #%01000011
	.byte #%10000110
	.byte #%10101010
	.byte #%10111011
	.byte #%10011010
	.byte #%01100111
	.byte #%01100110
	.byte #%01110111
	.byte #%01111000
	.byte #%01110111
	.byte #%10011000
	.byte #%10011010
	.byte #%01010111
	.byte #%01000100
	.byte #%10000110
	.byte #%11011011
	.byte #%11101110
	.byte #%11101111
	.byte #%10111101
	.byte #%01011000
	.byte #%00100011
	.byte #%00110010
	.byte #%01100100
; Page 8
	.byte #%10101000
	.byte #%10111010
	.byte #%10101011
	.byte #%01101000
	.byte #%00110100
	.byte #%00100010
	.byte #%00110010
	.byte #%01100100
	.byte #%10011000
	.byte #%10111010
	.byte #%10101011
	.byte #%01111000
	.byte #%01110111
	.byte #%01110111
	.byte #%10001000
	.byte #%01111000
	.byte #%10000111
	.byte #%10101001
	.byte #%10011010
	.byte #%01000110
	.byte #%00110010
	.byte #%10100110
	.byte #%11101100
	.byte #%11011110
	.byte #%10111100
	.byte #%01111001
	.byte #%00010100
	.byte #%00000000
	.byte #%01000001
	.byte #%10010111
	.byte #%11001011
	.byte #%11001100
	.byte #%10101011
	.byte #%01011000
	.byte #%00110100
	.byte #%01000011
	.byte #%01100101
	.byte #%10010111
	.byte #%10101010
	.byte #%10111011
	.byte #%10011010
	.byte #%01100111
	.byte #%01100110
	.byte #%10000111
	.byte #%10011001
	.byte #%01111000
	.byte #%01110111
	.byte #%10001000
	.byte #%01111001
	.byte #%01000101
	.byte #%00110010
	.byte #%10000101
	.byte #%11011011
	.byte #%11011101
	.byte #%10111100
	.byte #%01111010
	.byte #%01000101
	.byte #%00100010
	.byte #%01000010
	.byte #%10010111
	.byte #%10111010
	.byte #%10111011
	.byte #%10001001
	.byte #%01010111
	.byte #%00100011
	.byte #%01000011
	.byte #%10010110
	.byte #%10101010
	.byte #%10111011
	.byte #%10101010
	.byte #%10011010
	.byte #%10001001
	.byte #%10001000
	.byte #%10011000
	.byte #%10101010
	.byte #%10001001
	.byte #%01110111
	.byte #%10011000
	.byte #%10001001
	.byte #%01000110
	.byte #%00110011
	.byte #%10000101
	.byte #%11011011
	.byte #%11001101
	.byte #%10011010
	.byte #%01010111
	.byte #%00010011
	.byte #%00000000
	.byte #%00110000
	.byte #%10100110
	.byte #%10111011
	.byte #%10101011
	.byte #%10001001
	.byte #%01100111
	.byte #%00110100
	.byte #%01000011
	.byte #%10000110
	.byte #%10011001
	.byte #%10001001
	.byte #%10001000
	.byte #%10011001
	.byte #%10011001
	.byte #%10001000
	.byte #%10001000
	.byte #%10011001
	.byte #%01111000
	.byte #%01100110
	.byte #%10011000
	.byte #%10001001
	.byte #%00110110
	.byte #%01010011
	.byte #%11001001
	.byte #%11111110
	.byte #%11001110
	.byte #%10001010
	.byte #%01010101
	.byte #%00010011
	.byte #%00100000
	.byte #%10000101
	.byte #%11101100
	.byte #%11001110
	.byte #%10011011
	.byte #%10001001
	.byte #%00100101
	.byte #%00000000
	.byte #%00010000
	.byte #%01100100
	.byte #%10000111
	.byte #%10101001
	.byte #%10111010
	.byte #%10111011
	.byte #%10101011
	.byte #%10011001
	.byte #%10111010
	.byte #%10011010
	.byte #%10001000
	.byte #%10011001
	.byte #%01111001
	.byte #%00100100
	.byte #%00110010
	.byte #%11000111
	.byte #%11111111
	.byte #%11011111
	.byte #%10011011
	.byte #%01100111
	.byte #%00010011
	.byte #%00000000
	.byte #%01010010
	.byte #%10010111
	.byte #%10011010
	.byte #%10001000
	.byte #%01100111
	.byte #%00100100
	.byte #%00000001
	.byte #%00100001
	.byte #%01110100
	.byte #%10101001
	.byte #%11001011
	.byte #%10111100
	.byte #%10011001
	.byte #%10011000
	.byte #%10011000
	.byte #%10111010
	.byte #%10101011
	.byte #%10011001
	.byte #%10011001
	.byte #%01111000
	.byte #%00100100
	.byte #%00100001
	.byte #%10010101
	.byte #%11101100
	.byte #%11101110
	.byte #%11001101
	.byte #%10011011
	.byte #%00110110
	.byte #%00010001
	.byte #%00110010
	.byte #%10000110
	.byte #%10011001
	.byte #%10111010
	.byte #%10011010
	.byte #%01010111
	.byte #%00100011
	.byte #%00010001
	.byte #%00110010
	.byte #%01010100
	.byte #%10010111
	.byte #%10111010
	.byte #%10111011
	.byte #%10001001
	.byte #%10001000
	.byte #%10011001
	.byte #%11001011
	.byte #%11011101
	.byte #%10101011
	.byte #%10011010
	.byte #%01111001
	.byte #%01000101
	.byte #%00110011
	.byte #%10000101
	.byte #%11001010
	.byte #%11011101
	.byte #%11001101
	.byte #%10011011
	.byte #%01000111
	.byte #%00010010
	.byte #%00100001
	.byte #%01000011
	.byte #%01100101
	.byte #%10000111
	.byte #%10101001
	.byte #%10011010
	.byte #%10001000
	.byte #%01110111
	.byte #%01100110
	.byte #%01100110
	.byte #%01100110
	.byte #%10000111
	.byte #%10011001
	.byte #%10011001
	.byte #%10011001
	.byte #%10001001
	.byte #%01100111
	.byte #%01010101
	.byte #%01100101
	.byte #%01110111
	.byte #%01110111
	.byte #%10000111
	.byte #%10011000
	.byte #%01111000
	.byte #%01100110
	.byte #%01010101
	.byte #%01010101
	.byte #%01100101
	.byte #%01110110
	.byte #%10011001
	.byte #%10011010
	.byte #%10011001
	.byte #%10001000
	.byte #%10001001
	.byte #%10001000
	.byte #%10001000
	.byte #%01111000
	.byte #%01100111
	.byte #%01100110
	.byte #%01110111
	.byte #%10000111
	.byte #%10001000
	.byte #%10011001
	.byte #%10011001
	.byte #%10011001
	.byte #%10001001
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10011000
; Page 9
	.byte #%10011001
	.byte #%10011001
	.byte #%10011001
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10000111
	.byte #%10001000
	.byte #%10001000
	.byte #%01110111
	.byte #%01100111
	.byte #%01010110
	.byte #%01010101
	.byte #%01100101
	.byte #%10000111
	.byte #%10011000
	.byte #%10101001
	.byte #%10101010
	.byte #%10011010
	.byte #%10011001
	.byte #%10001000
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01100110
	.byte #%01010101
	.byte #%01010101
	.byte #%01010101
	.byte #%01100101
	.byte #%01110110
	.byte #%01110111
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%01111000
	.byte #%01110111
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10011000
	.byte #%10001000
	.byte #%01111000
	.byte #%01110111
	.byte #%01110111
	.byte #%10001000
	.byte #%10001000
	.byte #%01111000
	.byte #%01110111
	.byte #%01100111
	.byte #%01100110
	.byte #%01110110
	.byte #%01110111
	.byte #%01110111
	.byte #%10001000
	.byte #%10011001
	.byte #%10011001
	.byte #%10011000
	.byte #%10011001
	.byte #%10001000
	.byte #%10001000
	.byte #%01110111
	.byte #%01100111
	.byte #%01100110
	.byte #%01100110
	.byte #%01110110
	.byte #%01110111
	.byte #%10000111
	.byte #%10001000
	.byte #%10001001
	.byte #%10011000
	.byte #%10011001
	.byte #%10011001
	.byte #%10011010
	.byte #%10011001
	.byte #%10011001
	.byte #%10001001
	.byte #%10001000
	.byte #%01111000
	.byte #%10001000
	.byte #%01110111
	.byte #%01100111
	.byte #%01100110
	.byte #%01010110
	.byte #%01010101
	.byte #%01100101
	.byte #%01100110
	.byte #%01110111
	.byte #%10000111
	.byte #%10001000
	.byte #%10001000
	.byte #%01110111
	.byte #%01110111
	.byte #%10001000
	.byte #%01111000
	.byte #%01110111
	.byte #%01110111
	.byte #%10000111
	.byte #%10001000
	.byte #%10011000
	.byte #%10011000
	.byte #%10001001
	.byte #%01111000
	.byte #%01110111
	.byte #%01100111
	.byte #%01100110
	.byte #%01110110
	.byte #%01100110
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%10011000
	.byte #%10011001
	.byte #%10011001
	.byte #%10011001
	.byte #%10011001
	.byte #%10011001
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%01111000
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%10001000
	.byte #%01111000
	.byte #%01110111
	.byte #%01110111
	.byte #%10000111
	.byte #%01111000
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01111000
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%10001000
	.byte #%10000111
	.byte #%01110111
	.byte #%10000111
	.byte #%10011000
	.byte #%10011001
	.byte #%10101010
	.byte #%10011010
	.byte #%10101001
	.byte #%10011001
	.byte #%10011001
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%01111000
	.byte #%01110111
	.byte #%01100110
	.byte #%01110110
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%01110111
	.byte #%10000111
	.byte #%01111000
	.byte #%01010111
	.byte #%01100101
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01100110
	.byte #%01110110
	.byte #%01110111
	.byte #%01110111
	.byte #%01100110
	.byte #%10000111
	.byte #%10000111
	.byte #%01110111
	.byte #%01110111
	.byte #%10011000
	.byte #%10011001
	.byte #%10001000
	.byte #%01111000
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%10001000
	.byte #%10001000
	.byte #%01111000
	.byte #%01111000
	.byte #%10000111
	.byte #%10001000
	.byte #%10001000
	.byte #%01111000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%01100110
	.byte #%01100111
	.byte #%01110110
	.byte #%10000111
	.byte #%10011000
	.byte #%10001000
	.byte #%10011000
	.byte #%10101001
	.byte #%10001001
	.byte #%10001000
	.byte #%10011000
	.byte #%10011001
	.byte #%01111000
	.byte #%01110111
	.byte #%01110110
	.byte #%01110111
	.byte #%01100111
	.byte #%01100110
	.byte #%01110110
	.byte #%10000111
	.byte #%10001000
	.byte #%10000111
	.byte #%10000111
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001001
	.byte #%10001000
	.byte #%10001000
	.byte #%01100111
	.byte #%01100110
	.byte #%01110110
	.byte #%01110111
	.byte #%01110111
	.byte #%01110110
	.byte #%01110110
	.byte #%01100110
	.byte #%01110110
	.byte #%10001000
	.byte #%10001000
	.byte #%10011001
	.byte #%10101001
	.byte #%10101011
	.byte #%10101011
; Page 10
	.byte #%10001010
	.byte #%10011001
	.byte #%10011000
	.byte #%10011000
	.byte #%10000111
	.byte #%01110111
	.byte #%01100110
	.byte #%01010100
	.byte #%01110101
	.byte #%01100110
	.byte #%01110110
	.byte #%01100110
	.byte #%01100110
	.byte #%01110110
	.byte #%01010111
	.byte #%01010101
	.byte #%01000100
	.byte #%01110100
	.byte #%10001000
	.byte #%01111010
	.byte #%01110111
	.byte #%10001000
	.byte #%10001000
	.byte #%10011001
	.byte #%10101010
	.byte #%10101010
	.byte #%10101001
	.byte #%10011010
	.byte #%10011010
	.byte #%10001001
	.byte #%01111000
	.byte #%10000111
	.byte #%10000111
	.byte #%10001000
	.byte #%10011001
	.byte #%10011001
	.byte #%01100111
	.byte #%10000110
	.byte #%01111000
	.byte #%01111000
	.byte #%01110111
	.byte #%10000111
	.byte #%10001001
	.byte #%10011001
	.byte #%01101000
	.byte #%01100110
	.byte #%01110110
	.byte #%10000111
	.byte #%01110111
	.byte #%01110110
	.byte #%01110110
	.byte #%10001000
	.byte #%10000111
	.byte #%01100111
	.byte #%01100110
	.byte #%01110110
	.byte #%10000111
	.byte #%10011000
	.byte #%10001000
	.byte #%10011001
	.byte #%10011001
	.byte #%10011001
	.byte #%10011001
	.byte #%10001001
	.byte #%10000111
	.byte #%01111000
	.byte #%01110111
	.byte #%10000111
	.byte #%10001000
	.byte #%01110111
	.byte #%01100110
	.byte #%01110111
	.byte #%10000111
	.byte #%10011001
	.byte #%01110111
	.byte #%10000111
	.byte #%01100110
	.byte #%01111000
	.byte #%01101000
	.byte #%01111000
	.byte #%10000111
	.byte #%10001000
	.byte #%10011000
	.byte #%10000111
	.byte #%10011010
	.byte #%01111000
	.byte #%01110110
	.byte #%01010110
	.byte #%01100110
	.byte #%01110110
	.byte #%01100110
	.byte #%01100111
	.byte #%01110111
	.byte #%10010111
	.byte #%10001010
	.byte #%10011000
	.byte #%10101001
	.byte #%10011000
	.byte #%01111001
	.byte #%01101001
	.byte #%10010111
	.byte #%10001010
	.byte #%10001000
	.byte #%10000111
	.byte #%01110110
	.byte #%01110101
	.byte #%01100111
	.byte #%10000111
	.byte #%01011000
	.byte #%01100110
	.byte #%01110110
	.byte #%01100111
	.byte #%01110110
	.byte #%10011000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001001
	.byte #%10011010
	.byte #%10001001
	.byte #%10001010
	.byte #%10001000
	.byte #%10001000
	.byte #%10001001
	.byte #%10001001
	.byte #%10001001
	.byte #%10001000
	.byte #%01101000
	.byte #%01010110
	.byte #%01110110
	.byte #%01110111
	.byte #%01110111
	.byte #%01111000
	.byte #%01100111
	.byte #%10010111
	.byte #%01111000
	.byte #%01110110
	.byte #%10011000
	.byte #%01110110
	.byte #%10011001
	.byte #%10001001
	.byte #%10001000
	.byte #%10011010
	.byte #%01101001
	.byte #%01111000
	.byte #%01100111
	.byte #%01100110
	.byte #%01110110
	.byte #%01110111
	.byte #%01100111
	.byte #%01100110
	.byte #%01100111
	.byte #%01010110
	.byte #%01110101
	.byte #%01100110
	.byte #%10000101
	.byte #%01110111
	.byte #%01110111
	.byte #%01110110
	.byte #%01110111
	.byte #%10100111
	.byte #%10001000
	.byte #%01111000
	.byte #%10001000
	.byte #%01110111
	.byte #%10001000
	.byte #%10011000
	.byte #%10011010
	.byte #%10001000
	.byte #%01100111
	.byte #%10000111
	.byte #%10101000
	.byte #%10011001
	.byte #%10011000
	.byte #%01010110
	.byte #%01110110
	.byte #%10000111
	.byte #%10001001
	.byte #%10101010
	.byte #%01101000
	.byte #%01110111
	.byte #%10000110
	.byte #%10011001
	.byte #%10011010
	.byte #%01111000
	.byte #%01100111
	.byte #%01110110
	.byte #%10000111
	.byte #%10001000
	.byte #%01100111
	.byte #%01100111
	.byte #%01010101
	.byte #%10000110
	.byte #%10011000
	.byte #%10001001
	.byte #%10001001
	.byte #%01110111
	.byte #%10001000
	.byte #%10001000
	.byte #%10101001
	.byte #%10001001
	.byte #%10000111
	.byte #%10001000
	.byte #%10001000
	.byte #%10011001
	.byte #%01101000
	.byte #%01110111
	.byte #%01111000
	.byte #%01100111
	.byte #%01111000
	.byte #%01100111
	.byte #%01110110
	.byte #%01100111
	.byte #%01100110
	.byte #%10001000
	.byte #%10000111
	.byte #%10010111
	.byte #%01100110
	.byte #%01110101
	.byte #%10011001
	.byte #%10011000
	.byte #%10001000
	.byte #%01110111
	.byte #%10000111
	.byte #%10001001
	.byte #%10011001
	.byte #%01111000
	.byte #%01010110
	.byte #%01100101
	.byte #%01110111
	.byte #%10011000
	.byte #%10011000
	.byte #%01110111
	.byte #%01100110
	.byte #%01110111
	.byte #%10000111
	.byte #%10000111
	.byte #%01111000
	.byte #%01110110
	.byte #%10000111
	.byte #%01111000
	.byte #%10000111
	.byte #%10001010
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%10001000
	.byte #%10001001
	.byte #%01111001
	.byte #%01110111
	.byte #%01111000
	.byte #%10001000
	.byte #%10101001
	.byte #%10001001
	.byte #%10001000
	.byte #%10011001
; Page 11
	.byte #%10001001
	.byte #%10011000
	.byte #%10001001
	.byte #%10011001
	.byte #%10011001
	.byte #%10011001
	.byte #%10001001
	.byte #%01111000
	.byte #%01110110
	.byte #%01110111
	.byte #%01111000
	.byte #%01110111
	.byte #%01100111
	.byte #%01100110
	.byte #%01100110
	.byte #%01100110
	.byte #%01100110
	.byte #%01110111
	.byte #%01110110
	.byte #%01110111
	.byte #%01100110
	.byte #%01100110
	.byte #%01010101
	.byte #%01100101
	.byte #%01110110
	.byte #%01110110
	.byte #%01110111
	.byte #%10000111
	.byte #%10001000
	.byte #%10001000
	.byte #%01111000
	.byte #%01110111
	.byte #%01110111
	.byte #%10000111
	.byte #%10001000
	.byte #%10000111
	.byte #%10101000
	.byte #%10001000
	.byte #%10101000
	.byte #%10011001
	.byte #%10011010
	.byte #%10001001
	.byte #%01111000
	.byte #%10000111
	.byte #%10011000
	.byte #%10111010
	.byte #%10111011
	.byte #%10101011
	.byte #%01111001
	.byte #%01010110
	.byte #%01100101
	.byte #%01100110
	.byte #%10000111
	.byte #%01111000
	.byte #%01100110
	.byte #%01100110
	.byte #%01100110
	.byte #%01110111
	.byte #%01100111
	.byte #%01100101
	.byte #%01110110
	.byte #%10001000
	.byte #%10011001
	.byte #%10001000
	.byte #%10011000
	.byte #%10011001
	.byte #%10001001
	.byte #%10011000
	.byte #%10001001
	.byte #%10001000
	.byte #%10011001
	.byte #%01100111
	.byte #%01100101
	.byte #%01110111
	.byte #%10101001
	.byte #%10111011
	.byte #%10101011
	.byte #%01111001
	.byte #%01000101
	.byte #%01000100
	.byte #%01000011
	.byte #%01110101
	.byte #%10001000
	.byte #%01111000
	.byte #%01010110
	.byte #%01000100
	.byte #%01010101
	.byte #%10000111
	.byte #%10011001
	.byte #%01111000
	.byte #%01110111
	.byte #%01110111
	.byte #%10011000
	.byte #%10011010
	.byte #%10011010
	.byte #%10101001
	.byte #%01101000
	.byte #%01110111
	.byte #%10111001
	.byte #%10101100
	.byte #%01010111
	.byte #%00110100
	.byte #%01100100
	.byte #%10111000
	.byte #%11111111
	.byte #%11111111
	.byte #%10011101
	.byte #%00100100
	.byte #%00000000
	.byte #%00110000
	.byte #%10111000
	.byte #%11001101
	.byte #%10001010
	.byte #%01000110
	.byte #%00000000
	.byte #%00000000
	.byte #%01010010
	.byte #%10010111
	.byte #%11001011
	.byte #%10001010
	.byte #%01010110
	.byte #%01100101
	.byte #%10000111
	.byte #%11001010
	.byte #%11011101
	.byte #%10101011
	.byte #%10011011
	.byte #%10101010
	.byte #%10101001
	.byte #%11011101
	.byte #%10001011
	.byte #%01000110
	.byte #%01110100
	.byte #%10001000
	.byte #%11011010
	.byte #%11111111
	.byte #%10011101
	.byte #%00100101
	.byte #%00000001
	.byte #%00010000
	.byte #%01110100
	.byte #%11001010
	.byte #%10011011
	.byte #%01000111
	.byte #%00000001
	.byte #%00000000
	.byte #%01000000
	.byte #%10010111
	.byte #%10111011
	.byte #%10011010
	.byte #%01010111
	.byte #%00110011
	.byte #%01110100
	.byte #%10111001
	.byte #%11001011
	.byte #%10011010
	.byte #%10000111
	.byte #%10011001
	.byte #%01111001
	.byte #%11001001
	.byte #%11011110
	.byte #%01101010
	.byte #%01010100
	.byte #%10000111
	.byte #%10101000
	.byte #%11111101
	.byte #%11111111
	.byte #%10011110
	.byte #%01000101
	.byte #%00000010
	.byte #%00010000
	.byte #%10010101
	.byte #%11011101
	.byte #%10101100
	.byte #%01011000
	.byte #%00000010
	.byte #%00000000
	.byte #%01010010
	.byte #%10000111
	.byte #%10101001
	.byte #%01111001
	.byte #%00110101
	.byte #%00100001
	.byte #%01110101
	.byte #%10101001
	.byte #%10101010
	.byte #%10101011
	.byte #%10001001
	.byte #%01111000
	.byte #%10110111
	.byte #%10001100
	.byte #%10111000
	.byte #%11101110
	.byte #%10001100
	.byte #%00100011
	.byte #%01010100
	.byte #%01100101
	.byte #%11011001
	.byte #%11111111
	.byte #%10111111
	.byte #%00110110
	.byte #%00000001
	.byte #%00000000
	.byte #%01010001
	.byte #%11011010
	.byte #%10111100
	.byte #%10001001
	.byte #%00110110
	.byte #%00000001
	.byte #%01000001
	.byte #%10011000
	.byte #%10111011
	.byte #%10011011
	.byte #%01010111
	.byte #%00110011
	.byte #%01100101
	.byte #%10101000
	.byte #%11001011
	.byte #%10011011
	.byte #%10001001
	.byte #%01100110
	.byte #%11001001
	.byte #%01111010
	.byte #%10100111
	.byte #%11011101
	.byte #%01101010
	.byte #%00100010
	.byte #%01100100
	.byte #%10000111
	.byte #%11101011
	.byte #%11111111
	.byte #%10011111
	.byte #%00110101
	.byte #%00000010
	.byte #%00000000
	.byte #%01110011
	.byte #%11011011
	.byte #%10011011
	.byte #%01111000
	.byte #%00100101
	.byte #%00000000
	.byte #%01000001
	.byte #%10010111
	.byte #%10111010
	.byte #%10111100
	.byte #%10001010
	.byte #%01100110
	.byte #%01110110
	.byte #%10011000
	.byte #%11001010
	.byte #%10111100
	.byte #%10001001
	.byte #%01110111
	.byte #%10010111
	.byte #%10001011
	.byte #%10000110
; Page 12
	.byte #%11001011
	.byte #%01101010
	.byte #%00100011
	.byte #%01100011
	.byte #%01110111
	.byte #%10101000
	.byte #%11111101
	.byte #%10101111
	.byte #%00110110
	.byte #%00010010
	.byte #%00000000
	.byte #%01010010
	.byte #%11001010
	.byte #%10111101
	.byte #%01111001
	.byte #%01000110
	.byte #%00000010
	.byte #%00110001
	.byte #%10000110
	.byte #%10011001
	.byte #%10011001
	.byte #%10011001
	.byte #%01100111
	.byte #%01110110
	.byte #%10011000
	.byte #%10101001
	.byte #%10111011
	.byte #%10101010
	.byte #%10101010
	.byte #%10011000
	.byte #%11011100
	.byte #%01111010
	.byte #%11011001
	.byte #%10101110
	.byte #%00100110
	.byte #%00110001
	.byte #%01110101
	.byte #%01111000
	.byte #%11001000
	.byte #%11111111
	.byte #%01011010
	.byte #%00010010
	.byte #%00000001
	.byte #%00000000
	.byte #%01010001
	.byte #%10111001
	.byte #%10101100
	.byte #%10001010
	.byte #%01010111
	.byte #%00100011
	.byte #%01010011
	.byte #%01110110
	.byte #%10011000
	.byte #%11001011
	.byte #%10101100
	.byte #%10001000
	.byte #%10011000
	.byte #%10001001
	.byte #%10011000
	.byte #%10111010
	.byte #%10011001
	.byte #%10001001
	.byte #%01111000
	.byte #%10101000
	.byte #%01111010
	.byte #%10000110
	.byte #%10111011
	.byte #%00110111
	.byte #%00010010
	.byte #%01000010
	.byte #%01110111
	.byte #%10111000
	.byte #%11111111
	.byte #%10111111
	.byte #%01100111
	.byte #%00110101
	.byte #%00000000
	.byte #%00010000
	.byte #%10000100
	.byte #%10101001
	.byte #%10101010
	.byte #%10001010
	.byte #%00110110
	.byte #%00100010
	.byte #%01010011
	.byte #%10000111
	.byte #%10101001
	.byte #%11001100
	.byte #%10111011
	.byte #%10011010
	.byte #%10011001
	.byte #%10101010
	.byte #%10011001
	.byte #%11001010
	.byte #%10101100
	.byte #%10001001
	.byte #%10001000
	.byte #%10011001
	.byte #%01010110
	.byte #%10100110
	.byte #%10001011
	.byte #%00000011
	.byte #%00100000
	.byte #%01010011
	.byte #%01110110
	.byte #%11101011
	.byte #%11111111
	.byte #%01101011
	.byte #%00110011
	.byte #%00000010
	.byte #%00000000
	.byte #%01100011
	.byte #%11001010
	.byte #%11001101
	.byte #%10101010
	.byte #%01111001
	.byte #%00010011
	.byte #%01010010
	.byte #%01110110
	.byte #%10101000
	.byte #%10101011
	.byte #%10011010
	.byte #%10001000
	.byte #%10011000
	.byte #%10011001
	.byte #%10101001
	.byte #%10111010
	.byte #%11001100
	.byte #%11001100
	.byte #%10011011
	.byte #%10101001
	.byte #%10011011
	.byte #%01010110
	.byte #%10111000
	.byte #%01101010
	.byte #%00000010
	.byte #%00110001
	.byte #%01100101
	.byte #%01110110
	.byte #%11001001
	.byte #%11011110
	.byte #%01001001
	.byte #%00110010
	.byte #%00000010
	.byte #%00000000
	.byte #%01100011
	.byte #%11011011
	.byte #%10111100
	.byte #%10101010
	.byte #%01101000
	.byte #%00010011
	.byte #%01000001
	.byte #%10000110
	.byte #%10011000
	.byte #%10111010
	.byte #%10111011
	.byte #%10001001
	.byte #%01110111
	.byte #%10000111
	.byte #%10001000
	.byte #%10101001
	.byte #%10101011
	.byte #%10001010
	.byte #%10001000
	.byte #%10000111
	.byte #%10011001
	.byte #%01111000
	.byte #%10111000
	.byte #%10111101
	.byte #%00110111
	.byte #%00110010
	.byte #%01100101
	.byte #%10011000
	.byte #%11011011
	.byte #%11111111
	.byte #%10011110
	.byte #%00100100
	.byte #%00100010
	.byte #%00010001
	.byte #%01000010
	.byte #%10100111
	.byte #%11001100
	.byte #%01111010
	.byte #%01010110
	.byte #%00100011
	.byte #%00110010
	.byte #%01110110
	.byte #%10101001
	.byte #%10111011
	.byte #%10101010
	.byte #%01111001
	.byte #%01110110
	.byte #%10011000
	.byte #%10011001
	.byte #%10011001
	.byte #%01111000
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%10000111
	.byte #%10001010
	.byte #%01000110
	.byte #%10010101
	.byte #%01111010
	.byte #%00000011
	.byte #%00110000
	.byte #%10000101
	.byte #%10111011
	.byte #%11101100
	.byte #%11111111
	.byte #%01111101
	.byte #%00010011
	.byte #%00110010
	.byte #%01010100
	.byte #%10010111
	.byte #%11011011
	.byte #%11011110
	.byte #%01111010
	.byte #%01010101
	.byte #%00110100
	.byte #%00110011
	.byte #%10000101
	.byte #%10111010
	.byte #%10101011
	.byte #%10011001
	.byte #%10001000
	.byte #%10001000
	.byte #%10101001
	.byte #%10111011
	.byte #%10101010
	.byte #%10001001
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%01111000
	.byte #%10000111
	.byte #%00110110
	.byte #%01010011
	.byte #%10011000
	.byte #%01000111
	.byte #%00000001
	.byte #%00110000
	.byte #%10101000
	.byte #%10101010
	.byte #%11101011
	.byte #%10111110
	.byte #%00110111
	.byte #%00000000
	.byte #%00110000
	.byte #%01110110
	.byte #%10101000
	.byte #%11101100
	.byte #%10111101
	.byte #%01011000
	.byte #%00110011
	.byte #%01000011
; Page 13
	.byte #%01010100
	.byte #%10010111
	.byte #%10111010
	.byte #%10001001
	.byte #%01100111
	.byte #%10000110
	.byte #%10011001
	.byte #%10011000
	.byte #%10011010
	.byte #%10001000
	.byte #%10011000
	.byte #%10101010
	.byte #%10111011
	.byte #%10101011
	.byte #%10011001
	.byte #%10101001
	.byte #%01111010
	.byte #%01110110
	.byte #%10111001
	.byte #%01111010
	.byte #%00010100
	.byte #%00100000
	.byte #%10010110
	.byte #%10101010
	.byte #%11001011
	.byte #%10111101
	.byte #%01011000
	.byte #%00000001
	.byte #%00010000
	.byte #%01110101
	.byte #%10101000
	.byte #%11011011
	.byte #%11001101
	.byte #%10001010
	.byte #%01000101
	.byte #%01010100
	.byte #%01110110
	.byte #%10010111
	.byte #%10101001
	.byte #%10101010
	.byte #%01111001
	.byte #%01110111
	.byte #%10001000
	.byte #%10001000
	.byte #%01110111
	.byte #%10000111
	.byte #%10011001
	.byte #%10001000
	.byte #%10011001
	.byte #%10001001
	.byte #%01111000
	.byte #%01110110
	.byte #%01100111
	.byte #%01010101
	.byte #%10010111
	.byte #%01111000
	.byte #%00010100
	.byte #%00000000
	.byte #%10000011
	.byte #%11011011
	.byte #%11001101
	.byte #%10011100
	.byte #%01011000
	.byte #%00000010
	.byte #%00000000
	.byte #%01100010
	.byte #%10111001
	.byte #%11001100
	.byte #%10101011
	.byte #%10001001
	.byte #%01010110
	.byte #%01000100
	.byte #%10000101
	.byte #%10111010
	.byte #%10111011
	.byte #%10111100
	.byte #%10101011
	.byte #%10101010
	.byte #%10101001
	.byte #%10111001
	.byte #%10101010
	.byte #%10001001
	.byte #%10001001
	.byte #%10101001
	.byte #%10101010
	.byte #%10001000
	.byte #%01100111
	.byte #%01010101
	.byte #%01110110
	.byte #%01100111
	.byte #%10000111
	.byte #%10011001
	.byte #%01101000
	.byte #%00010011
	.byte #%00010000
	.byte #%10000100
	.byte #%11101011
	.byte #%11001101
	.byte #%10101011
	.byte #%01101000
	.byte #%00010011
	.byte #%00000000
	.byte #%01100010
	.byte #%10111001
	.byte #%11001100
	.byte #%10001010
	.byte #%01010110
	.byte #%00110100
	.byte #%01000011
	.byte #%10000110
	.byte #%10111001
	.byte #%10111011
	.byte #%10011010
	.byte #%10001001
	.byte #%10001000
	.byte #%10001000
	.byte #%10101001
	.byte #%10101010
	.byte #%10011001
	.byte #%01111000
	.byte #%01110111
	.byte #%10000111
	.byte #%10011001
	.byte #%01111000
	.byte #%01010110
	.byte #%01010101
	.byte #%01100110
	.byte #%01100110
	.byte #%10000111
	.byte #%01111000
	.byte #%01000110
	.byte #%00100010
	.byte #%01110011
	.byte #%11001010
	.byte #%11101110
	.byte #%10101100
	.byte #%01111001
	.byte #%01000101
	.byte #%00100011
	.byte #%01000011
	.byte #%10000110
	.byte #%10111010
	.byte #%10111100
	.byte #%10001010
	.byte #%01010110
	.byte #%01000100
	.byte #%01100101
	.byte #%10000111
	.byte #%10101001
	.byte #%10101010
	.byte #%10101010
	.byte #%10101010
	.byte #%10101010
	.byte #%10101010
	.byte #%10001001
	.byte #%10001000
	.byte #%10011000
	.byte #%10011001
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%01110111
	.byte #%01010101
	.byte #%01000100
	.byte #%01010100
	.byte #%01100101
	.byte #%01100110
	.byte #%01010110
	.byte #%00110100
	.byte #%00110011
	.byte #%01110100
	.byte #%10111001
	.byte #%11011100
	.byte #%11001101
	.byte #%10011010
	.byte #%10001001
	.byte #%01100111
	.byte #%01010101
	.byte #%01100101
	.byte #%10000111
	.byte #%10101001
	.byte #%10111011
	.byte #%10101010
	.byte #%10011001
	.byte #%01111000
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%10001000
	.byte #%10011001
	.byte #%10011001
	.byte #%10011001
	.byte #%10001001
	.byte #%01110111
	.byte #%01100110
	.byte #%01110111
	.byte #%01100111
	.byte #%01100110
	.byte #%10101000
	.byte #%10011010
	.byte #%01010111
	.byte #%00110011
	.byte #%00110010
	.byte #%01000011
	.byte #%01010101
	.byte #%10010110
	.byte #%10001001
	.byte #%01100111
	.byte #%01110110
	.byte #%01100111
	.byte #%01000101
	.byte #%10000110
	.byte #%10011001
	.byte #%10101010
	.byte #%10111011
	.byte #%10101011
	.byte #%10011001
	.byte #%01101000
	.byte #%01110111
	.byte #%01100111
	.byte #%01110110
	.byte #%01111000
	.byte #%10001000
	.byte #%10001000
	.byte #%10011000
	.byte #%10001000
	.byte #%01111000
	.byte #%10001000
	.byte #%10011000
	.byte #%10011000
	.byte #%10101010
	.byte #%10111011
	.byte #%10011010
	.byte #%10001000
	.byte #%01110111
	.byte #%01110111
	.byte #%10000111
	.byte #%10001000
	.byte #%10001001
	.byte #%10001001
	.byte #%01110111
	.byte #%01100110
	.byte #%01100110
	.byte #%01010110
	.byte #%01010101
	.byte #%01100101
	.byte #%01100110
	.byte #%01110110
	.byte #%01100110
	.byte #%01000100
	.byte #%01100101
	.byte #%10010111
	.byte #%10101001
	.byte #%10101001
	.byte #%10001001
	.byte #%10011000
; Page 14
	.byte #%10011001
	.byte #%10011001
	.byte #%01111000
EndPoint133
	.byte #%10000000

end
 	bank 5
	
Not_Great2
	asm
ResetPointer2
	LDA	#<WaveTable2
	STA	SoundPointer
	LDA	#>WaveTable2
	STA	SoundPointer+1 ; Reset Soundpointer
LoadSample2
	LDX	#SoundPointer
	LDA	(0,x)
	CMP	#%10000000
	BEQ	VerticalSync2
	INC	0,x
	BNE	*+4
	INC	1,x ; Load pointer, increase
	LDY	#11
DELAY12
	nop
	nop
	nop
	DEY
	BNE	DELAY12
	STA	AUDV0
	lsr
	lsr
	lsr
	lsr
	LDY	#12
DELAY22
	nop
	nop
	nop
	DEY
	BNE	DELAY22
	STA	AUDV0
	JMP	LoadSample2
VerticalSync2
	LDA	#0
	STA	AUDV0
	STA	TIM1T
	JMP	.GotoGame
	
WaveTable2
	.byte #%01100110
	.byte #%01100110
	.byte #%01100110
	.byte #%01100110
	.byte #%01110111
	.byte #%10001000
	.byte #%10011001
	.byte #%10011001
	.byte #%10011001
	.byte #%10001001
	.byte #%10001000
	.byte #%10001001
	.byte #%01111000
	.byte #%10000111
	.byte #%10000111
	.byte #%10001000
	.byte #%01110111
	.byte #%10000111
	.byte #%01101000
	.byte #%10000111
	.byte #%10010111
	.byte #%10000111
	.byte #%01111000
	.byte #%01101000
	.byte #%01010110
	.byte #%01010101
	.byte #%01010101
	.byte #%01100101
	.byte #%01110110
	.byte #%10000111
	.byte #%01100111
	.byte #%01110110
	.byte #%10010111
	.byte #%10111100
	.byte #%10101010
	.byte #%10101010
	.byte #%10101011
	.byte #%10001010
	.byte #%10001001
	.byte #%10011010
	.byte #%10011001
	.byte #%10001001
	.byte #%10001000

	.byte #%01110111
	.byte #%01100111
	.byte #%01110101
	.byte #%10000111
	.byte #%10001000
	.byte #%01111000
	.byte #%01110111
	.byte #%10000111
	.byte #%10001000
	.byte #%10001000
	.byte #%10001001
	.byte #%10011001
	.byte #%10001001
	.byte #%01111000
	.byte #%01110111
	.byte #%01111000
	.byte #%01100111
	.byte #%01000101
	.byte #%01000100
	.byte #%01000100
	.byte #%01010100
	.byte #%01100110
	.byte #%01110110
	.byte #%01100111
	.byte #%01100101
	.byte #%01100110
	.byte #%10000111
	.byte #%01110111
	.byte #%10000110
	.byte #%10000111
	.byte #%10011000
	.byte #%10101010
	.byte #%10111010
	.byte #%10101010
	.byte #%10101010
	.byte #%10101011
	.byte #%10011010
	.byte #%10101001
	.byte #%10101010
	.byte #%10001001
	.byte #%10001000
	.byte #%01110111
	.byte #%10001000
	.byte #%01110111
	.byte #%10000111
	.byte #%10001000
	.byte #%10001000
	.byte #%01111000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10011001
	.byte #%10011001
	.byte #%10001001
	.byte #%01100111
	.byte #%01100110
	.byte #%01110111
	.byte #%01100110
	.byte #%01100110
	.byte #%01100111
	.byte #%01010110
	.byte #%00110100
	.byte #%01000011
	.byte #%01010011
	.byte #%01010100
	.byte #%01010101
	.byte #%01100101
	.byte #%01110110
	.byte #%01100111
	.byte #%01110110
	.byte #%10011000
	.byte #%11001010
	.byte #%11101110
	.byte #%11001101
	.byte #%10101011
	.byte #%10001001
	.byte #%01110111
	.byte #%01110111
	.byte #%01111000
	.byte #%01111000
	.byte #%01100111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%10000111
	.byte #%10011000
	.byte #%10011001
	.byte #%10011000
	.byte #%10001000
	.byte #%01111000
	.byte #%10001000
	.byte #%10011000
	.byte #%10011001
	.byte #%10011001
	.byte #%10001001
	.byte #%10001000
	.byte #%10011000
	.byte #%10011001
	.byte #%10001001
	.byte #%10001000
	.byte #%01110111
	.byte #%01100110
	.byte #%01100110
	.byte #%01100110
	.byte #%10000111
	.byte #%10010111
	.byte #%10001000
	.byte #%01100111
	.byte #%01010101
	.byte #%01010100
	.byte #%10000110
	.byte #%11001010
	.byte #%11011101
	.byte #%10011011
	.byte #%01010111
	.byte #%00100011
	.byte #%00110010
	.byte #%01010100
	.byte #%01100110
	.byte #%01100110
	.byte #%01110110
	.byte #%10011000
	.byte #%10011001
	.byte #%10001001
	.byte #%01110111
	.byte #%01110111
	.byte #%10000111
	.byte #%10101001
	.byte #%10101010
	.byte #%10101001
	.byte #%10011001
	.byte #%10001000
	.byte #%10001000
	.byte #%10000111
	.byte #%10000111
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001001
	.byte #%01110111
	.byte #%01010111
	.byte #%01010101
	.byte #%01010111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01010110
	.byte #%01000110
	.byte #%01100101
	.byte #%10100111
	.byte #%11011010
	.byte #%11011101
	.byte #%10101011
	.byte #%01111001
	.byte #%01010110
	.byte #%01110101
	.byte #%10000110
	.byte #%10001001
	.byte #%10011001
	.byte #%10001000
	.byte #%10011001
	.byte #%10011001
	.byte #%10011001
	.byte #%01111000
	.byte #%01110111
	.byte #%01110110
	.byte #%10011000
	.byte #%10011011
	.byte #%10101010
	.byte #%10101010
	.byte #%10011010
	.byte #%10001000
	.byte #%01010110
	.byte #%01010101
	.byte #%01110110
	.byte #%10000111
	.byte #%01111000
	.byte #%01010110
	.byte #%01000101
	.byte #%00100011
	.byte #%00110011
	.byte #%01000100
	.byte #%01010101
	.byte #%01100110
	.byte #%01110111
	.byte #%01110111
	.byte #%01010110
	.byte #%01010101
	.byte #%01110101
	.byte #%10111000
	.byte #%11101100
	.byte #%11001101
	.byte #%10011011
	.byte #%01000110
	.byte #%00110100
	.byte #%01100101
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10011001
	.byte #%10011001
	.byte #%10001001
	.byte #%10001000
	.byte #%01110111
	.byte #%10000111
	.byte #%10101001
	.byte #%10111011
	.byte #%10101010
; Page 15
	.byte #%10011001
	.byte #%10101001
	.byte #%10101010
	.byte #%10001001
	.byte #%10001000
	.byte #%01110111
	.byte #%10010111
	.byte #%10011001
	.byte #%10001001
	.byte #%01111000
	.byte #%01010101
	.byte #%01010101
	.byte #%01010100
	.byte #%01010101
	.byte #%01100101
	.byte #%01100101
	.byte #%01100101
	.byte #%01110110
	.byte #%01010110
	.byte #%01010101
	.byte #%01110101
	.byte #%10101001
	.byte #%11011100
	.byte #%11001101
	.byte #%10001010
	.byte #%01100111
	.byte #%01100101
	.byte #%01110111
	.byte #%10001000
	.byte #%01111000
	.byte #%01110111
	.byte #%01110111
	.byte #%10001000
	.byte #%10001001
	.byte #%01111000
	.byte #%01010110
	.byte #%01100101
	.byte #%01110111
	.byte #%10001000
	.byte #%10011000
	.byte #%10011001
	.byte #%10001001
	.byte #%10001000
	.byte #%01110111
	.byte #%01100101
	.byte #%01100100
	.byte #%10000110
	.byte #%10011000
	.byte #%10001001
	.byte #%01110111
	.byte #%01010110
	.byte #%01000100
	.byte #%01010101
	.byte #%01100101
	.byte #%10000111
	.byte #%10011000
	.byte #%10001001
	.byte #%01111000
	.byte #%01110111
	.byte #%01100110
	.byte #%10000110
	.byte #%10111001
	.byte #%11101100
	.byte #%11011101
	.byte #%10101100
	.byte #%01111000
	.byte #%01100110
	.byte #%01110110
	.byte #%10001000
	.byte #%10001000
	.byte #%10001001
	.byte #%10001001
	.byte #%10001000
	.byte #%10001001
	.byte #%10001000
	.byte #%01100111
	.byte #%01100110
	.byte #%01100110
	.byte #%10001000
	.byte #%10011000
	.byte #%10101001
	.byte #%10011001
	.byte #%10001000
	.byte #%01110111
	.byte #%10001000
	.byte #%10000111
	.byte #%10011000
	.byte #%10011001
	.byte #%10011010
	.byte #%01111000
	.byte #%01100111
	.byte #%01010101
	.byte #%01000101
	.byte #%01010101
	.byte #%01010110
	.byte #%01010110
	.byte #%01100110
	.byte #%01110110
	.byte #%01110111
	.byte #%01100111
	.byte #%01100110
	.byte #%01110110
	.byte #%10101000
	.byte #%11001011
	.byte #%10101011
	.byte #%10001010
	.byte #%01010110
	.byte #%01000100
	.byte #%01010100
	.byte #%01100110
	.byte #%01100111
	.byte #%01110111
	.byte #%10001000
	.byte #%10101001
	.byte #%10011001
	.byte #%10001001
	.byte #%01110111
	.byte #%01110111
	.byte #%10001000
	.byte #%10011000
	.byte #%10101010
	.byte #%10111010
	.byte #%10101010
	.byte #%10011010
	.byte #%01111000
	.byte #%01100110
	.byte #%01110110
	.byte #%10011000
	.byte #%10011001
	.byte #%10001001
	.byte #%01100111
	.byte #%01100110
	.byte #%01010110
	.byte #%01100110
	.byte #%01110110
	.byte #%10000111
	.byte #%10000111
	.byte #%10001000
	.byte #%10001000
	.byte #%01111000
	.byte #%01010110
	.byte #%01100101
	.byte #%10000111
	.byte #%10111010
	.byte #%10111011
	.byte #%10011010
	.byte #%01111000
	.byte #%01010110
	.byte #%01010101
	.byte #%01110110
	.byte #%01110111
	.byte #%01110111
	.byte #%10000111
	.byte #%10011000
	.byte #%10101001
	.byte #%10001001
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10000111
	.byte #%10011000
	.byte #%10111010
	.byte #%10101011
	.byte #%10011001
	.byte #%01111001
	.byte #%01100111
	.byte #%01010101
	.byte #%01010101
	.byte #%01110110
	.byte #%01110111
	.byte #%01110111
	.byte #%01100110
	.byte #%01010101
	.byte #%01010101
	.byte #%01100101
	.byte #%01110110
	.byte #%10000111
	.byte #%10011001
	.byte #%10001001
	.byte #%10001000
	.byte #%01111000
	.byte #%01110111
	.byte #%10001000
	.byte #%10001001
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%01111000
	.byte #%01110111
	.byte #%01100110
	.byte #%01100110
	.byte #%01110110
	.byte #%01110111
	.byte #%10000111
	.byte #%10000111
	.byte #%10001000
	.byte #%10011000
	.byte #%10011001
	.byte #%10001001
	.byte #%01111000
	.byte #%01111000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001001
	.byte #%01111000
	.byte #%01110111
	.byte #%01100111
	.byte #%01100110
	.byte #%01100111
	.byte #%01100111
	.byte #%01100111
	.byte #%01110111
	.byte #%01110111
	.byte #%10000111
	.byte #%10000111
	.byte #%10000111
	.byte #%10011000
	.byte #%10011001
	.byte #%10001001
	.byte #%01111000
	.byte #%01110111
	.byte #%10000111
	.byte #%10101001
	.byte #%10101010
	.byte #%10001001
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10011001
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%01111000
	.byte #%10000111
	.byte #%10001000
	.byte #%10001000
	.byte #%10001001
	.byte #%10001000
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%10000111
	.byte #%01111000
	.byte #%01100110
	.byte #%01110110
	.byte #%01100110
	.byte #%01100110
	.byte #%01100101
	.byte #%01100101
	.byte #%01100101
	.byte #%01100110
	.byte #%01110110
	.byte #%01100110
; Page 16
	.byte #%01110110
	.byte #%01110111
	.byte #%10000111
	.byte #%10000111
	.byte #%10000111
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%01110111
	.byte #%01110111
	.byte #%10001000
	.byte #%10011000
	.byte #%10001000
	.byte #%10001000
	.byte #%10011000
	.byte #%10011001
	.byte #%10011001
	.byte #%10011001
	.byte #%10011001
	.byte #%10011000
	.byte #%10011000
	.byte #%10011000
	.byte #%10011001
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%01110111
	.byte #%01110111
	.byte #%01100111
	.byte #%01110111
	.byte #%01110111
	.byte #%01100111
	.byte #%01110111
	.byte #%10000111
	.byte #%01110111
	.byte #%01110110
	.byte #%01110111
	.byte #%01110110
	.byte #%10000110
	.byte #%10011000
	.byte #%10011001
	.byte #%10001000
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%10000111
	.byte #%01110111
	.byte #%01100110
	.byte #%01100110
	.byte #%01100110
	.byte #%01100110
	.byte #%01100111
	.byte #%01110111
	.byte #%01110111
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%01111000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10000111
	.byte #%10000111
	.byte #%10011000
	.byte #%10011010
	.byte #%10001001
	.byte #%01111000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%01110111
	.byte #%10000111
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%01111000
	.byte #%01100111
	.byte #%01110111
	.byte #%10000111
	.byte #%10001001
	.byte #%10000111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%10001000
	.byte #%10001000
	.byte #%01110111
	.byte #%01110111
	.byte #%01100110
	.byte #%01100110
	.byte #%01100110
	.byte #%01110110
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%10000111
	.byte #%10001000
	.byte #%10011000
	.byte #%10001001
	.byte #%10001000
	.byte #%10001000
	.byte #%10011001
	.byte #%10011010
	.byte #%10011001
	.byte #%10011001
	.byte #%10001000
	.byte #%10000111
	.byte #%01110111
	.byte #%01110110
	.byte #%01110110
	.byte #%10000111
	.byte #%10001000
	.byte #%10001000
	.byte #%01110111
	.byte #%01110111
	.byte #%10001000
	.byte #%10011001
	.byte #%10001000
	.byte #%01110111
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%01111000
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110110
	.byte #%01110111
	.byte #%01110111
	.byte #%10001000
	.byte #%10001000
	.byte #%01111000
	.byte #%01110111
	.byte #%10001000
	.byte #%01111000
	.byte #%01100111
	.byte #%01100110
	.byte #%01110110
	.byte #%10000111
	.byte #%10001000
	.byte #%01111000
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%10001000
	.byte #%10001000
	.byte #%01110111
	.byte #%01110111
	.byte #%01100111
	.byte #%01110111
	.byte #%01110110
	.byte #%01110111
	.byte #%10001000
	.byte #%01111000
	.byte #%01111000
	.byte #%10001000
	.byte #%10001000
	.byte #%10000111
	.byte #%10001000
	.byte #%10011000
	.byte #%10011000
	.byte #%10001001
	.byte #%10001000
	.byte #%10001000
	.byte #%10000111
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%01111000
	.byte #%01110111
	.byte #%01100111
	.byte #%01110110
	.byte #%10001000
	.byte #%10011000
	.byte #%10011001
	.byte #%10011001
	.byte #%10001000
	.byte #%01110111
	.byte #%10001000
	.byte #%10011000
	.byte #%10011001
	.byte #%01111000
	.byte #%10001000
	.byte #%10001000
	.byte #%01111000
	.byte #%01110111
	.byte #%01110110
	.byte #%01110111
	.byte #%01100111
	.byte #%01100110
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01100111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%01111000
	.byte #%01110111
	.byte #%10000111
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10011000
	.byte #%10011001
	.byte #%10001000
	.byte #%01111000
	.byte #%01110111
	.byte #%01110111
	.byte #%10000111
	.byte #%10001000
	.byte #%01110111
	.byte #%01110111
	.byte #%01111000
	.byte #%10000111
	.byte #%10001000
	.byte #%10001000
	.byte #%01111000
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01111000
	.byte #%10001000
	.byte #%01110111
	.byte #%01100111
	.byte #%01110111
	.byte #%01110111
	.byte #%10000111
	.byte #%10011000
	.byte #%10001001
	.byte #%10001000
	.byte #%01110111
	.byte #%01110111
	.byte #%01100110
	.byte #%01110110
	.byte #%01110111
	.byte #%01110111
	.byte #%01100110
; Page 17
	.byte #%01100110
	.byte #%01110110
	.byte #%01110111
	.byte #%01110111
	.byte #%10000111
	.byte #%10011000
	.byte #%10001000
	.byte #%10011001
	.byte #%10101010
	.byte #%10011010
	.byte #%10011001
	.byte #%10001001
	.byte #%01110111
	.byte #%01110111
	.byte #%10000111
	.byte #%10011001
	.byte #%10011001
	.byte #%10001001
	.byte #%01110111
	.byte #%10000111
	.byte #%01110111
	.byte #%01110111
	.byte #%10001000
	.byte #%10001000
	.byte #%01110111
	.byte #%01110111
	.byte #%10000111
	.byte #%10000111
	.byte #%10001000
	.byte #%10001000
	.byte #%01111000
	.byte #%01111000
	.byte #%01100111
	.byte #%01110111
	.byte #%10000111
	.byte #%01110111
	.byte #%01100110
	.byte #%01110111
	.byte #%01100110
	.byte #%01110101
	.byte #%01100111
	.byte #%10000111
	.byte #%10111001
	.byte #%10001100
	.byte #%01110100
	.byte #%01110101
	.byte #%10000110
	.byte #%10001000
	.byte #%01110110
	.byte #%01010101
	.byte #%01100110
	.byte #%10000111
	.byte #%10011001
	.byte #%10001001
	.byte #%10001001
	.byte #%10001000
	.byte #%10001000
	.byte #%01111000
	.byte #%01100111
	.byte #%01110110
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%10011000
	.byte #%10011000
	.byte #%10001001
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001001
	.byte #%10001000
	.byte #%10001000
	.byte #%10011000
	.byte #%10001000
	.byte #%10001000
	.byte #%10011000
	.byte #%10001001
	.byte #%10001000
	.byte #%01110111
	.byte #%10011000
	.byte #%10001001
	.byte #%01110111
	.byte #%01110111
	.byte #%10000111
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10000111
	.byte #%10001000
	.byte #%10001000
	.byte #%01111000
	.byte #%01110111
	.byte #%01110111
	.byte #%01100111
	.byte #%01100111
	.byte #%01100110
	.byte #%01100110
	.byte #%01100110
	.byte #%01100110
	.byte #%01100110
	.byte #%01100110
	.byte #%01100110
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%10000111
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%01110111
	.byte #%01110111
	.byte #%01111000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%01110111
	.byte #%01110111
	.byte #%10000111
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10011000
	.byte #%10011001
	.byte #%10101001
	.byte #%10011010
	.byte #%10011001
	.byte #%10011001
	.byte #%10011001
	.byte #%10011001
	.byte #%10001001
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%01111000
	.byte #%01100111
	.byte #%01110110
	.byte #%01100111
	.byte #%01100110
	.byte #%01100110
	.byte #%01110110
	.byte #%01110111
	.byte #%01100111
	.byte #%01100110
	.byte #%01110110
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%01111000
	.byte #%01110111
	.byte #%01100110
	.byte #%01100110
	.byte #%01110110
	.byte #%01110111
	.byte #%10000111
	.byte #%10001000
	.byte #%10011000
	.byte #%10001000
	.byte #%10001001
	.byte #%10011001
	.byte #%10011001
	.byte #%10011001
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%01111000
	.byte #%01100111
	.byte #%01100110
	.byte #%01110111
	.byte #%01110111
	.byte #%01111000
	.byte #%01111000
	.byte #%01110111
	.byte #%01110111
	.byte #%10001000
	.byte #%10001000
	.byte #%10011000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%01110111
	.byte #%01110111
	.byte #%01110110
	.byte #%01100110
	.byte #%01100110
	.byte #%01100110
	.byte #%01110111
	.byte #%01100110
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001001
	.byte #%10001000
	.byte #%01111000
	.byte #%01110111
	.byte #%10000111
	.byte #%01110111
	.byte #%01110111
	.byte #%10001000
	.byte #%01100111
	.byte #%01100110
	.byte #%01110111
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10011000
	.byte #%10011001
	.byte #%10001001
	.byte #%01111000
	.byte #%01110111
	.byte #%10000111
	.byte #%01111000
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%10001000
	.byte #%10011001
	.byte #%10011001
	.byte #%10011001
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%01111000
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
; Page 18
	.byte #%01110111
	.byte #%01100111
	.byte #%01010101
	.byte #%01100101
	.byte #%01110110
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%10000111
	.byte #%10011000
	.byte #%10011001
	.byte #%10011001
	.byte #%10011001
	.byte #%10011001
	.byte #%10011001
	.byte #%10011001
	.byte #%10001000
	.byte #%10000111
	.byte #%01111000
	.byte #%10000111
	.byte #%01110111
	.byte #%01110111
	.byte #%01100110
	.byte #%01110110
	.byte #%01110110
	.byte #%01110110
	.byte #%01110110
	.byte #%01110111
	.byte #%10000111
	.byte #%01110111
	.byte #%10000111
	.byte #%01110111
	.byte #%01110111
	.byte #%10001000
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%10000111
	.byte #%10001000
	.byte #%10001000
	.byte #%01111000
	.byte #%01110111
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%01110111
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%01110111
	.byte #%01110111
	.byte #%10001000
	.byte #%10001000
	.byte #%01111000
	.byte #%01110111
	.byte #%10000111
	.byte #%01111000
	.byte #%01110111
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%01111000
	.byte #%01110111
	.byte #%01110111
	.byte #%10000111
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001001
	.byte #%10001001
	.byte #%01111000
	.byte #%01110111
	.byte #%10000111
	.byte #%10011000
	.byte #%10001001
	.byte #%01110111
	.byte #%01100110
	.byte #%01100110
	.byte #%01100110
	.byte #%01100110
	.byte #%01100110
	.byte #%01100110
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110110
	.byte #%01100110
	.byte #%01110111
	.byte #%10001000
	.byte #%10001000
	.byte #%01110111
	.byte #%10001000
	.byte #%01111000
	.byte #%01111000
	.byte #%10001000
	.byte #%01111000
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%10000111
	.byte #%10001000
	.byte #%10011001
	.byte #%10011001
	.byte #%10001000
	.byte #%10011000
	.byte #%10011001
	.byte #%10011001
	.byte #%10001001
	.byte #%10001001
	.byte #%10001000
	.byte #%10001000
	.byte #%10011000
	.byte #%10001001
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001001
	.byte #%10001000
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110110
	.byte #%01100111
	.byte #%01100110
	.byte #%01100110
	.byte #%01110110
	.byte #%01110111
	.byte #%01100111
	.byte #%01110111
	.byte #%10000111
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%01111000
	.byte #%10001000
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%10000111
	.byte #%01111000
	.byte #%01110111
	.byte #%10000111
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10011000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%01110111
	.byte #%01110111
	.byte #%01100111
	.byte #%01100110
	.byte #%01100110
	.byte #%01100110
	.byte #%01100110
	.byte #%01100110
	.byte #%01100110
	.byte #%01110110
	.byte #%01110111
	.byte #%10001000
	.byte #%10001000
	.byte #%01111000
	.byte #%10001000
	.byte #%10011000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10011000
	.byte #%10011001
	.byte #%10001001
	.byte #%10001000
	.byte #%10001001
	.byte #%10001000
	.byte #%10001000
	.byte #%01111000
	.byte #%01110111
	.byte #%01110111
	.byte #%01110110
	.byte #%01110110
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%10000111
	.byte #%10001000
	.byte #%10011000
	.byte #%10001000
	.byte #%10001000
	.byte #%01110111
	.byte #%10000111
	.byte #%10001000
	.byte #%10001000
	.byte #%01111000
	.byte #%01100111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%10000111
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10011000
	.byte #%10011001
	.byte #%10011001
	.byte #%10011001
	.byte #%10001000
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01100111
	.byte #%01100110
	.byte #%01110110
	.byte #%10000111
	.byte #%10001000
	.byte #%01111000
	.byte #%01110111
	.byte #%01100111
	.byte #%01100110
	.byte #%01110111
	.byte #%01110111
	.byte #%10001000
	.byte #%01110111
	.byte #%01110111
	.byte #%10001000
	.byte #%10011001
	.byte #%10001000
	.byte #%01111000
	.byte #%10000111
	.byte #%10001000
	.byte #%10011000
	.byte #%10001000
	.byte #%10001000
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01111000
	.byte #%01111000
	.byte #%10000111
	.byte #%10000111
	.byte #%01111000
	.byte #%01110111
	.byte #%10001000
; Page 19
	.byte #%10001000
	.byte #%01111000
	.byte #%01110111
	.byte #%10000111
	.byte #%10001000
	.byte #%10001000
	.byte #%01111000
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01100110
	.byte #%01110111
	.byte #%10000111
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10011000
	.byte #%10011001
	.byte #%10011001
	.byte #%10011001
	.byte #%10011001
	.byte #%10001000
	.byte #%10001000
	.byte #%01110111
	.byte #%01110111
	.byte #%01100111
	.byte #%01100110
	.byte #%01110111
	.byte #%01110111
	.byte #%01100110
	.byte #%01110111
	.byte #%10001000
	.byte #%10001000
	.byte #%01110111
	.byte #%01110111
	.byte #%10000111
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01100111
	.byte #%01100110
	.byte #%01110110
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%10001000
	.byte #%10011000
	.byte #%10011001
	.byte #%10011001
	.byte #%10011001
	.byte #%10011001
	.byte #%10101001
	.byte #%10011010
	.byte #%10011001
	.byte #%10001000
	.byte #%10001000
	.byte #%01111000
	.byte #%01111000
	.byte #%01100110
	.byte #%01100110
	.byte #%01100110
	.byte #%01100110
	.byte #%01110111
	.byte #%01100110
	.byte #%01100110
	.byte #%01110111
	.byte #%01110111
	.byte #%01100111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%10001000
	.byte #%01110111
	.byte #%10000111
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10011001
	.byte #%10011001
	.byte #%10001000
	.byte #%10001000
	.byte #%10011001
	.byte #%10001000
	.byte #%10001000
	.byte #%01110111
	.byte #%01110111
	.byte #%10001000
	.byte #%10001000
	.byte #%01111000
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01111000
	.byte #%01110111
	.byte #%01110111
	.byte #%01111000
	.byte #%10000111
	.byte #%10001000
	.byte #%10001000
	.byte #%01111000
	.byte #%10001000
	.byte #%01110111
	.byte #%10001000
	.byte #%01111000
	.byte #%10000111
	.byte #%01110111
	.byte #%01111000
	.byte #%01110111
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%01111000
	.byte #%10000111
	.byte #%01110111
	.byte #%10001000
	.byte #%01110111
	.byte #%10000111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01111000
	.byte #%01110111
	.byte #%01111000
	.byte #%01111000
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%10000111
	.byte #%10000111
	.byte #%10000111
	.byte #%01111000
	.byte #%10001000
	.byte #%10000111
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10000111
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%01111000
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%10000111
	.byte #%01111000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%10000111
	.byte #%10000111
	.byte #%10000111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%10000111
	.byte #%10001000
	.byte #%10001000
	.byte #%01111000
	.byte #%01110111
	.byte #%01110111
	.byte #%01110111
	.byte #%10000111
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
	.byte #%10001000
EndPoint2
	.byte #%10000000

end
GotoGame
	var1=0
	gosub Level0 bank8
	asm
	lda	#0
	sta 	var0
	sta	var1
	sta	var2
	sta 	var3
	sta	var4
	sta	var5
	sta 	var6
	sta	var7
	sta	var8
	sta 	var9
	sta	var10
	sta	var11
	sta	var12
	sta 	var13
	sta	var14
	sta	var15
	sta 	var16
	sta	var17
	sta	var18
	sta 	var19
	sta	var20
	sta	var21
	sta	var22
	sta 	var23
	sta	var24
	sta	var25
	sta 	var26
	sta	var27
	sta	var28
	sta 	var29
	sta	var30
	sta	var31
	sta	var32
	sta 	var33
	sta	var34
	sta	var35


	sta	a
	sta	b
	sta	c
	sta	d
	sta	e
	sta	f
	sta	g
	sta	h
	sta	i
	sta	j
	sta	k
	sta	l
	sta	m

	sta	o
	sta	p

	sta	r
	sta	s
	sta	t
	sta	u
	sta	v
	sta	w
	sta	y
	sta	z
end
	player0y=160: player1y=160: missile1y=160: missile0y=160: bally=0
	ScoreColor=$00
	asm
	lda #%11000010
	sta WSYNC
	sta VBLANK
	
end

DoShit
	pfclear
	drawscreen
	c=c+1
	if c<20 then goto DoShit
DoDoShit
	player0y=160: player1y=160: score=0: c=0
	 var1{0}=1
	if Selected=1 then goto ChopterStart 
	if Selected=2 then goto BuvarStart bank7 
	if Selected=3 then goto Start_the_Raven bank9
	if Selected=4 then goto StartSoldier bank9
	goto ReactorStart  bank12



ChopterStart
	Level=0: temp8=1: temp9=21: temp10=0: temp13=0: temp14=0: var1{0}=1
	Score1=$02: Score2=$15 : player0y=90: player1y=90: bally=90: player0:
	%00
	%00
end
LevelStart	
	ChopSpeed=1: Chopter_X=117: player0y=20-Level: RopeValue=5: RopeMax=5:  var1{6} =0:  var1{7} =0: missile1y=160: missile1height=2
	FireLevel=10: DroneFrekv=6: DroneWait=0: GeigerCount=0: AUDV0=0: AUDV1=0: BallPower=0: BallDirection=5: var24=0
	ScoreColor=$12: var24{6}=1: gosub ChopterBack1 bank6
 playfield:
 ................................
 ................................
 ................................
 ................................
 ................................
 ................................
 ................................
 ................................
 ................................
 ................................
 ................................
 ................................
 ................................
 ................................
 ................................
 ................................
 ................................
 ................................
 ................................
 XX.....XXXXXXXXXXXXXXXXXXXXXXXXX
 XX.....XXXXXXXXXXXXXXXXXXXXXXXXX
 XX.....XXXXXXXXXXXXXXXXXXXXXXXXX
 XX.....XXXXXXXXXXXXXXXXXXXXXXXXX
end
	scorecolor=ScoreColor
Randomize_Terrain
	AUDV0=(rand&7)+2: AUDF0=temp9: AUDC0=(rand&3)
	COLUP0=$00: COLUP1=$00
	temp2=temp9+1
	var1{1}=0
	temp10=27-Level
	CTRLPF=$25
	
	temp4=21-temp9
	temp4=temp4+(rand&31)

	if temp9>18 then goto Largerthan18
	if pfread(temp8,temp2) then var1{1}=1

	if !var1{1} then goto RandomLooper  	
	if temp4<21+Level+Level then pfpixel temp8 temp9 on  

	GeigerFade=1: GeigerCount=0: var24{0}=0 : AUDV1=0
	goto RandomLooper
Largerthan18
	
	if temp9<21 then goto NotLastLine

	goto FIRE
NotLastLine
	if pfread(temp8,temp2) then var1{1}=1

	if !var1{1} then pfpixel temp8 temp9 off  
FIRE
	if temp4<13-Level && temp8<temp10  then pfpixel temp8 temp9 off  

RandomLooper
	if temp8<31 then temp8=temp8+1 else temp8=1: temp9=temp9-1
	temp3=17-Level
	if temp9<temp3 || temp9<6 then AUDV0=0: var24{0}=1 : goto ChopterLoop bank6
	GeigerFade=1: GeigerCount=0: var24{0}=0 : AUDV1=0
	drawscreen
	goto Randomize_Terrain

 	bank 6
ChopterLoop
	CTRLPF=$21
	rem var1{2} = Chopdir: var1{4} = ChopVdir: var1{5} = MOVING, var1{7} = RELEASED
	scorecolor=$12: ScoreColor=$12
	var24{6}=0: gosub ChopterBack1 
	var1{3} = !var1{3} 
	temp8=ChopSpeed+ChopVSpeed
	if var24{4} then goto NextLevel
	if  !var24{3} then temp15=Score1: var24{0}=1 : goto NotDeadChopter
	GeigerFade=1: GeigerCount=0: var24{0}=0 : AUDV1=0
DeadChopter
	if player0y<80 then goto FallChop

 	if temp10=200 then AUDV0=0: AUDV1=0 else temp10=temp10-1: goto KillFIre
		asm
	LDA	temp15
	CMP	Score1
	BNE	.KURVA
	dec	Score1

.KURVA
end 
	if Score1>$00 then dec Score2=Score2+$05: ChopSpeed=1: Chopter_X=117: player0y=20-Level: RopeValue=5: RopeMax=5:  var1{6} =0:  var1{7} =0: missile1y=160: missile1height=2: DroneFrekv=6: DroneWait=0: GeigerCount=0: BallPower=0: BallDirection=5: var24=0: ScoreColor=$12: if Score2>$15 then Score2=$15

	Score1=Score1-$01
	if Score1>9 then goto GameOver bank14


	goto NoRope 
DeadChopBack
	goto NoRope
FallChop
 	

	; if SpriteNumber>40 then SpriteNumber=0  else dec SpriteNumber=SpriteNumber+1
	; if SpriteNumber<20 && SpriteNumber>9 then goto DeadS2
	; if SpriteNumber<30 && SpriteNumber>19 then goto DeadS3
	; if SpriteNumber>29 then goto DeadS2_2
	asm
	LDA	SpriteNumber
  	CMP	#40
  	BCC	.Addd
  	LDA	#0
	JMP	.NoAdd
.Addd
	
  	LDA	SpriteNumber
  	CLC
  	ADC	#1
.NoAdd
  	STA	SpriteNumber
  	CMP	#20
  	BCS	.skipL0245_987
  	CMP	#9
  	BCS	.DeadS2
.skipL0245_987
  	CMP	#30
  	BCS	.skipL0246_876
  	CMP	#19
	BCC	.skipL0246_876
 	JMP	.DeadS3
.skipL0246_876
  	CMP	#29
  	BCS	.DeadS2_2
end



DeadS1 
	 if !var1{3} then player0x=Chopter_X else player0x=Chopter_X +8: goto DeadS1Even


	player0:
	%00000010
	%01110011
	%01111110
	%00111111
	%00111111
	%10011111
	%01101111
	%00011111
	%00001000
	%00000100
	%00000011
	%00000000
end
	goto DeadSpriteDone

DeadS1Even
	player0:
	%00000000
	%10000000
	%01000000
	%00110000
	%11101000
	%11100000
	%11100000
	%00111100
	%00011100
	%00000101
	%00000010
	%00000000
end
	goto DeadSpriteDone

DeadS2_2
	REFP0=8
	if var1{3} then player0x=Chopter_X: goto DeadS2Even else player0x=Chopter_X+8 : goto III
DeadS2
	 if !var1{3} then player0x=Chopter_X else player0x=Chopter_X +8: goto DeadS2Even

III
	player0:
	%00000000
	%01000001
	%00100011
	%00010011
	%00001011
	%00000111
	%00000111
	%00000011
	%00000000
	%00000000
	%00000000
	%00000000
end
	goto DeadSpriteDone

DeadS2Even
	player0:
	%00100000
	%11000000
	%11110000
	%11110100
	%11111000
	%11111000
	%11110000
	%10000000
	%10000000
	%01000000
	%00100000
	%00000000
end
	goto DeadSpriteDone

DeadS3
	 if !var1{3} then player0x=Chopter_X else player0x=Chopter_X +8: goto DeadS3Even


	player0:
	%00000000
	%00001100
	%00011000
	%00100111
	%01101111
	%10111111
	%00111111
	%01111111
	%00111110
	%00000000
	%00000011
	%00000000
end
	goto DeadSpriteDone

DeadS3Even
	player0:
	%00000001
	%00000111
	%01111100
	%11110000
	%11100001
	%10000010
	%10001100
	%10110000
	%11000000
	%10000000
	%00000000
	%00000000
end
DeadSpriteDone
	temp4=ChopSpeed/4
 	if ChopSpeed<5 then Chopter_X=Chopter_X-temp4: ballx=ballx+temp4 else Chopter_X=Chopter_X+temp4 : ballx=ballx-temp4
	if player0y<80 then player0y=player0y+1
	;  if bally<75 then bally=bally+1: if missile1y>65 then missile1y=bally: missile1x=ballx+2
	asm
	LDA	bally
  	CMP	#90
  	BCS	.skipL0267_999
	CLC
	ADC	#1
	STA 	bally
	tay
  	LDA	#65
  	CMP	missile1y
 	BCS	.skipL0267_999
  	STY	missile1y
	LDA	ballx
 	CLC
	ADC	#2
	STA	missile1x
.skipL0267_999

end
	
	;  temp4=75-player0y: temp4=temp4/4: AUDF0=temp4: AUDV0=temp4/2: AUDC0=15
	asm
	lda 	#75
	sec
	sbc	player0y
	lsr
	lsr
	lsr
	
	sta 	AUDV0
	sta 	temp4
	lda 	#15
	sta 	AUDC0
	sta 	temp10
	sec
	sbc	temp4
	sta 	AUDF0

end
	AUDV1=0
	goto NoRope
NotDeadChopter
	; if temp10>16 then temp10=0: Sound=0 else temp10=temp10+temp8
	asm
	LDA	temp10
  	CMP	#16
  	BCS	.skipL0241_1
  	CLC
  	ADC	temp8
	jmp	.skipelse9_1
.skipL0241_1
  	LDA	#0
  	STA	Sound
.skipelse9_1
	STA	temp10
end
	if Sound<8 then Sound=Sound+1
	AUDC0=3
	; AUDF0=Sound+5: temp3=10-Sound: if Sound<6 then AUDV0=Sound else AUDV0=6
	asm
	ldx 	Sound
	txa
	CLC
  	ADC	#5
  	STA	AUDF0
  	LDA	#10
  	SEC
  	SBC	Sound
  	STA	temp3

	CPX	#6
  	BCS	.skipelse10_1
  	LDX	#6	
.skipelse10_1	   
	STX	AUDV0
end
	
	player0x=Chopter_X  : CTRLPF=$25: ballheight=3


	
	; if SpriteNumber>29 then SpriteNumber=0 else SpriteNumber=SpriteNumber+temp8
	; if SpriteNumber>19 then goto ChopSprite3
	; if SpriteNumber>9 then goto ChopSprite2


	asm
	ldx	ChopSpeed
	ldy 	var1
	LDA 	SpriteNumber
  	CMP	#29
  	BCC	.skipL0246_12
  	LDA	#0
  	jmp	.skipelse9_12
.skipL0246_12
  	CLC
  	ADC	temp8		      
.skipelse9_12
	STA	SpriteNumber
  	CMP	#19
  	BCC	.skipL0247_23
  	jmp	.ChopSprite3
.skipL0247_23
	CMP	#9
  	BCS	.skipL0247_24
  	jmp	.ChopSprite2
.skipL0247_24

end


	; if ChopSpeed>1 then goto Largerthan0
	; if var1{3} then goto EvenTurn0 
	asm
	
  	CPX	#2
  	BCS	.Largerthan0



  	tya
  	AND	#8
  	BNE	.EvenTurn0
end

 	player0:
 	%00000000
 	%00000000
 	%00111111
 	%00010001
 	%01111111
 	%01001111
 	%00100111
 	%00011111
 	%00000011
 	%11011011
 	%00000011
 	%00000000
end
	goto ChopSpriteDone
EvenTurn0
	player0x=Chopter_X+8
 	player0:
 	%00000000
 	%00000000
 	%10000000
 	%00000000
 	%10111010
 	%11111111
 	%11000010
 	%10000000
 	%00000000
 	%01101100
 	%00000000
 	%00000000
end
	goto ChopSpriteDone

Largerthan0

	; if var1{2} then goto GoesBack0
	; if var1{3} then goto EvenTurn1

 	asm
	tya
  	AND	#4
  	BNE	.GoesBack0
	tya
  	AND	#8
  	BNE	.EvenTurn1
end

 	player0:
 	%00000010
 	%01110011
 	%01011110
 	%00101111
 	%00100111
 	%00011111
 	%01101111
 	%00001111
 	%00001000
 	%00000100
 	%00000001
 	%00000000
end
	goto ChopSpriteDone


EvenTurn1
	player0x=Chopter_X+9
 	player0:
 	%00000000
 	%10000000
 	%01000000
 	%00110000
 	%11101000
 	%11100000
 	%11100000
 	%00111100
 	%00011100
 	%00000101
 	%00000010
 	%10000101
end


	goto ChopSpriteDone

GoesBack0
	; if var1{3} then goto EvenTurn2
	asm
	tya
  	AND	#8
  	BEQ	.EvenTurn2
end
 player0:
 	%00000000
 	%00001100
 	%00011000
 	%00100111
 	%01101111
 	%10111111
 	%00110111
 	%01100011
 	%00111110
 	%00000000
 	%00000010
 	%00000100
end

	goto ChopSpriteDone

EvenTurn2

	player0x=Chopter_X+9
 	player0:
 	%00000101
 	%00000010
 	%01111101
 	%11110000
 	%11100000
 	%10000011
 	%10001000
 	%10010000
 	%11000000
 	%10000000
 	%00000000
 	%00000000
end
	goto ChopSpriteDone

ChopSprite2
	;if ChopSpeed>1 then goto Largerthan1
	;if var1{3} then goto EvenTurn3 

	asm
	CPX	#2
  	BCS	.Largerthan1
  	tya
  	AND	#8
  	BNE	.EvenTurn3
end


 	player0:
 	%00000000
 	%00000000
 	%00111111
 	%00010001
 	%01111111
 	%01001111
 	%00100111
 	%00011111
 	%00000011
 	%10110110
 	%00000011
 	%00000000
end


	goto ChopSpriteDone


EvenTurn3 
	player0x=Chopter_X+8
 	player0:
	%00000000
 	%00000000
 	%10000000
 	%00000000
 	%10111001
 	%11111111
 	%11000100
 	%10000000
 	%00000000
 	%11011000
 	%00000000
 	%00000000
end
	goto ChopSpriteDone

Largerthan1
	; if var1{2} then goto GoesBack1
 	; if var1{3} then goto EvenTurn4 

 	asm
	tya
  	AND	#4
  	BNE	.GoesBack1
	tya
  	AND	#8
  	BNE	.EvenTurn4
end

 	player0:
 	%00000010
 	%01110011
 	%01011110
 	%00101111
 	%00100111
 	%10011111
 	%00101111
 	%00011111
 	%00000000
 	%00000110
 	%00000000
 	%00000000
end

	goto ChopSpriteDone
EvenTurn4 

 	player0x=Chopter_X+9
 	player0:
 	%00000000
 	%10000000
 	%01000000
 	%00110000
 	%11101000
	%11100000
 	%11100000
 	%00111100
 	%00011100
 	%00000100
 	%00000111
 	%10000001
end



	goto ChopSpriteDone
GoesBack1
 	; if var1{3} then goto EvenTurn5 

	asm
	tya
  	AND	#8
  	BEQ	.EvenTurn5
end

 	player0:
 	%00000000
 	%00001100
 	%00011000
 	%00100111
 	%01101111
 	%10111111
 	%00110111
 	%01100011
 	%00111110
 	%00000000
 	%00000011
 	%00001000
end
	goto ChopSpriteDone

EvenTurn5 
	player0x=Chopter_X+9
 	player0:
 	%00000011
 	%00000010
 	%01111110
 	%11110000
 	%11100000
 	%10000001
 	%10001100
 	%10100000
 	%11000000
 	%00000000
 	%00000000
 	%00000000
end
	goto ChopSpriteDone

ChopSprite3
	; if ChopSpeed>1 then goto Largerthan2
	; if var1{3} then goto EvenTurn6 
	asm
  	CPX	#2
  	BCS	.Largerthan2
  	tya
  	AND	#8
  	BNE	.EvenTurn6
end

 	player0:
 	%00000000
 	%00000000
 	%00111111
 	%00010001
 	%01111111
 	%01001111
 	%00100111
 	%00011111
 	%00000011
 	%01101101
 	%00000011
 	%00000000
end
	goto ChopSpriteDone

EvenTurn6 
	player0x=Chopter_X+8
 	player0:
 	%00000000
 	%00000000
 	%10000000
 	%00000000
 	%10111100
 	%11111111
 	%11000001
 	%10000000
 	%00000000
 	%10110100
 	%00000000
 	%00000000
end
	goto ChopSpriteDone


Largerthan2
	; if var1{2} then goto GoesBack2

	; if var1{3} then goto EvenTurn7 

 	asm
	tya
  	AND	#4
  	BNE	.GoesBack2
	tya
  	AND	#8
  	BNE	.EvenTurn7
end

 	player0:
 	%00000010
 	%01110011
 	%01011110
 	%00101111
 	%00100111
 	%10011111
 	%01001111
 	%00011111
 	%00001000
 	%00000010
 	%00000001
 	%00000000
end
	goto ChopSpriteDone
EvenTurn7 
	player0x=Chopter_X+9
 	player0:
 	%00000000
 	%10000000
 	%01000000
 	%00110000
 	%11101000
 	%11100000
 	%11100000
 	%00111100
 	%00011100
 	%00000101
 	%00000010
 	%00000101
end
	goto ChopSpriteDone
GoesBack2
	; if var1{3} then goto EvenTurn8
 
	asm
	tya
  	AND	#8
  	BEQ	.EvenTurn5
end


	player0:
 	%00000000
 	%00001100
 	%00011000
 	%00100111
 	%01101111
 	%10111111
 	%00110111
 	%01100011
 	%00111110
 	%00000000
 	%00000001
 	%00001100
end

	goto ChopSpriteDone

EvenTurn8
	player0x=Chopter_X+9
 	player0:
 	%00000001
 	%00000111
 	%01111100
 	%11110000
 	%11100000
 	%10000010
 	%10000100
 	%10110000
 	%10000000
 	%10000000
 	%00000000
 	%00000000
end

ChopSpriteDone
	var1{5} =0


	; if joy0left && joy0right then goto FuckYouH
	; if !joy0left && !joy0right then goto FuckYouH
	; if joy0left && var1{2} && ChopSpeed>2 then goto FuckYouH
	; if joy0right && !var1{2} && ChopSpeed>2  then goto FuckYouH

	asm
	bit	SWCHA
  	BVS	.skipL0309_1

  	BPL	.FuckYouH
.skipL0309_1
  	
 	BVC	.skipL0310_1
  	
  	BMI	.FuckYouH
.skipL0310_1
  	
  	BVS	.skipL0311_1
  	LDA	var1
  	AND	#4
  	BEQ	.skipL0311_1
  	LDA	#2
  	CMP	ChopSpeed
  	BCC	.FuckYouH
.skipL0311_1
  	bit	SWCHA
  	BMI	.skipL0312_1
  	LDA	var1
  	AND	#4
  	BNE	.skipL0312_1
  	LDA	#2
  	CMP	ChopSpeed
  	BCC	.FuckYouH
.skipL0312_1
end


	var1{5} =1

	; if BallPower<6 then BallPower=6
	asm
	LDA	#6
  	CMP	BallPower
  	BCC	.skipL0314_1
  	STA	BallPower
.skipL0314_1
end
	; if joy0left then var1{2}=0 else var1{2}=1
	asm
	LDA	var1
 	bit	SWCHA
  	BVS	.skipL0315_1
	AND	#251
  	jmp	.skipelse10_11
.skipL0315_1
  	ORA	#4
.skipelse10_11
	STA	var1
end

	if ChopDelayH>15 then ChopDelayH=0: ChopSpeed=ChopSpeed+1 else ChopDelayH=ChopDelayH+1
	; if RopeValue>0 && joy0right then RopeValue=RopeValue-1: BallDirection=9+RopeValue
	; if RopeValue<9 && joy0left then RopeValue=RopeValue+1: BallDirection=9-RopeValue
	asm
	LDA	RopeValue

 	CMP	#0
  	BEQ	.skipL0317_1
  	bit	SWCHA
  	BMI	.skipL0317_1
	DEC	RopeValue
  	CLC
  	ADC	#9
	jmp 	.STASTA
.skipL0317_1
  	CMP	#9
  	BCS	.skipL0318_1
 	bit	SWCHA
  	BVS	.skipL0318_1
  	INC	RopeValue
  	LDA	#9
  	SEC
  	SBC	RopeValue
.STASTA
	STA	BallDirection
.skipL0318_1
end
	RopeMax=RopeValue

	goto DontFuckH
FuckYouH
	if ChopDelayH>5 && ChopSpeed>1 then ChopDelayH=0: ChopSpeed=ChopSpeed-1 else ChopDelayH=ChopDelayH+1
	
DontFuckH
	; if ChopSpeed>4 then ChopSpeed=4
	; if var1{3} then goto NOMOVE

	asm
	LDA	#4
  	CMP	ChopSpeed
  	BCS	.skipL0310_13
  	STA	ChopSpeed
.skipL0310_13
  	LDA	var1
  	AND	#8
  	BNE	.NOMOVE
end

	; if ChopSpeed>1 && !var1{2} then Chopter_X=Chopter_X-ChopSpeed
	; if ChopSpeed>1 && var1{2} && Chopter_X<130 then Chopter_X=Chopter_X+ChopSpeed
	asm
	LDA	#1
  	CMP	ChopSpeed
  	BCS	.NOMOVE
  	LDA	var1
  	AND	#4
  	BNE	.skip100then_11
 	LDA	Chopter_X
  	SEC
  	SBC	ChopSpeed
  	JMP	.JUJJ
.skip100then_11
  	LDA	Chopter_X
	CMP	#130
	BCS	.NOMOVE
  	CLC
  	ADC	ChopSpeed
.JUJJ
	STA	Chopter_X
end

NOMOVE
	 if joy0up && joy0down then goto FuckYouV
	 if !joy0up && !joy0down then goto FuckYouV

	var1{5} =1

	if BallPower>0 then BallPower=BallPower-1

	; if joy0up then var1{4}=0 else var1{4}=1

	asm
	lda	#$10
  	bit	SWCHA
  	BNE	.skipL0318_19
  	LDA	var1
  	AND	#239
  	jmp	.skipelse11_11
.skipL0318_19
  	LDA	var1
  	ORA	#16
.skipelse11_11
	STA	var1

end
	if ChopDelayV>20 then ChopDelayV=0: ChopVSpeed=ChopVSpeed+1 else ChopDelayV=ChopDelayV+1
	; if var1{4} then goto goesDown

	asm
	LDA	var1
  	AND	#16
  	BNE	.goesDown
end

	; if RopeValue<4 then RopeValue=RopeValue+1: BallDirection=RopeValue+1
	; if RopeValue>5 then RopeValue=RopeValue-1: BallDirection=RopeValue-1
	asm
	LDA	RopeValue
  	CMP	#4
  	BCS	.skipL0321_22
	CLC  
	ADC	#1
	STA	RopeValue
	STA 	RopeMax
  	ADC	#1
	jmp	.GAGAGA
.skipL0321_22
  	CMP	#5
  	BCC	.SKIPP
  	SEC
  	SBC	#1
	STA	RopeValue
	STA 	RopeMax
  	SBC	#1
.GAGAGA
	STA	BallDirection
.SKIPP
end


	goto DontFuckV

goesDown
	;if RopeValue<4 && RopeValue>0 then RopeValue=RopeValue-1: BallDirection=RopeValue-1
	;if RopeValue>5 && RopeValue<9 then RopeValue=RopeValue+1: BallDirection=RopeValue+1
	;RopeMax=RopeValue

	asm
 	LDA	RopeValue
  	CMP	#4
  	BCS	.skipL0325_33
  	CMP	#0
  	BEQ	.skipL0325_33
  	SEC
	SBC	#1
	STA	RopeValue
	STA	RopeMax
	SBC	#1
	jmp	.BALL	
.skipL0325_33
	CMP	#5
	BCC	.NNN
  	CMP	#9
 	BCS	.NNN
	CLC
	ADC	#1
	STA	RopeValue
	STA 	RopeMax
	ADC	#1
.BALL
 	STA	BallDirection
.NNN
end

	goto DontFuckV
FuckYouV
	if ChopDelayV>5 && ChopVSpeed>1 then ChopDelayV=0: ChopVSpeed=ChopVSpeed-1 else ChopDelayV=ChopDelayV+1

DontFuckV

	; if ChopVSpeed>2 then ChopVSpeed=2
	; if var1{3} then goto NOMOVEV
	asm
	LDA	#2
  	CMP	ChopVSpeed
  	BCS	.skipL0324_22
	STA	ChopVSpeed
.skipL0324_22
	LDA	var1
  	AND	#8
  	BNE	.NOMOVEV
end
	; if ChopVSpeed>1 && !var1{4} && player0y>15 then player0y=player0y-ChopVSpeed
	; if ChopVSpeed>1 && var1{4} then player0y=player0y+ChopVSpeed

	asm
	LDA	#1
  	CMP	ChopVSpeed
  	BCS	.NOMOVEV
  	LDA	var1
  	AND	#16
  	BNE	.condpart111_22
  	LDA	player0y
  	CMP	#15
  	BCC	.NOMOVEV
  	SEC
  	SBC	ChopVSpeed
	jmp 	.GOOOD

.condpart111_22
  	LDA	player0y
  	CLC
  	ADC	ChopVSpeed
.GOOOD
  	STA	player0y
end


NOMOVEV

	; if var24{1} || var1{7}  then goto CantRelease
	; if !joy0fire then goto CantRelease
	asm
	LDA	var24
  	AND	#2
  	BNE	.CantRelease
	BIT	var1
  	BMI	.CantRelease
  	bit	INPT4
  	BMI	.CantRelease
end
	BallTempDirection=BallDirection: var1{7} = 1  
	BallTempPower=BallPower


CantRelease
	if var1{3} then goto NoRope
	var1{6} = !var1{6} 
	player1y=player0y+9
	; if var1{5} || var1{6}  then goto NopeNope
	; if RopeMax=4 || RopeMax=5 then goto NopeNope
	asm
	LDA	var1
  	AND	#32
  	BNE	.NopeNope
 	BIT	var1
  	BVC	.NopeNope
  	LDA	RopeMax
  	CMP	#4
  	BEQ	.NopeNope
  	CMP	#5
 	BEQ	.NopeNope

end
	; if RopeMax>4 then temp4=RopeMax-5: RopeMaxTemp=5-temp4 else temp4=5-RopeMax: RopeMaxTemp=4+temp4
	asm
	LDA	#5
  	CMP	RopeMax
  	BCS	.skipL0337_77
	LDA	 #10
  	jmp	.ZZZ
.skipL0337_77

	LDA	#9
  	SEC
.ZZZ
	SEC
	SBC	RopeMax
	STA	RopeMaxTemp
end


	; if RopeMaxTemp>4 && RopeValue<RopeMaxTemp then RopeValue=RopeValue+1: BallDirection=RopeValue-1
	; if RopeMaxTemp>4 && RopeValue=RopeMaxTemp then RopeMax=RopeMaxTemp: temp4=RopeMax-5: RopeMaxTemp=5-temp4 

	asm
	LDA	#4
  	CMP	RopeMaxTemp
  	BCS	.NoGlory
  	LDA	RopeValue
  	CMP	RopeMaxTemp
  	BCS	.OtherGlory
	STA	BallDirection
  	INC	RopeValue
	jmp	.NoGlory
.OtherGlory
  	BNE	.NoGlory
  	LDA	#10
	jmp	.ENDLESS
.NoGlory
end
	; if RopeMaxTemp<5 && RopeValue>RopeMaxTemp then RopeValue=RopeValue-1: BallDirection=RopeValue+1
	;  if RopeMaxTemp<5 && RopeValue=RopeMaxTemp then RopeMax=RopeMaxTemp: temp4=5-RopeMax: RopeMaxTemp=4+temp4
	asm
	LDA	RopeMaxTemp
  	CMP	#5
  	BCS	.NopeNope
  	LDA	RopeMaxTemp
  	CMP	RopeValue
  	BCS	.OneMore
	STA	BallDirection
  	DEC	RopeValue
.OneMore
	BNE	.NopeNope
  	LDA	#9
.ENDLESS
	LDX	RopeMaxTemp
 	STX	RopeMax

  	SEC
  	SBC	RopeMax
  	STA	RopeMaxTemp
end

NopeNope
	; if RopeValue=0 || RopeValue=9 then NUSIZ1=$07 else NUSIZ1=$00
	; if RopeValue=1 || RopeValue=8 then NUSIZ1=$05
	; if RopeValue=0 || RopeValue=9  then player1x=Chopter_X-9 else player1x=Chopter_X+1
	; if RopeValue=1 then player1x=Chopter_X-6
	; if RopeValue=8 then player1x=Chopter_X-3

	asm
	ldx 	RopeValue
	lda 	Chopter_X
	
	CPX	#0
	BEQ	.V09
	CPX	#9
	BEQ	.V09
	CPX	#1
	BEQ	.V1
	CPX	#8
	BEQ	.V8
	LDY	#$00
	CLC
	ADC	#1	
	jmp 	.UIUO
.V09
	LDY	#$07
	SEC
	SBC	#9
	jmp 	.UIUO
.V1
	LDY	#$05
	SEC
	SBC 	#6
	jmp 	.UIUO
.V8
	LDY	#$05
	SEC
	SBC 	#3
.UIUO	
	STY 	NUSIZ1
	STA 	player1x
end
	;if RopeValue>4 then REFP1=8

	asm
	LDA	#4
  	CMP	RopeValue
  	BCS	.skipL0344_9
  	asl
  	STA	REFP1
.skipL0344_9
end

	; if collision(playfield,ball) then goto GoDown

	asm
	bit	CXBLPF
  	BPL	.GGGG
	JMP	.GoDown
.GGGG
end


	if var24{1} then goto BallDestroyed
	if var1{7} then goto BallReleased


	; if RopeValue=0 then ballx=Chopter_X-10: bally=player0y+1 
	; if RopeValue=9 then ballx=Chopter_X+22: bally=player0y+1 

	; if RopeValue=1 then ballx=Chopter_X-5: bally=player0y+3
	; if RopeValue=8 then ballx=Chopter_X+15: bally=player0y+3

	; if  RopeValue=2 then bally=player0y+7: ballx=Chopter_X-1
	; if  RopeValue=7 then bally=player0y+7: ballx=Chopter_X+9

	; if  RopeValue=3 then bally=player0y+10: ballx=Chopter_X+1
	; if RopeValue=6 then bally=player0y+10: ballx=Chopter_X+7

	; if  RopeValue=4 || RopeValue=5 then bally=player0y+12: ballx=Chopter_X+4

	asm
	lda 	Chopter_X
	ldx	player0y
	ldy 	RopeValue

	CPY 	#0
	BNE	.ItsNot0
	SEC
	SBC	#10
	sta 	ballx
	txa
	CLC
	ADC	#1
	jmp	.Finals
.ItsNot0

	CPY 	#1
	BNE	.ItsNot1
	SEC
	SBC	#5
	sta 	ballx
	txa
	CLC
	ADC	#3
	jmp	.Finals
.ItsNot1
	CPY 	#2
	BNE	.ItsNot2
	SEC
	SBC	#1
	sta 	ballx
	txa
	CLC
	ADC	#7
	jmp	.Finals
.ItsNot2
	CPY 	#3
	BNE	.ItsNot3
	CLC
	ADC	#1
	sta 	ballx
	txa
	CLC
	ADC	#10
	jmp	.Finals
.ItsNot3
	CPY 	#6
	BNE	.ItsNot6
	CLC
	ADC	#7
	sta 	ballx
	txa
	CLC
	ADC	#10
	jmp	.Finals
.ItsNot6
	CPY 	#7
	BNE	.ItsNot7
	CLC
	ADC	#9
	sta 	ballx
	txa
	CLC
	ADC	#7
	jmp	.Finals
.ItsNot7
	CPY 	#8
	BNE	.ItsNot8
	CLC
	ADC	#15
	sta 	ballx
	txa
	CLC
	ADC	#3
	jmp	.Finals
.ItsNot8
	CPY 	#9
	BNE	.ItsNot9
	CLC
	ADC	#22
	sta 	ballx
	txa
	CLC
	ADC	#1
	jmp	.Finals
.ItsNot9
	CLC
	ADC	#4
	sta 	ballx
	txa
	CLC
	ADC	#12
.Finals
	sta 	bally

end
	
	; if missile1y>65 && !var1{7}  then temp4=rand: if temp4>170 then if var1{5} then missile1x=ballx+2: missile1y=bally
	asm
	LDA	#65
  	CMP	missile1y
  	BCS	.NYET
  	BIT	var1
  	BMI	.NYET
  	lda	rand
  	lsr
  	bcc	*+4
  	eor	#$B4
  	sta	rand
  	CMP	#170
  	BCC	.NYET
  	LDA	var1
  	AND	#32
  	BEQ	.NYET
  	LDA	ballx
  	CLC
  	ADC	#2
  	STA	missile1x
  	LDA	bally
  	STA	missile1y
.NYET
end
	goto CreateRope
BallReleased

	; temp4=80-bally
	; AUDV1=temp4/8: AUDC1=1: AUDF1=temp4/4
	asm
	lda 	#1
	sta 	AUDC1
	lda	#80
	sec
	sbc	bally
	lsr
	lsr
	sta 	AUDF1
	lsr 
 	sta 	AUDV1
end
	if missile1y>65 then missile1x=ballx+2: missile1y=bally

	temp5=BallTempPower/8
	if BallTempDirection<4 then temp3=5-BallTempDirection: temp3=temp3/4: ballx=ballx+temp3+temp5: goto GoDown
	if BallTempDirection>5 then temp3=5+BallTempDirection:  temp3=temp3/4:  ballx=ballx-temp3-temp5
 


GoDown
	

	if bally>58 then var1{7} =0: var24{1} = 1: AUDV1=0: goto BallDestroyed
	

	bally=bally+3+temp5

	goto CreateRope
BallDestroyed
	bally=90
	; if !var24{2} && ballx>23 && ballx<41 then ballx=60: var24{2} =1: FireLoop=30 : FireLevel=FireLevel-2
	;  if var24{2} then goto KillFIre
	
	asm
	LDA	var24
  	AND	#4
  	BNE	.KillFIre
 	LDA	ballx
  	CMP	#23
	BCC	.SUSS2
 	CMP	#41
 	BCS	.SUSS2
 	LDA	#60
  	STA	ballx
  	LDA	#30
  	STA	FireLoop
  	LDA	FireLevel
  	SEC
  	SBC	#2
  	STA	FireLevel
  	LDA	var24
  	ORA	#4
  	STA	var24
end
	dec score=score+10: temp13=temp13+1
	

SUSS2

	


	goto CreateRope
KillFIre
	asm
	LDA	var1
  	AND	#8
  	BNE	.NEXT
	ldx	#$16
	ldy 	#2
end
LetsFire
	pfcolors:
 	$10
 	$10
 	$12
 	$12
 	$14
 	$14
	$16
 	$16
 	$18
 	$18
 	$1a
 	$1a
 	$1c
	$1c
 	$1e
 	$1e
 	$1e
 	$1e
 	$1e
 	$1e
 	$1e
 	$1e
 	$1e
end
	if Selected=0 then return otherbank
	goto PIKOPIKO
NEXT
	asm
	ldx	#$42
	ldy 	#8
end

	pfcolors:
  	$40
 	$40
 	$42
 	$42
 	$44
 	$44
	$46
 	$46
 	$48
 	$48
 	$4a
 	$4a
 	$4c
	$4c
 	$4e
 	$4e
 	$4e
 	$4e
 	$4e
 	$4e
 	$4e
 	$4e
 	$4e
end
PIKOPIKO
	asm
	stx 	ScoreColor
	sty 	AUDC1

end

	if FireLoop>1 then AUDV1=8: AUDF1=(rand&15) else AUDV1=0

 	if var24{3} then goto DeadChopBack 
	;  FireLoop=FireLoop-1
	;  if FireLoop=0 then var24{2} =0
	;  if FireLevel<2 then FireLevel=0: goto NextLevel
	asm
	lda	FireLoop
	SEC
	SBC 	#1
	sta 	FireLoop
	CMP 	#0
	BNE	.CreateRope
	LDA	var24
  	AND	#251
  	STA	var24
	LDA	FireLevel
	CMP	#0
	BNE	.CreateRope
	STA	temp8
	sta 	temp12
	sta 	temp11
	lda 	Score1
	sta 	temp9
	lda 	Score2
	sta 	temp10
end
	var24{4} =1
	goto	NextLevel

CreateRope
	; if RopeValue=4 || RopeValue=5 then goto Rope4
	; if RopeValue=3 || RopeValue=6 then goto Rope3
	; if RopeValue=2 || RopeValue=7 then goto Rope2
	;  if RopeValue=1 || RopeValue=8 then goto Rope1

	asm
	lda 	RopeValue
	CMP	#1
	BEQ 	.Rope1
	CMP	#8
	BEQ 	.Rope1
	CMP	#2
	BEQ 	.Rope2
	CMP	#7
	BEQ 	.Rope2
	CMP	#3
	BEQ 	.Rope3
	CMP	#6
	BEQ 	.Rope3
	CMP	#4
	BEQ 	.Rope4
	CMP	#5
	BEQ 	.Rope4

end
Rope0
 	player1:
 	%00000000
 	%00000000
 	%00000000
 	%00000000
 	%00000000
 	%00000000
 	%00000000
 	%00000000
 	%00000000
 	%00000000
 	%11000000
 	%00110000
end
	goto Roped


Rope1
 	player1:
 	%00000000
 	%00000000
 	%00000000
 	%00000000
 	%00000000
 	%00000000
 	%00000000
 	%10000000
 	%01000000
 	%01000000
 	%00100000
 	%00010000
end
	goto Roped

Rope2
 	player1:
 	%00000000
 	%00000000
 	%00000000
 	%10000000
 	%10000000
 	%01000000
 	%01000000
 	%00100000
 	%00100000
 	%00010000
 	%00010000
 	%00001000
end
	goto Roped


Rope3
 	player1:
 	%00000000
 	%01000000
 	%01000000
 	%01000000
 	%00100000
 	%00100000
 	%00100000
 	%00010000
 	%00010000
 	%00010000
 	%00001000
 	%00001000
end
	goto Roped


Rope4
 	player1:
 	%00010000
 	%00001000
 	%00001000
 	%00001000
 	%00001000
 	%00010000
 	%00010000
 	%00010000
 	%00010000
 	%00001000
 	%00001000
 	%00001000
end
	goto Roped
	





NoRope	
	NUSIZ1=$05
	temp4=FireLevel*2
	player1y=88-temp4: player1x=25
	;  if FireSprite>30 then FireSprite=0 else 	FireSprite=FireSprite+2 

	asm
	LDA	FireSprite
  	CMP	#30
  	BCC	.FIREEEE
	LDA	#0
	jmp	.FIRE2
.FIREEEE
	CLC
	ADC	#2
.FIRE2
	sta 	FireSprite
end
	
	asm
	CMP	#9
	BCS	.FS1
end
	player1:
 	%01110110
 	%10111110
 	%11101011
 	%01011111
 	%01010101
 	%10101111
 	%10111101
 	%01001111
 	%01100101
 	%10111011
 	%01110101
 	%10111001
 	%11110011
 	%01011110
 	%01011010
 	%00111110
 	%00111010
 	%01011000
 	%01101000
 	%01110000
 	%01010000
 	%00110000
 	%00010000
 	%00010000
end
	goto Roped
FS1
	asm
  	CMP	#19
  	BCS	.FS2
  	CMP	#8
  	BCC	.FS2
end
	player1:
 	%01110101
 	%01011110
 	%01101110
 	%11010011
 	%10101111
 	%10111011
 	%01111100
 	%01110100
 	%01010100
 	%10101100
 	%11011010
 	%01110101
 	%11011011
 	%10101101
 	%10111011
 	%11101010
 	%01011110
 	%01111010
 	%00101110
	%00110100
 	%00010100
 	%00001110
 	%00000110
 	%00000010
end
	goto Roped

FS2
	player1:
 	%11101110
 	%10011101
 	%01010011
 	%11101011
 	%11011110
 	%11110111
 	%01101011
 	%01011101
 	%01101011
 	%10111101
 	%11010110
	%10110111
 	%10111011
 	%11001101
 	%01101011
 	%01010101
 	%01011001
 	%01100111
 	%00010101
 	%00011010
 	%00010010
 	%00011110
 	%00101100
 	%01111000
end


Roped
	if missile1y<80 then missile1y=missile1y+1: if var1{7} then missile1y=missile1y+1

	;  if Chopter_X>125 && var24{1} && !var24{2} && Score2>0 then var24{1} =0: var24{2} =0: var1{7} =0: Score2=Score2-1
	asm
	LDA	#125
  	CMP	Chopter_X
  	BCS	.NoReBall
  	LDA	var24
  	AND	#2
  	BEQ	.NoReBall
 	LDA	var24
  	AND	#4
  	BNE	.NoReBall
  	LDA	#0
  	CMP	Score2
  	BEQ 	.NoReBall
 	LDA	var24
  	AND	#253
	AND	#251
  	STA	var24
  	LDA	var1
  	AND	#127
  	STA	var1
end
	dec Score2=Score2-$01
	
NoReBall


	asm
	LDA 	#17
	SEC
	SBC 	Level
	STA 	temp4
	asl
	CLC
	ADC	temp4
end
	; if temp4<player0y && collision(player0,playfield) then var24{3}=1
	; if Chopter_X<41+Level+Level then then var24{3}=1
	asm
	CMP	player0y
  	BCS	.MayDead
  	bit	CXP0FB
  	BMI	.Dead
.MayDead
	LDA	Level
	asl
	CLC
	ADC	#41
  	CMP	Chopter_X
  	BCC	.NotDead
.Dead
  	LDA	var24
  	ORA	#8
  	STA	var24
	
.NotDead
end
	if temp13>49 && !var24{4} && !var24{5}  then temp14=temp13-50: var24{5}=1
	if temp13>temp14 &&  var24{5} then temp13=temp13-1: AUDC0=12: AUDF0=15-temp13: AUDV0=temp13
	if temp13=temp14 &&  var24{5} then var24{5}=0: if Score1<$09 then dec Score1=Score1+$01

	
	COLUPF=$00: COLUP0=$00: COLUP1=$00
	if switchselect then goto BackToMenu bank14
	if switchreset then COLUP0=$00: COLUP1=00: goto BackReset bank14

	drawscreen
	goto ChopterLoop

NextLevel
	player0y=90: player1y=90: bally=90: missile1y=90: player1y=90
	Chopter_X=0: player0x=0
	AUDV1=0
	if temp12>0 then temp12=temp12-1: AUDF0=temp12: AUDV0=temp12: goto NotDead  else AUDV0=0
	
	if Score2>0 then dec Score2=Score2-$01: dec score=score+20: temp13=temp13+2: AUDC0=6: temp12=15: goto NotDead
	if Score1>0 then dec Score1=Score1-$01: dec score=score+30: temp13=temp13+3: AUDC0=1: temp12=15: goto NotDead
	if Level<6 then Level=Level+1
	Score1=temp9: Score2=temp10: temp8=1: temp9=21: temp10=0
	dec Score2=Score2+$05: if Score2>$15 then Score2=$15
 	goto LevelStart bank5

bank6bullshit
	if GeigerFade>5 && r011<11 then w017=4: gosub Redness bank8 else goto VARANGY
	if r011<4 then w017=60: BuvarSprite=0: goto DeadBuvar bank2
VARANGY
	; if !var15{3} || !joy0up then goto NOTHINGTODO
	asm
	LDA	var15
  	AND	#8
 	BEQ	.Point
  	lda	#$10
  	bit	SWCHA
  	BNE	.Point
end
	;  if !var1{5} &&  !var1{6} then goto NOTHINGTODO
	asm
	LDA	var1
  	AND	#32
 	BEQ	.Point
  	BIT	var1
  	BVS	.NIIII
.Point
	JMP	.NOTHINGTODO

.NIIII
end
	; temp1=Hardness*8
	; if GearSprite>26+temp1 then AUDV0=0: goto NOTHINGTODO 
	asm
	LDA	Hardness
 	asl
 	asl
 	asl
  	STA	temp1
  	CLC
  	ADC	#26
 	CMP	GearSprite
  	BCS	.ERE
  	LDA	#0
  	STA	AUDV0
	LDA	var15
   	ORA	#128
   	STA	var15

  	jmp	.NOTHINGTODO
.ERE
end

	; if joy0left || joy0right then goto NOTHINGTODO
	asm
	bit	SWCHA
  	BVC	.Point
  	BPL	.Point
end
	temp2=r008+4

	; if r008>GearX then temp1=r008-GearX else temp1=GearX-r008
	asm
	LDA	GearX
  	CMP	temp2
 	BCS	.EE4
  	LDA	temp2
  	SEC
  	SBC	GearX
  	jmp	.EF5
.EE4
  	SEC
  	SBC	temp2

.EF5
	STA	temp1
end

	temp4=r009-6: w020=0
	; if temp4>GearY then temp2=temp4-GearY else temp2=GearY-temp4
	asm
	LDA	GearY
  	CMP	temp4
  	BCS	.ELF
 	LDA	temp4
  	SEC
  	SBC	GearY
	jmp	.ORC
.ELF
  	SEC
  	SBC	temp4
.ORC
	STA	temp2
end
	; if temp1>8 ||  temp2>5 then goto NOTHINGTODO
	asm
	LDA	#20
  	CMP	temp1
  	BCC	.UUUU
  	LDA	#5
  	CMP	temp2
  	BCS	.OOII
.UUUU
	JMP	.NOTHINGTODO
.OOII
end

	var15{5}=!var15{5}
	if var15{5} then var15{6}=!var15{6}

	if var15{5} && var15{6} then GearSprite=GearSprite+1: dec score=score+5

	; if !var1{3} then goto NOFUCKINGEAR
	asm
	LDA	var1
  	AND	#8
  	BEQ	.NOFUCKINGEAR


.MOD_3p3
	ldy 	#0
	lda	GearSprite
	
Still_have3p3
	CMP	#3
	BCC	SmallerThan3p3	
	iny
	SEC
	SBC	#3
	jmp	Still_have3p3
SmallerThan3p3
	STA	temp13	
	CMP	#0
	BNE	.SS1
end
 	player0:
 	%10000011
 	%11000010
 	%00110100
 	%00111000
 	%01111100
 	%01111000
 	%11111111
 	%11110110
 	%11111001
 	%01100000
 	%01111000
 	%00110000
end
	goto STANGLI
SS1
	asm
	CMP	#1
	BNE	.SS2
end
 	player0:
 	%01001100
 	%01101000
 	%00110000
 	%11111000
 	%11111000
 	%11100111
 	%11110111
 	%11011000
 	%00111100
 	%00110000
 	%00111100
 	%00011000
end
	goto STANGLI
SS2 
	player0:
 	%01011000
 	%01010000
 	%01110000
 	%01111011
 	%11111101
 	%11111110
 	%01111100
 	%00101100
 	%00011110
 	%00011000
 	%00011110
 	%00001100
end
STANGLI
	AUDV0=8: AUDC0=3: AUDF0=6+temp13
NOFUCKINGEAR


NOTHINGTODO
	if var15{7} && WaterLevel<11 then w004=r004+1 
	if r004>130-Hardness then w004=0: w005=16: WaterLevel=WaterLevel+1
	if r005>0 then w005=r005-1: AUDV0=r005: AUDF0= r005: AUDC0=15 

	if r017>0 then w017=r017-1
	if r017 >1 || r017=0 then goto UUUZZUU
	if var1{1}  then gosub SetWaterLevel bank8 else gosub Level0 bank8
UUUZZUU
	w012=r012+1
	if r012=255 then w014=r014+1
	temp1=25-Hardness: if temp1>25 || temp1<5 then temp1=5
	if r014>temp1 then w017=60: BuvarSprite=0: goto DeadBuvar bank2
	if switchselect then goto BackToMenu bank14
	if switchreset then COLUP0=$00: COLUP1=00: goto BackReset bank14
	drawscreen
	goto GameLoop bank7

ChopterBack1
	pfcolors:
 	$8c
 	$8c
 	$8a
 	$8a
 	$8a
 	$88
	$88
 	$88
 	$86
 	$86
 	$86
 	$84
 	$84
	$84
 	$08
 	$08
 	$0a
 	$0a
 	$0a
 	$0c
 	$0c
 	$0c
 	$0c
end
	if var24{6} then return otherbank else return
	bank 7
BuvarStart	
	Score1=3: Score2=31: var1{4}=0: temp8=0: temp9=0: temp10=0: GeigerCenter_X=0: GeigerCenter_Y=0: temp12=0: player1y=160: Hardness=0: player0y=160: BuvarLives=3
	player0x=0: player1x=0
BuvarLevelStart
 	playfield:
 	X..............................X
 	X..............................X
 	X..............................X
 	X..............................X
 	X..............................X
 	X..............................X
 	X..............................X
 	X..............................X
 	X..............................X
	X..............................X
 	X..............................X
 	X..............................X
 	X..............................X
 	X..............................X
 	X..............................X
 	X..............................X
	X..............................X
 	X..............................X
 	X...............................
 	XXXXXXXXXXX.....................
 	XXXXXXXXXXXXXXXXX...............
 	XXXXXXXXXXXXXXXXXXXXXXX.........
 	XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 	XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
end
IntroLoop
	var1{3}=!var1{3}
	if var1{4} then goto GameLoop
	temp8=temp8+1
	on temp9 goto intro_1 intro_2 intro_3 intro_4

intro_1
	if temp8>90 then temp9=temp9+1: temp11=18: temp8=0: pfpixel 0 18 off


	goto DRAAAW
intro_2
	if temp11>0 then temp11=temp11-1
	; AUDV0=temp11/2: AUDF0=temp11/2

	asm
	LDA	temp11
  	lsr
  	STA	AUDV0
    	STA	AUDF0
end
	AUDC0=2


	; if temp11=13 then 	pfpixel 0 17 off
	; if temp11=7 then 	pfpixel 0 16 off 
	; if temp11=3 then 	pfpixel 0 15 off

	asm
	LDA	temp11
	CMP	#13
	BNE	Not13myboy
end
	pfpixel 0 17 off: goto DRAAAW

	asm
Not13myboy
	CMP	#7
	BNE	Not7myboy
end
	pfpixel 0 16 off: goto DRAAAW

	asm
Not7myboy
	CMP	#3
	BNE	Not3myboy
end
	pfpixel 0 15 off: goto DRAAAW

	asm
Not3myboy

end
	if temp11>0 then 	goto DRAAAW



	; if player1x<21 then goto TROLL
	; if !var1{5} then var1{5}=1: player1x=player1x-16: goto TROLL
	; if var1{5} && !var1{6} then var1{6}=1: player1x=player1x-16: goto TROLL
	; if var1{6} then temp9=temp9+1
	asm
	LDX	player1x
  	CPX	#21
  	BCC	.TROLL

  	LDA	var1
  	AND	#32
  	BNE	.skipL0476_666
  	LDA	var1
  	ORA	#32
  	STA	var1
  	jmp	.SavePlayer1x
.skipL0476_666
  	BIT	var1
  	BVS	.skip145then_666
  	LDA	var1
  	ORA	#64
  	STA	var1
	jmp	.SavePlayer1x
.skip145then_666
   	INC	temp9
	JMP 	.TROLL

.SavePlayer1x
  	TXA
  	SEC
  	SBC	#16
	STA	player1x
end

TROLL
 
	player1y=57
	

	; if BuvarSprite<30 then BuvarSprite=BuvarSprite+2 else BuvarSprite=0: temp12=8
	asm
	LDA	BuvarSprite
  	CMP	#30
  	BCS	.skipL0480_667
 	CLC
  	ADC	#2
    	jmp	.skipelse20_667
.skipL0480_667
 	LDA	#8
  	STA	temp12
	LDA	#0
.skipelse20_667
  	STA	BuvarSprite

end
	; if temp12>0 then temp12=temp12-1
	; AUDV0=temp12: AUDC0=3: AUDF0=10-temp12
	asm
	LDA	temp12
	CMP	#0
  	BEQ	.Largert
	SEC
	SBC	#1
	STA	temp12
.Largert

    	STA	AUDV0
  	STA	AUDF0
end
	AUDC0=3
	; if var1{3} then goto DRAAAW else player1x=player1x+1
	asm
	LDA	var1
  	AND	#8
  	BEQ	.skipL0480_987
  	jmp	.DRAAAW
.skipL0480_987
  	INC	player1x

  	LDA	BuvarSprite
  	CMP	#10
  	BCS	.skipL0481_333
end
	player1:
	%00100000
	%00110110
	%00011101
	%00011110
	%00101110
	%01101110
	%01110100
	%01111110
	%01101111
	%00011100
	%00001111
	%00000110
end
	goto DRAAAW

	asm
.skipL0481_333
  	CMP	#20
  	BCS	.skipL0482_444
	CMP	#10
  	BCC	.skipL0482_444
end

	player1:
	%01001000
	%00101000
	%00111000
	%01110100
	%11101100
	%11101000
	%11111000
	%10110000
	%01111000
	%01100000
	%01111000
	%00110000
end
	goto DRAAAW
skipL0482_444
	player1:
	%10011000
	%11110000
	%01111000
	%00111000
	%01101000
	%01101100
	%01101110
	%01111111
	%00011100
	%00001111
	%00000110
	%00000000
end


	goto DRAAAW

intro_3
	AUDV0=0
	if temp8>90 then temp9=temp9+1: temp11=18: temp8=0: pfpixel 0 15 on


 player1:
 	%00001110
 	%00001100
 	%00001100
 	%00011100
 	%01110110
 	%01110110
 	%01110110
 	%01111100
 	%00111110
 	%00011000
 	%00011110
 	%00001100
end
	goto DRAAAW

intro_4
	; if temp11>0 then temp11=temp11-1
	; temp3= temp11/2: AUDV0=temp3: AUDF0=11-temp3: AUDC0=2
	; if temp11=13 then pfpixel 0 16 on
	;  if temp11=7 then 	pfpixel 0 17 on 
	;  if temp11=3 then 	pfpixel 0 18 on
	;  if temp11>0 then 	goto DRAAAW else v{4}=1: goto StartBuvarAgain
	asm
	LDA	temp11
 	CMP	#0
  	BEQ	.skipL0489_77
	SEC
	SBC	#1
	STA	temp11
.skipL0489_77
	TAY
	LSR
  	STA	temp3
  	STA	AUDV0
  	LDA	#11
  	SEC
  	SBC	temp3
  	STA	AUDF0
  	LDA	#2
  	STA	AUDC0
	CPY	#13
	BNE	.Y_not13
end
	pfpixel 0 16 on
	goto DRAAAW
	asm
.Y_not13
	CPY	#7
 	BNE	.Y_not7
end
	pfpixel 0 17 on
	goto DRAAAW
	asm
.Y_not7
	CPY	#3
 	BNE	.Y_not3
end
	pfpixel 0 18 on
	goto DRAAAW
	asm
.Y_not3
	CPY	#0
	BNE	.DRAAAW	
   	LDA	var1
  	ORA	#16
  	STA	var1
  	jmp	.StartBuvarAgain
end

DRAAAW
	if pfread(0,17) then pfcolors:
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$02
	$02
	$02
	$02
	$04
	$04
	$04
end

	if !pfread(0,17) then pfcolors:
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$02
	$02
	$02
	$04
	$04
	$04
	$06
	$06
	$06
end
	if !pfread(0,16) then pfcolors:
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$02
	$02
	$02
	$04
	$04
	$04
	$06
	$06
	$06
	$08
	$08
	$08
end
	if !pfread(0,15) then pfcolors:
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$02
	$02
	$02
	$04
	$04
	$04
	$06
	$06
	$06
	$08
	$08
	$08
	$0a
	$0a
	$0a
end
	 if var1{5} then NUSIZ1=$01
	 if var1{6} then NUSIZ1=$03


	; ScoreColor=Score2/4
	; scorecolor=ScoreColor
	asm

  	LDA	Score2
 	lsr
  	lsr
  	STA	ScoreColor
  	STA	scorecolor
end
	COLUP0=$00: COLUP1=$00: drawscreen
	goto IntroLoop
StartBuvarAgain
	var15{3} = 0
	; if BuvarLives>1 then player1y=57: player1x=21 else player1y=160
	asm
  	LDA	#1
  	CMP	BuvarLives
  	BCS	.skipL0506_66
 	LDA	#21
 	STA	player1x
	LDA	#57
 	jmp	.skipelse22_66
.skipL0506_66
  	LDA	#160
.skipelse22_66
	STA	player1y
end
	; player0y=57: temp3=BuvarLives-1: temp3=temp3*16: player0x=21+temp3
	; var1{5}=0: var1{6}=0 : var15=0
	; BuvarSprite=0
	; w008=player0x: w009=player0y

	asm
	LDA	#57
	STA	player0y
	STA	w009
end
	var15=0
	asm
	LDA	var1
  	AND	#223
	AND	#191
	STA	var1
	LDA	BuvarLives
  	SEC
  	SBC	#1
  	asl
  	asl
  	asl
  	asl
  	CLC
 	ADC	#21
  	STA	player0x
	STA	w008
end

GameLoop
	var1{3}=!var1{3}
	playfieldpos=3

	if var15{3} then goto NoRoom0
Room0
	asm
	LDA	#31
  	lsr
  	lsr
  	STA	scorecolor
      	STA	ScoreColor
end
	player1y=57: WaterLevel=11: Score2=31


	; if BuvarLives=3 then NUSIZ1=$01
	;  if BuvarLives=2 then NUSIZ1=$00
	;  if BuvarLives=1 then player1y=160
	asm
	LDA	BuvarLives
  	CMP	#3
 	BNE	.skipL0514_888
 	LDA	#$01
 	STA	NUSIZ1
	JMP	.KATICA
.skipL0514_888
  	CMP	#1
 	BNE	.KATICA
 	LDA	#160
 	STA	player1y

.KATICA
end
	Hardness=0
	goto	FIKA
NoRoom0
	player0x=r008: player0y=r009
FIKA
	asm
.divide_3
	ldy 	#0
	lda	player0y
	
Still_have3
	CMP	#3
	BCC	SmallerThan3	
	iny
	SEC
	SBC	#3
	jmp	Still_have3
SmallerThan3
	STY	temp13	
end
	
	 asm
	LDA	WaterLevel
	asl
	CLC
	ADC	#4

	STA 	temp1
end
	if temp1>23 then temp1=23
	 if temp13<temp1 then goto NoUnderWater
	
	if !var15{3} then goto Sink
	if var1{1}  then gosub SetWaterLevel bank8 else gosub Level0 bank8


Sink
	; if temp13>temp1 then goto RESTI
	asm
	LDA	temp1
  	CMP	temp13
  	BCC	.RESTI
end
	FallingMeter=0: AUDV0=0
	if joy0fire then player0y=player0y-8 else player0y=player0y+1
	
RESTI
	; temp4=player0x-13: temp4=temp4/4: temp4=temp4-1: if temp4>29 then temp4=30
	; temp5=temp4+1
	asm
	LDA	player0x
  	SEC
  	SBC	#13
  	lsr
  	lsr
  	SEC
	SBC	#1
  	CMP	#29
	BCC	.skipL0527_12
	LDA	#29
.skipL0527_12
	STA	temp4
	CLC
	ADC	#1
	STA	temp5
end
	if pfread(temp4, temp13) then var1{5}=1 else var1{5}=0
	if pfread(temp5, temp13) then var1{6}=1 else var1{6}=0

	; if var15{4} then goto PACAL
	asm
  	LDA	var15
  	AND	#16
  	BNE	.PACAL
end

	; if joy0fire then var15{4}=1 : 	SwimPower=4: FallingMeter=8 : BuvarSprite=BuvarSprite+8
	asm
	bit	INPT4
  	BMI	.skipL0533_774
  	LDA	var15
  	ORA	#16
  	STA	var15
  	LDA	#4
  	STA	SwimPower
  	LDA	#8
  	STA	FallingMeter
  	CLC
  	ADC	BuvarSprite
  	STA	BuvarSprite
.skipL0533_774
end
PACAL
	if !joy0fire then var15{4} =0

	; if SwimPower>0 then goto NoSink
	asm
	LDA	#0
  	CMP	SwimPower
  	BCC	.NoSink
end

	 if var1{5} ||   var1{6} then goto NYEHHEHE
   	if var1{3}  then player0y=player0y+1


NoSink

	 if FallingMeter>0 then FallingMeter=FallingMeter-1: AUDV0=FallingMeter: AUDC0=12: AUDF0=16-FallingMeter

	if SwimPower=0 then goto DODODO else if var1{3}  then  SwimPower=SwimPower-1
	temp15=temp13-3
	if pfread(temp4, temp15) then goto MEHH
 	if pfread(temp5,temp15) then goto MEHH
	goto EHH
MEHH
	SwimPower=0: FallingMeter=0: AUDV0=0: goto PJUH
EHH
	player0y=player0y-SwimPower/2
	
PJUH
	; temp15=temp13-2: temp14=temp13-1
	asm
	LDA	temp13
  	SEC
  	SBC	#1
  	STA	temp14
  	SEC
  	SBC	#1
  	STA	temp15
end

	; if !joy0left then goto DORIGHT
	asm
	bit	SWCHA
  	BVS	.DORIGHT
end
	if pfread(temp4, temp15) then goto DORIGHT
	if !pfread(temp4, temp14) then player0x=player0x-1: BuvarSprite=BuvarSprite+4: var1{7} =1
DORIGHT
	; temp12=temp5+1
	; if temp12>31 then temp12=31
	asm
  	LDA	temp5
  	CLC
  	ADC	#1
  	STA	temp12
  	LDA	#31
  	CMP	temp12
  	BCS	.SKIPP2
	STA	temp12
.SKIPP2
end
	 if !joy0right then goto DODODO
	asm
	bit	SWCHA
  	BMI	.DODODO

end
	if pfread(temp12, temp15) then goto DODODO	
	if !pfread(temp12, temp14) then player0x=player0x+1: BuvarSprite=BuvarSprite+4: var1{7} =0
DODODO
	; if BuvarSprite>40 then BuvarSprite=BuvarSprite-40
	asm
  	LDA	BuvarSprite
  	CMP	#41
 	BCC	.skipL0553_1112
  	SEC
  	SBC	#40
  	STA	BuvarSprite
.skipL0553_1112

end
	asm
	LDA	BuvarSprite
  	CMP	#10
  	BCS	.S10
end
	player0:	
 	%10100000
 	%11000000
 	%10100000
 	%11110001
 	%11111010
 	%01111100
 	%01110111
 	%01101100
 	%00111110
 	%00011000
 	%00011110
 	%00001100
end
	goto NoFaller
S10
	asm
  	CMP	#8
  	BCS	.S20
  	CMP	#20
  	BCS	.S20
end

	player0:	
 	%00010000
 	%10100000
 	%11110000
 	%00101000
 	%01101100
 	%01110100
 	%00110100
 	%00111110
 	%00011111
 	%00001100
 	%00001111
 	%00000110
end
	goto NoFaller
S20
	asm
  	CMP	#18
  	BCS	.S30
  	CMP	#30
  	BCS	.S30
end
	player0:	
 	%01000000
 	%01100000
 	%10010000
 	%11111000
 	%00111100
 	%01111100
 	%11001100
 	%01111000
 	%10111100
 	%00110000
 	%00111100
 	%00011000
end
	goto NoFaller
S30

	player0:	
 	%00010000
 	%00010100
 	%00111000
 	%01110000
 	%11110000
 	%11111000
 	%11001110
 	%11111100
 	%01111000
 	%01100000
 	%01111000
 	%00110000
end
NOMORE
	goto NoFaller

NoUnderWater
	; temp4=player0x-13: temp4=temp4/4: temp4=temp4-1: if temp4>29 then temp4=30
	; temp5=temp4+1

	asm
	LDA	player0x
  	SEC
  	SBC	#13
	lsr
  	lsr
  	STA	temp4
	STA	temp5
  	DEC	temp4
  	LDA	#29
  	CMP	temp4
  	BCS	.FACE555
  	LDA	#31
    	STA	temp5
	STA	temp4
	dec	temp4
.FACE555
end
	if pfread(temp4, temp13) then var1{5}=1 else var1{5}=0
	if pfread(temp5, temp13) then var1{6}=1 else var1{6}=0
	if !var1{5} && !var1{6} then goto Falling
	FallingMeter=0

NYEHHEHE	
	; if temp12>0 then temp12=temp12-1

	; AUDV0=temp12
	asm
	LDA	temp12
  	CMP	#0
  	BEQ	.MoveOn
  	SEC
	SBC	#1
	STA	temp12
.MoveOn
	STA	AUDV0
end
	AUDC0=3: AUDF0=10-temp12

	; temp2=temp4-1
	;  temp3=temp5+1: temp6=temp13-2: temp15=temp6-1
	asm
	LDA	temp4
	STA	temp2
	dec	temp2
	lda	temp5
	sta 	temp3
	inc 	temp3
	LDA	temp13
	SEC
	SBC	#2
	STA	temp6
	STA 	temp15
	dec 	temp15
end
	var15{1}=0 : var15{2}=0 
	asm
	LDA	var15
  	AND	#253
	AND	#251
  	STA	var15
end
	w000=0: w001=0: w002=0: w003=0

	

	; if joy0left then goto GOLEFT
	; if joy0right then goto GORIGHT
	asm
	bit	SWCHA
 	BVC	.GOLEFT
 	bit	SWCHA
  	BPL	.GORIGHT

end
	goto NO_GO

GOLEFT
	if pfread(temp4, temp6) then w000=1
	if pfread(temp4, temp15) then w001=1
	; if r000=1 && r001=1 then var15{1}=1 : goto NO_GO
	; if r000=1 && r001=0 then player0y=player0y-3
	asm
  	LDA	r000
 	CMP	#1
  	BNE	.NO_GO
  	LDA	r001
 	CMP	#1
  	BNE	.WeWillSee
  	LDA	var15
  	ORA	#2
  	STA	var15
  	jmp	.NO_GO
.WeWillSee
	SEC
	SBC	#3
  	STA	player0y

end
	goto NO_GO
GORIGHT
	if pfread(temp3, temp6) then w002=1
	if pfread(temp3, temp15) then w003=1
	;  if r000=1 && r001=1 then var15{2}=1 : goto NO_GO
	;  if r000=1 && r001=0 then player0y=player0y-3
	asm
  	LDA	r000
 	CMP	#1
  	BNE	.NO_GO
  	LDA	r001
 	CMP	#1
  	BNE	.WeWillSee2
  	LDA	var15
  	ORA	#4
  	STA	var15
  	jmp	.NO_GO
.WeWillSee2
	SEC
	SBC	#3
  	STA	player0y

end
NO_GO

	var15{0} = 0

	; if joy0left && !var15{1} && r000=0 && r001=0 then  var15{0} = 1 : var1{7} =1 
	;  if joy0right && !var15{2} && r002=0 && r003=0  then  var15{0} = 1 : var1{7} =0  

	asm

	bit	SWCHA
 	BVS	.Maybe2
  	LDA	var15
  	AND	#2
 	BNE	.Maybe2
 	LDA	#0
  	CMP	r000
  	BNE	.Maybe2
 	CMP	r001
  	BNE	.Maybe2
  	LDA	var1
  	ORA	#128
  	STA	var1
	JMP	.SetShit
.Maybe2
	bit	SWCHA
  	BMI	.NotSet1
  	LDA	var15
  	AND	#4
  	BNE	.NotSet1
  	LDA	#0
  	CMP	r002
  	BNE	.NotSet1
  	CMP	r003
  	BNE	.NotSet1
 	LDA	var1
  	AND	#127
  	STA	var1
.SetShit
  	LDA	var15
 	ORA	#1
  	STA	var15
.NotSet1
end
	 if var15{0} then goto NoStandStill
	AUDV0=0
	player0:
 	%00001110
 	%00001100
 	%00001100
 	%00011100
 	%01110110
 	%01110110
 	%01110110
 	%01111100
 	%00111110
 	%00011000
 	%00011110
 	%00001100
end
	BuvarSprite=0

	goto NoFaller
NoStandStill
	if BuvarSprite=0 && temp12=0 then  temp12=8  
	if !joy0left && !joy0right then var15{0} = 0 
	if BuvarSprite>30 then BuvarSprite=0 else BuvarSprite=BuvarSprite+2 
	

	if var1{3} then goto IIII
	temp6=temp13-1
	if pfread(temp4, temp6) then if joy0left then player0y=player0y-3
	if pfread(temp3, temp6) then if joy0right then player0y=player0y-3

	if var1{7} && player0x>22 then player0x=player0x-1 
	if !var1{7} && player0x<138 then player0x=player0x+1

IIII
	if BuvarSprite<10 then player0:
	%00100000
	%00110110
	%00011101
	%00011110
	%00101110
	%01101110
	%01110100
	%01111110
	%01101111
	%00011100
	%00001111
	%00000110
end
	if BuvarSprite<20 && BuvarSprite>9 then player0:
	%01001000
	%00101000
	%00111000
	%01110100
	%11101100
	%11101000
	%11111000
	%10110000
	%01111000
	%01100000
	%01111000
	%00110000
end

	if BuvarSprite>19 then player0:
	%10011000
	%11110000
	%01111000
	%00111000
	%01101000
	%01101100
	%01101110
	%01111111
	%00011100
	%00001111
	%00000110
	%00000000
end
	goto NoFaller
Falling


	if temp13<temp1 then AUDV0=0 : FallingMeter=0: goto Sink
	player0y=player0y+1
	if FallingMeter<16 then FallingMeter=FallingMeter+1
	asm
	LDA	FallingMeter
	STA	AUDF0
	lsr
	CLC
	ADC	#2
	STA	AUDV0
	LDA	#1
	STA	AUDC0
end
 	player0:
 	%01010000
 	%01111100
 	%00001010
 	%00011100
 	%01111100
 	%11111100
 	%11111110
 	%11110101
 	%00111010
 	%01101101
 	%01100100
 	%00110000
end

NoFaller




	if !var15{3} then COLUP1=$00: goto NoNeedForLight
	LightLooper=LightLooper+1

	; if !var1{1} && LightLooper>80 then LightLooper=0
	; if var1{1} && LightLooper>40 then LightLooper=0
	; if  LightLooper>0 then goto NOLIGHT
	asm
 	LDA	var1
  	AND	#2
 	BNE	NextTry
  	LDA	#80
	JMP	TryCMP
NextTry
	LDA	#40
TryCMP
 	CMP	LightLooper
  	BCS	NoGood
	LDA	#0
  	STA	LightLooper
	JMP	ComeHere
NoGood
  	LDA	#0
  	CMP	LightLooper
 	BNE	.NOLIGHT
ComeHere
end
	 ; if Score2>0 && var1{1} then Score2=Score2-1
	 ; if Score2<31 && !var1{1} then Score2=Score2+1
	asm
 	LDA	var1
	AND	#2
	BEQ	.VUV

	LDA	Score2
  	CMP	#0
	BEQ	.NOLIGHT
    	DEC	Score2
	JMP	.NOLIGHT
.VUV
  	LDA	Score2
	CMP	#31
  	BCS	.NOLIGHT
	INC	Score2
end

NOLIGHT
	if !var1{1} then player1y=160: goto Looper
 	player1:
 	%00001000
 	%00010000
 	%00100100
 	%01001110
 	%00011111
 	%00111111
 	%01111111
 	%11111111
 	%11111111
 	%01111111
 	%00111111
 	%00011111
 	%01001110
 	%00100100
 	%00010000
 	%00001000
end
	player1y=player0y+2: COLUP1=$0e
	; if player0x>131 && !var1{7}  then NUSIZ1=$00
	; if player0x<30 && var1{7}  then NUSIZ1=$00

	asm
	LDX	#$07
  	BIT	var1
  	BMI	.popo

	LDA	#131
  	CMP	player0x
  	BCS	.GetHere
 	JMP	.Ooohh
.popo
  	LDA	player0x
  	CMP	#30
 	BCS	.GetHere
.Ooohh
  	LDX	#$00
.GetHere
 	STX	NUSIZ1

end

	; if !var1{7} then player1x=player0x+4 else  REFP1=8: player1x=player0x-30  
	; if var1{7} && player0x<30 then player1x=player0x-8  
	asm
 	BIT	var1
  	BMI	.REGGEL
  	LDA	player0x
	CLC
  	ADC	#4
	JMP	.Glory
.REGGEL
  	LDA	#8
 	STA	REFP1
	LDA	player0x
  	CMP	#30
  	BCC	.ESTE
	SEC
  	SBC	#30
	JMP	.Glory
.ESTE
  	SEC
  	SBC	#8
.Glory
  	STA	player1x
end

Looper
	asm
	LDA	var1
	AND	#4
	BNE	.GINGER
end
	; if var1{2} then goto GINGER
	
	 if joy0down then var1{1}=!var1{1}: var1{2}=1	

GINGER

	 if !joy0down then var1{2}=0
	 if Score2=0 then var1{1}=0 
	asm
	LDA	Score2
  	lsr
  	lsr
  	STA	scorecolor
      	STA	ScoreColor
end

NoNeedForLight
	; ScoreColor=Score2/4
	;  ScoreColor=scorecolor


	if player0x<137 then goto MEREK

	if var15{3}  then goto  BuvarComplete bank2 else goto GenerateRoom bank8
MEREK
	if var1{7} then REFP0=8
	COLUP0=$00


 	; if !var15{3} ||  var1{3} then goto NoGearDraw
	asm
	LDA	var15
  	AND	#8
  	BNE	.FASZOM
end
	if switchselect then goto BackToMenu bank14
	if switchreset then COLUP0=$00: COLUP1=00: goto BackReset bank14
	drawscreen
	goto GameLoop bank7
	
FASZOM

	if player0y>77 || player0y<10 then if r009<78 && r009>9 then  player0y=r009




	w008=player0x: w009=player0y

	asm
  	LDA	var1
  	AND	#8
  	BNE	.NoGearDraw

end
	player0y=GearY: player0x=GearX
	COLUP0=$00: NUSIZ0=$00: REFP0=$00
		asm
.MOD_3p1
	ldy 	#0
	lda	GearSprite
	
Still_have3p1
	CMP	#3
	BCC	SmallerThan3p1	
	iny
	SEC
	SBC	#3
	jmp	Still_have3p1
SmallerThan3p1
	STA	temp13	
	CMP	#0
	BNE	.OneMore1
end

	player0:
 	%00111100
 	%01001010
	%01111010
 	%01011110
 	%01010010
 	%00111100
end
	goto NoGearDraw
OneMore1
	asm
	CMP	#1
	BNE	.TwoMore
end
	player0:
 	%00111100
 	%01100110
 	%01011010
 	%01011010
 	%01100110
 	%00111100
end
	goto NoGearDraw
TwoMore
	player0:
 	%00111100
 	%01010010
 	%01011110
 	%01111010
 	%01001010
 	%00111100
end

NoGearDraw

	 if !var15{3}  then goto NONONONOO


	temp1=WaterLevel*3: temp1=temp1+10: temp2=rand&31
	if RadCentY<temp1 then RadCentY=76
	; if RadCentY<90 || temp2<Hardness   then goto MoveParticle
	asm
	LDA	Hardness
	
	CMP	temp2
	BCS	.MoveParticle
  	LDA	RadCentY
  	CMP	#76
  	BCC	.MoveParticle
end

	if var1{3} then var24{1}  =0 : RadCentX=22 else var24{1}  =1 : RadCentX=138 
	
	if var1{7}  then var24{2} = 0: RadCentY=temp1 else var24{2} = 1: RadCentY=76    

MoveParticle
	w013=r013+1
	; if Hardness>14 then goto FASTASHELL
	asm
	LDA	#6
  	CMP	Hardness
	BCC	.FASTASHELL
end

	; if r013<15-Hardness then goto NOMOVE2 else w013=0
	asm
	LDA	#7
  	SEC
  	SBC	Hardness
 	CMP	r013
  	BCS	.NOMOVE2
 	LDA	#0
  	STA	w013
end
FASTASHELL
	;  if var24{1}  && RadCentX<23 then  var24{1}  =0: RadCentY=120: bally=120: goto NONONONOO
	;  if !var24{1}  && RadCentX>137 then  var24{1}  =1: RadCentY=120: bally=120: goto NONONONOO

	asm
	LDX	RadCentX
	LDA	var24
 	AND	#2
 	BEQ	.SAJT
  	LDA	RadCentX
  	CPX	#23
  	BCS	.VIZELET
  	LDA	var24
 	AND	#253
	JMP	.KAKI
.SAJT
  	CPX	#137
  	BCC	.VIZELET
  	LDA	var24
  	ORA	#2
.KAKI
  	STA	var24
  	LDA	#120
  	STA	RadCentY
 	STA	bally
  	jmp	.NONONONOO
.VIZELET
end

	if var24{1} then RadCentX=RadCentX-1 else RadCentX=RadCentX+1
	; if !var24{2} then goto GODOWN2
	asm
	LDA	var24
  	AND	#4
  	BEQ	.GODOWN2

end
	asm
	LDA 	WaterLevel
	asl
	CLC
	ADC	WaterLevel
	CLC
	ADC	#12
	STA 	temp1
end
	if RadCentY >temp1 then RadCentY=RadCentY-1 else var24{2}  = 0

	goto NOMOVE2
GODOWN2 
	if RadCentY <72 then RadCentY=RadCentY+1 else var24{2}  = 1


NOMOVE2
	; if !var1{3} then bally=RadCentY else bally=160
	asm
  	LDA	var1
  	AND	#8
  	BNE	.HONT
	LDA	RadCentY
  	jmp	.ANDRAS
.HONT
  	LDA	#160
.ANDRAS
  	STA	bally
end
	ballx=RadCentX
	CTRLPF=$15: ballheight=2


NONONONOO
	; if WaterLevel=0 then goto NoSinker
	asm
	LDA	WaterLevel
  	CMP	#0
  	BEQ	.NoSinker
end


	; temp1=Hardness*8
	; if GearSprite<26+temp1 then goto NoSinker
	asm
	LDA	Hardness
  	asl
  	asl
  	asl
  	STA	temp1
  	CLC
  	ADC	#26
  	CMP 	GearSprite
 	BCS	.NoSinker
end



	var15{5}=!var15{5}
	if var15{5} then var15{6}=!var15{6}
	;  if !var15{5} || !var15{6} then goto NoSinker
	asm
	LDA	var15
  	AND	#32
  	BEQ	.NoSinker
 	BIT	var15
  	BVC	.NoSinker
end
	; temp1=PlaceOfDoor+2
	;  temp2=temp1-r020
	asm
	LDA	PlaceOfDoor
  	CLC
  	ADC	#2
 	STA	temp1
  	SEC
 	SBC	r020
  	STA	temp2
end


	if r020<3 then w020=r020+1
	pfvline 31 temp2 temp1 off


NoSinker


	goto bank6bullshit bank6
	bank 8



GenerateRoom
	AUDV0=0: AUDV1=0: player0y=160: player1y=160: bally=160: missile1y=160: var1{7} =0
	Hardness=Hardness+1
	var15{7} = 0
	pfcolors:
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
end
	temp8=rand
	temp1=rand&3
	; temp2=rand&1: temp1=temp1+temp2
	asm
  	lda	rand
  	lsr
  	bcc	*+4
  	eor	#$B4
  	sta	rand
  	AND	#1
  	CLC
  	ADC	temp1
  	CMP	#1
  	BNE	.PFIS1
end
 	playfield:
 	XXX.............XXXXXX.........X
 	X.........X.......X........XXXXX
 	........XXXXX..............XXXXX
 	..........X................X...X
 	..........XXXXXX.....XXXXXXX...X
 	...XXXX........................X
 	XXXX..............XX...........X
 	XX.....XXXXXXX.............XXXXX
 	X......X...................XXXXX
	X....XXX.......XXXXXXXX........X
 	X......XXXXX...X......XXX......X
 	X..............X......X........X
 	XXXXX......XXXXXX.....X........X
 	X..X.........X........X..XXXXXXX
 	X............X.X...X..X.......XX
 	X....XXX.....XXX...XXXX......XXX
 	X....X.XXXXXXX.X...X........XXXX
 	X...XX...X..............XXXXXXXX
 	X........X.....................X
 	XXX......X.....XX..............X
 	XXXX..........XXXXXX...........X
 	XXXXX......XXXXXXXXXX..........X
 	XXXXXX....XXXXXXXXXXXX.........X
end
	goto CHOSEN
	asm  
.PFIS1
  	CMP	#2
  	BNE	.PFIS2
end
	playfield:
 	X....XXX.....XXXX......XXXX....X
 	X........................X.....X
 	X.XX.....................X.....X
 	X.........XXXXX..........X.....X
 	X..XXXX...X...X................X
 	X.........X...X...XXXXXXXXXX...X
 	X......X..X...X..........X.....X
 	X....XXXXXX..............X.....X
 	X......X.........X.......XXXXXXX
 	X......X.........X.......X.....X
 	XXXXXXXX..XXX....XXX.....X.....X
 	X..................X.X.........X
 	X.............XXXXXXXX.........X
 	X....................X.....XXXXX
 	X......XXX...........X.........X
 	X....................X.........X
 	X...........XXX...XXXXXXXXXX...X
 	XXXXXXX...........X....X.......X
 	X....X............X....X.......X
 	X....XXXXX....XXXXX........XXXXX
 	X....X.........................X
 	X..............................X
 	X........XXXXXX................X
end
	goto CHOSEN
	asm  
.PFIS2
  	CMP	#3
  	BNE	.PFIS3
end
  	playfield:
 	XXXXXXXXXXXXX..................X
 	X..........X.......XXXXXX....XXX
 	X..........X............X......X
 	XXXXXX.....XXXXXX.......XXXX...X
 	X....X..................X......X
 	X....X...............XXXX......X
 	X............................XXX
 	XXXXXXXX.......................X
 	X......X..........X....XXXX....X
 	X......X..........XXXXXX..X....X
 	X......XXXXX...XXXXX......X....X
 	XXXX...............X......X....X
 	X..................X......X....X
 	X.....XXXXXXXXXXX..............X
 	X.....X........................X
 	X.....X...........XXXXXXXXX....X
 	X..................X......X....X
 	X..................X...........X
 	XXXXXXX............XXXXXX......X
 	X.....XXXXX....XXXXX...X.....XXX
 	X...........................XXXX
 	X..........................XXXXX
 	XXXXXXXX..............XXXXXXXXXX
end
	goto CHOSEN
	asm  
.PFIS3
  	CMP	#4
  	BNE	.PFIS4
end
  	playfield:
 	X..............................X
 	X...............X.......XXXXXXXX
 	X..XXX...XXX....X..........X...X
 	X..X.......X....X..........X...X
 	X..X.......XXXXXXXXXX......X...X
 	X..X.......XXXXXX..............X
 	X..XXX...XXXXXXXX....XXXXX.....X
 	X..........X..X.........X......X
 	X..........X............XXXXXXXX
 	XXXX.......X.......X....X......X
 	XXXXX..............X...........X
 	XXXXXX.............X...........X
 	XXXXXXX............X...........X
 	XXXXXXXXXXXX......XXXXXXX......X
 	X..............................X
 	X....X.........X...............X
 	X....X.........X...............X
 	X....XXXXXXXXXXXXXX....XXXXXXXXX
 	X..............X...............X
 	X.....X.....X..X...............X
 	XXXXXXX.....XXXX...........XXXXX
 	X.....X.....X..X...........X...X
 	X..............XXXXX...........X
end
	goto CHOSEN
PFIS4
  	playfield:
 	XXXXXXXXXXXXX..................X
 	X..........X.......XXXXXX....XXX
 	X..........X............X......X
 	XXXXXX.....XXXXXX.......XXXX...X
 	X....X..................X......X
 	X....X...............XXXX......X
 	X............................XXX
 	XXXXXXXX.......................X
 	X......X..........X....XXXX....X
 	X......X..........XXXXXX..X....X
 	X......XXXXX...XXXXX......X....X
 	XXXX...............X......X....X
 	X..................X......X....X
 	X.....XXXXXXXXXXX..............X
 	X.....X........................X
 	X.....X...........XXXXXXXXX....X
 	X..................X......X....X
 	X..................X...........X
 	XXXXXXX............XXXXXX......X
 	X.....XXXXX....XXXXX...X.....XXX
 	X...........................XXXX
 	X..........................XXXXX
 	XXXXXXXX..............XXXXXXXXXX
end

CHOSEN
Spin
	; temp8=temp8-1
	; if temp8=0 then goto Generator2
	asm
	LDA	temp8
	SEC
	SBC	#1
	STA	temp8
	CMP	#0
	BEQ	.Generator2
end
	pfscroll downdown
	COLUP0=0: COLUP1=0
	AUDV0 = 8 : AUDC0=6: AUDF0=temp8

	GeigerFade=1: GeigerCount=0: var24{0}=0 : AUDV1=0
	drawscreen
	goto Spin
Generator2
	temp9=1: temp10=1: temp11=0
	if temp8>Hardness then AUDV0=0: temp8=0: goto Generator3

AddTiles	
	;temp3=rand&63
	;if temp3<Hardness then pfpixel temp9 temp10 on
	asm
	lda	rand
 	lsr
  	bcc	*+4
  	eor	#$B4
  	sta	rand
  	AND	#127
  	CMP	Hardness
  	BCC	.EHHHH
end
	pfpixel temp9 temp10 on
EHHHH
	temp9=temp9+1: if temp9>30 then temp9=1: temp10=temp10+3

	if temp10>22 then temp10=1: temp9=1: goto RemoveTiles
	
	COLUP0=0: COLUP1=0
 	temp11=temp11+1
	if temp11>3 then temp11=0: AUDV0=8: AUDC0=temp10: AUDF0=temp9 : GeigerFade=1: GeigerCount=0: var24{0}=0 : AUDV1=0: drawscreen
	goto AddTiles
RemoveTiles
	; temp3=rand&63

	; if temp3<Hardness*2  then pfpixel temp9 temp10 off
	asm
	LDA	Hardness
	asl
	sta	temp3
	lda	rand
 	lsr
  	bcc	*+4
  	eor	#$B4
  	sta	rand
  	AND	#63
  	CMP	temp3
  	BCC	.EHHHH2
end
	pfpixel temp9 temp10 off
EHHHH2
	COLUP0=0: COLUP1=0
	temp9=temp9+1: if temp9>30 then temp9=1: temp10=temp10+1
	if temp10>21 then goto Generator3
 	temp11=temp11+1: if temp11>3 then temp11=0: AUDV0=8: AUDC0=temp10: AUDF0=31-temp9: GeigerFade=1: GeigerCount=0: var24{0}=0 : AUDV1=0: drawscreen

	goto RemoveTiles


Generator3
 	pfhline 0 0 31 on: pfhline 0 22 31 on
	CTRLPF=$35

	AUDV0=0
	pfvline 0 0 22 on: pfvline 31 0 22 on
	;temp4=(rand&3)+2: StartPoz=temp4: WaterLevel=temp4+4
	;temp5= temp4+1: temp6= temp4+2: temp8=temp4+3
	asm
	lda	rand
  	lsr
  	bcc	*+4
  	eor	#$B4
  	sta	rand
  	AND	#3
  	CLC
  	ADC	#1
	TAY
	STY	temp15
	INY
 	STY	StartPoz
	INY
	STY	temp5
	INY
	STY	temp6
	INY
	STY	temp8
	INY
	STY	WaterLevel

end
	pfhline 0 temp15 15 off

	pfhline 0 StartPoz 15 off
	pfhline 0 temp5 15 off
	pfhline 0 temp6 15 off
	pfhline 0 temp8 7 on


OneDone
	drawscreen
	; temp4=(rand&7)+11 : PlaceOfDoor=temp4 
	; temp5= temp4+1: temp6= temp4+2: temp8=temp4+3

	asm
	lda	rand
  	lsr
  	bcc	*+4
  	eor	#$B4
  	sta	rand
 	AND	#7
  	CLC
  	ADC	#11
  	STA	PlaceOfDoor
	TAY
	INY
	STY	temp5
	INY
	STY	temp6
	INY
	STY	temp8

end
	pfhline 23 PlaceOfDoor 31 off
	pfhline 23 temp5 31 off
	pfhline 23 temp6 31 off
	pfhline 23 temp8 31 on
	drawscreen
SearchForGearPlace

	; temp10=(rand&31)+12: if temp10>25 then temp10=25
	asm
	lda	rand
 	lsr
  	bcc	*+4
 	eor	#$B4
  	sta	rand
  	AND	#31
  	CLC
  	ADC	#12
	STA	temp10	
  	LDA	#25
  	CMP	temp10
  	BCS	.ZZZZ
  	STA	temp10
.ZZZZ
end
	; temp9=(rand&15)+9-Hardness
	; temp9=temp9+(rand&3): if temp9>20 then temp9=20

	asm
	lda	rand
  	lsr
  	bcc	*+4
  	eor	#$B4
 	sta	rand
  	AND	#15
  	CLC
  	ADC	#11
  	SEC
  	SBC	Hardness
  	STA	temp9
  	lda	rand
  	lsr
  	bcc	*+4
  	eor	#$B4
  	sta	rand
  	AND	#3
	CLC
	ADC	temp9
    	STA	temp9
  	LDA	#20
  	CMP	temp9
  	BCS	.JJJJ
  	STA	temp9
.JJJJ
  	LDA	#14
  	CMP	temp9
  	BCC	.JJJJ2
  	STA	temp9
.JJJJ2	
end
	; missile1x=temp10*4: missile1x=missile1x+13: missile1y=temp9*3
	asm
	LDA	temp10
  	asl
  	asl
  	CLC
  	ADC	#13
  	STA	missile1x
  	LDA	temp9
  	asl
  	clc
 	adc	temp9
  	STA	missile1y
end
	AUDV0=8: AUDC0=temp9: AUDF0=temp10

	COLUP0=0: COLUP1=0
	GeigerFade=1: GeigerCount=0: var24{0}=0 : AUDV1=0
	drawscreen
	temp8=255: temp9=10
GotGearPlace
	GearX = missile1x: GearY= missile1y: missile1y=0: temp14=0
	temp8=1: temp12=1: temp9=2: temp11=2: temp10=3: temp13=3
Corrector1
	temp3=0: temp4=0: temp5=0: temp6=0: w000=0: w001=0
	if pfread(temp11,temp8) then temp4=1
	if pfread(temp11,temp9) then temp5=1
	if pfread(temp11,temp10) then temp6=1
	if pfread(temp12,temp9) then temp3=1: w000=1
	if pfread(temp13,temp9) then temp3=1: w001=1


	; temp1=rand&31
	; if temp1<Hardness then goto NOOOONE
	asm
	lda 	Hardness

	sta 	temp1
	lda	rand
  	lsr
 	bcc	*+4
  	eor	#$B4
 	sta	rand
  	AND	#31
  	CMP	temp1
  	BCC	.RRRE
	JMP	.NOOOONE
.RRRE
end
	if temp4=0 && temp5=1 && temp6=1 then pfpixel temp11 temp8 off: pfpixel temp11 temp9 off
	
	if temp4=0 && temp5=1 && temp6=0 && temp3=0 then pfpixel temp11 temp8 off: pfpixel temp11 temp9 off: pfpixel temp11 temp10 off
	if temp4=1 && temp5=0 && temp6=1 && temp3=0 then pfpixel temp11 temp8 off: pfpixel temp11 temp9 off: pfpixel temp11 temp10 off
	if temp5 =1 && r000=0 && temp12>1 && temp10<22 then temp15=temp12-1: pfpixel temp15 temp10 off: pfpixel temp12 temp10 off
	if temp5 =1 && r001=0 && temp13<29 && temp10<22 then temp15=temp13+1: pfpixel temp15 temp10 off: pfpixel temp13 temp10 off

NOOOONE

	 temp11=temp11+1
	if temp11>29 then temp11=2: temp9=temp9+1
	; temp12=temp11-1: temp13=temp11+1: temp8=temp9-1: temp10=temp9+1
	asm
	LDY	temp11
	DEY
	STY	temp12
	INY
	INY
	STY	temp13
	LDY	temp9
	DEY
	STY	temp8
	INY
	INY
	STY	temp10
end

	temp14=temp14+1



	AUDV0=8: AUDC0=temp9: AUDF0=temp11
	if temp9=21 then AUDV0=0: goto CorrectDone
	COLUP0=0: COLUP1=0
	if temp14>3 then temp14=0: GeigerFade=1: GeigerCount=0: var24{0}=0 : AUDV1=0: drawscreen
	
	goto Corrector1

CorrectDone

	pfhline 0 0 31 on: pfhline 0 22 31 on
	pfhline 0 WaterLevel 5
	temp8=PlaceOfDoor+3: pfhline 26 temp8 31 on
	pfvline 31 PlaceOfDoor temp8 on
	asm
divide_32
	ldy 	#0
	lda	GearY
	
Still_have32
	CMP	#3
	BCC	SmallerThan32	
	iny
	SEC
	SBC	#3
	jmp	Still_have32
SmallerThan32
	
	STY	temp13	

end


	; temp8=WaterLevel: temp8=temp8/2 
	asm
	LDA	WaterLevel
	lsr
 	sta 	temp8
end
	WaterLevel=22

	asm
.Geardivide
	ldy 	#0
	lda	GearY
	
Still_haveG
	CMP	#3
	BCC	SmallerThanG	
	iny
	SEC
	SBC	#3
	jmp	Still_haveG
SmallerThanG
	INY
	STY	temp13	
end

	; temp4=GearX-13: temp4=temp4/4
	asm
	LDA	GearX
	SEC
	SBC	#13
	lsr
	lsr
	sta 	temp4
end

	; if temp13<5 then temp13=5
	; if temp13>21 then temp13=21
	asm
	LDA	#5
  	CMP	temp13
  	BCC	.LOP1
  	STA	temp13
.LOP1
	LDA	#21
  	CMP	temp13
  	BCS	.LOP2
  	STA	temp13
.LOP2
end


	; if temp4<3 then temp4=3
	; if temp4>29 then temp4=29
	asm
	LDA	#3
 	CMP	temp4
 	BCC	.LOP3
 	STA	temp4
.LOP3
  	LDA	#29
 	CMP	temp4
  	BCS	.LOP4
  	STA	temp4
.LOP4
end


	temp5=temp4-1
	pfhline temp5 temp13 temp4 on
	temp13=temp13-1
	pfhline temp5 temp13 temp4 off
	temp13=temp13-1
	pfhline temp5 temp13 temp4 off
	temp13=temp13-1
	pfhline temp5 temp13 temp4 off


RiseWater
	if WaterLevel>temp8 then WaterLevel=WaterLevel-1: AUDV0=8: AUDC0=6: AUDF0=WaterLevel-10 else goto SetAndGoBack
	GeigerFade=1: GeigerCount=0: var24{0}=0 : AUDV1=0
	drawscreen
	
	goto RiseWater



SetAndGoBack
	temp1=StartPoz-1
	pfhline 1 temp1 16 off
	temp1=temp1+1
	pfhline 1 temp1 16 off
	temp1=temp1+1
	pfhline 1 temp1 16 off
	temp1=temp1+1
	pfhline 1 temp1 16 off
	temp1=temp1+1
	pfhline 1 temp1 16 off

	var1{1}=0: Score2=31
	var15{3} =1: var24{0} =1
	w008=26: w009=StartPoz*3:  w009=r009-1: AUDV0=0
	if r009<13 then w009=13
	player0y=r009
	RadCentX=140: RadCentY=160: bally=160
	GearSprite=0: w004=0: w017=0: w012=0: w014=0: w011=200
	GeigerFade=1: GeigerCount=0: var24{0}=1 
	goto GameLoop bank7
Redness
	pfcolors:
	$00
	$40
	$42
	$42
	$42
	$42
	$44
	$44
	$44
	$44
	$44
	$44
	$44
	$44
	$44
	$44
	$44
	$42
	$42
	$42
	$42
	$40
	$40
end
	return otherbank

SetWaterLevel
	if WaterLevel>11 then WaterLevel=11
	on WaterLevel goto Level10 Level9 Level8 Level7 Level6 Level5 Level4 Level3 Level2 Level1 Level0

Level0
	pfcolors:
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
end
	return otherbank

Level1
	pfcolors:
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$02
	$02
end
	return otherbank

Level2
	pfcolors:
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$02
	$02
	$02
	$02
end
	return otherbank

Level3
	pfcolors:
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$02
	$02
	$02
	$02
	$02
	$02
end
	return otherbank

Level4
	pfcolors:
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$02
	$02
	$02
	$02
	$02
	$02
	$02
	$02
end
	return otherbank

Level5
	pfcolors:
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$02
	$02
	$02
	$02
	$02
	$02
	$02
	$02
	$02
	$02
end
	return otherbank

Level6
	pfcolors:
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$02
	$02
	$02
	$02
	$02
	$02
	$02
	$02
	$02
	$02
	$02
	$02
end
	return otherbank

Level7
	pfcolors:
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$02
	$02
	$02
	$02
	$02
	$02
	$02
	$02
	$02
	$02
	$02
	$02
	$02
	$02
end
	return otherbank

Level8
	pfcolors:
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$00
	$02
	$02
	$02
	$02
	$02
	$02
	$02
	$02
	$02
	$02
	$02
	$02
	$02
	$02
	$02
end
	return otherbank

Level9
	pfcolors:
	$00
	$00
	$00
	$00
	$00
	$00
	$02
	$02
	$02
	$02
	$02
	$02
	$02
	$02
	$02
	$02
	$02
	$02
	$02
	$02
	$02
	$02
	$02
end
	return otherbank

Level10
	pfcolors:
	$00
	$00
	$00
	$00
	$02
	$02
	$02
	$02
	$02
	$02
	$02
	$02
	$02
	$02
	$02
	$02
	$02
	$02
	$02
	$02
	$02
	$02
	$02
end
	return otherbank
	bank 9
Start_the_Raven
	asm
 	LDA	#0
  	STA	MadnessLevel
  	STA	PFIndex
  	STA	AUDV1
  	STA	AUD1Sound
	STA	temp6
	STA	MadTouch
  	LDA	#160
  	STA	missile1y
	LDA	#1
  	STA	Difficulty
end
	; MadnessLevel=0
	;  PFIndex=0
	;  AUDV1=0
	;  AUD1Sound=0
	;  Difficulty=1
	;  temp6=0
	;  missile1y=160
	;  MadTouch=0

	player0y=65: player0x=72
	asm
	LDA	#1
	STA	Channel_1Duration
	LDA	#<.MusicChannel_voron
	STA	Channel_1Counter
	LDA	#>.MusicChannel_voron
	STA	Channel_1Counter+1
end
	goto PFChange bank10


ScrollLoop
	if MadnessLevel=8 then temp12=0: temp13=20: var15{1} =0:  goto BoyDeath


	NUSIZ1=$05
	if !var1{6} && FireDelay=0 then bally=160: CTRLPF=$31: ballheight=0
	; if missile1y>88 then goto NoMissile
	; if missile1y<3 then missile1y=160: goto NoMissile

	asm
 	LDA	missile1y
 	CMP	#88
  	BCS	.NoMissile
	CMP	#3
  	BCS	.skip666
Farts
  	LDA	#160
  	STA	missile1y
 	jmp	.NoMissile
.skip666
end

	; if missile1x<3 || missile1x>142 then missile1y=160: goto NoMissile
	asm
	LDA	missile1x
  	CMP	#3
  	BCC	Farts  
  	CMP	#142
 	BCS	Farts
end
	; if collision(player1,missile1) then EnemySprite=0: var15{2} = 1: missile1y=160: AUD1Sound=12: AUDV1=12: AUDC1=15: AUDF1=15 : goto NoMissile
	asm
	bit	CXM1P
 	BVC	.skip0954
  	LDA	#0
  	STA	EnemySprite
	LDA	var15
  	ORA	#4
  	STA	var15
  	LDA	#12
  	STA	AUD1Sound
  	STA	AUDV1
 	LDA	#15
  	STA	AUDC1
  	STA	AUDF1
  	jmp	Farts
.skip0954
end
	if var15{1} then missile1y=missile1y-2 : missile1height=1: NUSIZ1=$15: goto NoMissile
	; if !var15{0} then missile1x=missile1x-2 else missile1x=missile1x+2 
	asm
	LDA	var15
  	LSR
  	BCS	.skip0956
  	LDA	missile1x
 	SEC
  	SBC	#2
	jmp	.L0957_99
.skip0956
 	LDA	missile1x
  	CLC
 	ADC	#2	      
.L0957_99
	STA	missile1x
end
	missile1height=0: NUSIZ1=$25

NoMissile
	asm
	LDA	#0
	CMP	AUD1Sound
	BEQ	.SETZERO
	DEC	AUD1Sound
	LDA	AUD1Sound
	STA	AUDV1
	LDA	#8
	SEC
	SBC	AUD1Sound
	STA 	AUDF1
	JMP	.NoPFChange

.SETZERO
	STA 	AUDV1

end
NoPFChange
	asm
	LDA	FireDelay
	CMP	#0
	BEQ	.IOP
	DEC	FireDelay
.IOP
end
	if !var15{2} then DeathCounter=0: goto ZENZEN
	if DeathCounter<28 then DeathCounter=DeathCounter+1: goto ZENZEN
	if var15{4}  then MadnessLevel=0: dec score=score+200: Difficulty=Difficulty+1 else MadnessLevel=MadnessLevel+1: dec score=score+25 
	MadTouch=0: player1y=160
	;var15{2} = 0
	; var15{3} =0:  var15{4} =0
	asm
	LDA	var15
  	AND	#%11100011
  	STA	var15
end
	goto PUFF

ZENZEN
	; if !var15{3} && !var15{4}  then goto NoAnimal
	asm
  	LDA	var15
  	AND	#%00011000
  	BNE	.KKKI
	jmp	.NoAnimal
.KKKI
end
	if collision(player0,player1) && !var15{2}  && !var15{4}  then MadTouch=MadTouch+1: AUD1Sound=6: AUDV1=6: AUDC1=7: AUDF1=rand&3 
	if MadTouch>30 then MadTouch=0: MadnessLevel=MadnessLevel+1
	; if EnemySprite<30 then EnemySprite=EnemySprite+1 else EnemySprite=0: if !var15{2} then goto NotDeadAnimal
	asm
	LDA	EnemySprite
  	CMP	#30
 	BCS	.skipL0955_39
  	INC	EnemySprite
  	jmp	.NotDeadAnimal
.skipL0955_39  
	LDA	#0
 	STA	EnemySprite
end
	if var15{2} && EnemySprite>25 then DeathCounter=28
NotDeadAnimal

	if !var1{1} then goto ThereIsAnimal
	var15{6}=!var15{6}
	if var15{6} ||  var15{2} then goto ThereIsAnimal
	asm
	BIT	var15
  	BVS	.condpart313_77
  	LDA	var15
  	AND	#%00000100
 	BEQ	.skip68OR_89
.condpart313_77
  	jmp	.ThereIsAnimal
.skip68OR_89
end
	; if var15{4} then goto ItsARaven 

	asm
 	LDA	var15
  	AND	#16
  	BNE	.ItsARaven
end
	 if Scroller>0 then goto ThereIsAnimal

	; temp1=rand
	; if temp1<123 && player1y<player0y then player1y=player1y+1
	; if temp1>122 && player1y>player0y-10 then player1y=player1y-1
	asm
	lda	rand
  	lsr
 	bcc	*+4
  	eor	#$B4
  	sta	rand
 	CMP	#123
  	BCS	.Dont
 	LDA	player1y
  	CMP	player0y
  	BCS	.skip318then88
 	INC	player1y
  	JMP	.skip318then88
.Dont
	LDA	player0y
 	SEC
  	SBC	#10
  	CMP	player1y
  	BCS	.skip318then88
 	DEC	player1y
.skip318then88
end
	 ;  temp2=Difficulty/4
	 ; temp2=temp2+1
	asm
	LDA	Difficulty
  	lsr
  	lsr
	CLC
	ADC	#1
	STA 	temp2
end
	if player0x<player1x then player1x=player1x-temp2 else player1x=player1x+temp2


	goto ThereIsAnimal 
ItsARaven
	; if var15{7} then goto FlyRaven
	asm
	BIT	var15
  	BMI	.FlyRaven
end
	;  if player0x>player1x then temp5=player0x-player1x else temp5=player1x-player0x

	asm
	LDA	player1x
  	CMP	player0x
  	BCS	.skipL0985_998
 	LDA	player0x
  	SEC
  	SBC	player1x
  	jmp	.skipelse44_998
.skipL0985_998
  	SEC
 	SBC	player0x
.skipelse44_998
	STA	temp5
end
	;temp2=Difficulty*2: temp2=temp2+30
	; if temp2>44 then temp2=44

	asm
	LDA	Difficulty
  	asl
  	CLC
  	ADC	#30
 	STA	temp2
  	LDA	#44
  	CMP	temp2
  	BCS	.skipL0987_9876
 	STA	temp2
.skipL0987_9876
end
	 if temp5<temp2 then var15{7} =1 else goto ThereIsAnimal 

FlyRaven
	player1y=player1y-1
	 if Scroller>1 then goto ThereIsAnimal

	player1y=player1y-1
	; temp2=Difficulty/4
	; temp2=temp2+1
	; if player0x>player1x then player1x=player1x-temp2 else player1x=player1x+temp2
	asm
 	LDA	Difficulty
  	lsr
 	lsr
	CLC  	
	ADC	#1
	STA 	temp2
	LDA	player1x
  	CMP	player0x
  	BCS	.skipL0981_545
  	SEC
  	SBC	temp2
 	jmp	.skipelse42_656
.skipL0981_545
  	CLC
 	ADC	temp2
.skipelse42_656
	STA	player1x
end
	; temp3=rand
	; if temp3{0} then player1y=player1y-1
	asm
	lda	rand
  	lsr
 	bcc	*+4
 	eor	#$B4
  	sta	rand
  	LSR
  	BCC	.skipL0983_532
 	DEC	player1y
.skipL0983_532
end
	goto ThereIsAnimal 
NoAnimal
	; temp6=rand
	;temp3=Difficulty+2

	; if !var1{3} ||  temp6>temp3 then goto PUFF
	asm
 	lda	rand
 	lsr
 	bcc	*+4
 	eor	#$B4
  	sta	rand
 	LDA	var1
 	AND	#8
  	BNE	.HZZ
	JMP	.PUFF
.HZZ
end
 	if rand>Difficulty+2 then goto PUFF

	; temp2=MadnessLevel-Difficulty
	; if temp2>128 || temp2=0 then temp2=1
	; if temp6<temp2 then var15{4} =1: var15{7} =0: goto PlaceAnimal
	asm
 	LDA	MadnessLevel
  	SEC
  	SBC	Difficulty
	TAY
 	STA	temp2
  	CMP	#128
  	BCC	.WHAAAT
 	CMP	#0
 	BNE	.skip68OR_9998
.WHAAAT
 	LDA	#1
  	STA	temp2
.skip68OR_9998
	LDA	rand
  	CMP	temp2
 	BCC	.skipL0993_344
.GoGoRaven
 	LDA	var15
  	ORA	#16
	AND	#127
  	STA	var15
  	jmp	.PlaceAnimal
.skipL0993_344

end
	; temp5=MadnessLevel-Difficulty
	; if temp5>128 then temp5=0
	; if temp5>3 && var1{1} then  var15{4} =1: var15{7} =0: goto PlaceAnimal
	asm
 	TYA
 	CMP	#128
 	BCC	.skipL0991_123
  	LDA	#0
.skipL0991_123
  	CMP	#3
 	BCC	.skipL0992_987
  	LDA	var1
  	AND	#2
  	BNE	.GoGoRaven
.skipL0992_987
end
	; if Scroller{0} && rand{0} then var15{4} =1: var15{7} =0: goto PlaceAnimal
	asm
     	LDA	Scroller
  	LSR
  	BCC	.skipL0994_abc
 	LDA	rand
 	LSR
  	BCS	.GoGoRaven
.skipL0994_abc
end
	var15{3} =1
PlaceAnimal
	; if !var15{4}  then player1y=player0y-5 else player1y=player0y
	asm
 	LDA	var15
 	AND	#16
 	BNE	.FUTAR
  	LDA	player0y
  	SEC
  	SBC	#5
  	jmp	.GEHH
.FUTAR
  	LDA	player0y
.GEHH
  	STA	player1y

end
	; if joy0left then player1x=12 else player1x=132
	asm
	bit	SWCHA
  	BVS	.LEVI
  	LDA	#12
    	jmp	.KAPOS
.LEVI
 	LDA	#132
.KAPOS
	STA	player1x
end
ThereIsAnimal
	
	; if player1x<8 || player1x>136 then player1y=160: var15{3} =0:  var15{4} =0
	asm
 	LDA	player1x
  	CMP	#8
  	BCC	.WAHHH
 	CMP	#136
	BCC	.RERR
.WAHHH
  	LDA	#160
 	STA	player1y
  	LDA	var15
  	AND	#%11100111
  	STA	var15
.RERR
end
PUFF
	var1{1}=!var1{1}
	; if !joy0fire && var1{6} then var1{6} = 0 : FireDelay=10: AUD1Sound=10: AUDV1=10: AUDC1=7: AUDF1=3 else goto NOSHOOT
	asm
  	bit	INPT4
  	BMI	.FFFO
	JMP	.NOSHOOT
.FFFO
  	BIT	var1
  	BVC	.NOSHOOT
	LDA	var1
  	AND	#191
  	STA	var1
  	LDA	#10
  	STA	FireDelay
  	STA	AUD1Sound
  	STA	AUDV1
 	LDA	#7
 	STA	AUDC1
  	LDA	#3
  	STA	AUDF1
end
	;  if var1{5} then var15{0}=1 else var15{0}=0
	asm
	LDA	var1
  	AND	#32
  	BEQ	.skipL01001_999
 	LDA	var15
  	ORA	#1
   	jmp	.skipelse46_741
.skipL01001_999
  	LDA	var15
 	AND	#254
.skipelse46_741
	STA	var15

end
	; if joy0up then var15{1} = 1: missile1y=31 else var15{1} = 0:  goto NOMISSILEUP
	asm
	lda	#$10
 	bit	SWCHA
  	BEQ	.DDR
 	LDA	var15
  	AND	#253
  	STA	var15
  	jmp	.NOMISSILEUP
.DDR
  	LDA	var15
  	ORA	#2
  	STA	var15
  	LDA	#31
  	STA	missile1y
end
	; if var15{0} then missile1x=player0x+17 else missile1x=player0x+2 
	asm
	LDA	var15
  	LSR
 	BCC	.skipL01003_887
  	LDA	player0x
  	CLC
  	ADC	#17
  	jmp	.skipelse48_332
.skipL01003_887
  	LDA	player0x
  	CLC
 	ADC	#2
.skipelse48_332
	STA	missile1x
end
	goto NOSHOOT
NOMISSILEUP
	; if joy0down then missile1y=51 else missile1y=47
	asm
	lda	#$20
  	bit	SWCHA
  	BNE	.skipL01005_111
  	LDA	#51
  	jmp	.skipelse49_57
.skipL01005_111
	LDA	#47
.skipelse49_57
	STA	missile1y	
end
	; if var15{0} then missile1x=player0x+26 else missile1x=player0x-7
	asm
  	LDA	var15
  	LSR
 	BCC	.skipL01006_441
  	LDA	player0x
  	CLC
  	ADC	#26
	jmp	.skipelse50_45
.skipL01006_441
  	LDA	player0x
  	SEC
  	SBC	#7
.skipelse50_45
	STA	missile1x
end
NOSHOOT
	; if var1{6} || FireDelay>0 then goto FUZIOSPACAL 
	asm
	BIT	var1
  	BVS	.NetFlix
  	LDA	#0
  	CMP	FireDelay
 	BEQ	.IIU
.NetFlix
  	jmp	.FUZIOSPACAL
.IIU
end
	; if var1{3} then goto  NoReleased
	asm
	LDA	var1
  	AND	#8
  	BNE	.NoReleased
end
	; if !joy0left then goto NOOLEFT 
	asm
	bit	SWCHA
  	BVS	.NOOLEFT
end
	var1{3}=1 
	;if player0x<20 then var1{4} = 0 : goto IJU
	asm
	LDA	player0x
  	CMP	#20
  	BCC	GoIJU
end
	;var1{4}=1 : var1{5}=0 
	asm
	LDA	var1
  	ORA	#16
  	AND	#223
 	STA	var1
end
NOOLEFT
	; if !joy0right then goto NoReleased 
	asm
	bit	SWCHA
  	BMI	.NoReleased
end
	var1{3}=1 
	; if player0x>121 then var1{4} = 0 : goto IJU
	asm
	LDA	#121
  	CMP	player0x
  	BCS	.skipL01015_774477
GoIJU
  	LDA	var1
  	AND	#239
 	STA	var1
 	jmp	.IJU
.skipL01015_774477
end


	;  var1{4}=1 : var1{5}=1 
	asm
	LDA	var1
  	ORA	#%00110000
 	STA	var1
end
NoReleased
	;  if !joy0left && !var1{5}  then var1{3} = 0 : Scroller=0: goto NOMOOOVE
	asm 
  	LDA	var1
  	AND	#32
  	BNE	.skipL01017abc
	bit	SWCHA
  	BVC	.skipL01018abc
.ABC
  	LDA	var1
  	AND	#247
  	STA	var1
  	LDA	#0
  	STA	Scroller
  	jmp	.NOMOOOVE
.skipL01017abc
end


	; if !joy0right && var1{5}  then var1{3} = 0 : Scroller=0: goto NOMOOOVE
	asm
	bit	SWCHA
  	BMI	.ABC
.skipL01018abc			   
end
IJU

	if !var1{4}  then goto NOMOOOVE
	; if !var1{1}  then goto DOSPRITE
	asm
	LDA	var1
  	AND	#2
  	BEQ	.DOSPRITE
end
	if Scroller>2 then Scroller=0:  AUD1Sound=4: AUDV1=4: AUDC1=3: AUDF1=8 else Scroller=Scroller+1


	; if var1{5} then goto GO_RIGHT
	asm
	LDA	var1
  	AND	#32
  	BNE	.GO_RIGHT
end
	if PFIndex>0 then goto LARGER_0
	asm
	LDA	#0
  	CMP	PFIndex
  	BNE	.LARGER_0

end
	; if player0x>19 then player0x=player0x-3
	asm
	LDA	player0x
  	CMP	#19
  	BCC	.skipL01024_745
  	SEC
  	SBC	#3
  	STA	player0x
.skipL01024_745
end
	goto DOSPRITE
LARGER_0
	; if player0x>62 then player0x=player0x-3 else PFIndex=PFIndex-1:  goto FASZOM2
	asm
 	LDA	player0x
  	CMP	#62
  	BCC	.ZYX
  	SEC
  	SBC	#3
  	STA	player0x
  	jmp	.DOSPRITE
.ZYX
  	DEC	PFIndex
  	jmp	.FASZOM2
end

GO_RIGHT
	; if PFIndex<180 then goto SMALLER_178
	asm
	LDA	PFIndex
  	CMP	#180
 	BCC	.SMALLER_178
end
	; if player0x<122 then player0x=player0x+3
	asm
	LDA	player0x
  	CMP	#122
  	BCS	.skipL01029_774
  	CLC
  	ADC	#3
 	STA	player0x
.skipL01029_774
end
	goto DOSPRITE
SMALLER_178
	; if player0x<83 then player0x=player0x+3 else PFIndex=PFIndex+1:  goto FASZOM2
	asm
	LDA	player0x
  	CMP	#83
  	BCC	.skipL01031_886
  	INC	PFIndex
  	jmp	.FASZOM2
.skipL01031_886
  	CLC
  	ADC	#3
  	STA	player0x

end
DOSPRITE
	; if BoySprite > 30 then BoySprite=0 else  BoySprite=BoySprite+2 
	asm
	LDA	BoySprite
  	CMP	#30
  	BCC	.skipL01032_32
 	LDA	#0
 	jmp	.skipelse54_54
.skipL01032_32
  	CLC
  	ADC	#2
.skipelse54_54
	STA	BoySprite
	CMP	#10
  	BCS	.Boy10
end

 	player0:
 	%00011110
 	%00000111
 	%11100011
 	%01110001
 	%00110011
 	%10110011
 	%10110011
 	%10111011
 	%10111011
 	%11011111
 	%01011111
 	%01011111
 	%01111111
 	%01110111
 	%01111111
 	%01010111
 	%00111010
 	%00111011
 	%00111011
 	%00111101
 	%00011101
 	%00011111
 	%00001110
 	%00011110
 	%01111100
 	%11111100
 	%01111100
 	%01111100
 	%11111000
 	%01111000
 	%01111000
 	%00000000
end
	goto FUZIOSPACAL
	asm
.Boy10
	CMP	#20
  	BCS	.Boy20
end
 	player0:
 	%00001111
 	%00000011
 	%10000011
 	%10000111
 	%10000111
 	%10001111
 	%01001010
 	%01010111
 	%01011101
 	%01011111
 	%00101011
 	%00101111
 	%00101110
 	%00111111
 	%01111111
 	%01010111
 	%01010011
 	%00111011
 	%00101001
 	%00011101
 	%00011111
 	%00001111
 	%00111111
 	%11111110
 	%01111110
 	%01111100
 	%11111100
 	%01111000
 	%01111000
 	%00000000
 	%00000000
 	%00000000
end
	goto FUZIOSPACAL

	
Boy20

 	player0:
 	%11000001
 	%01110001
 	%00110011
 	%00110011
 	%00110010
 	%01110111
 	%01110111
 	%00110111
 	%00111011
 	%10011111
 	%10011110
 	%10001111
 	%01001111
 	%01001111
 	%01111111
 	%01100110
 	%01110010
 	%01111011
 	%00111001
 	%00101101
 	%00011101
 	%00001111
 	%00000111
 	%00000110
 	%00001110
 	%00011111
 	%00111111
 	%00011111
 	%00111111
 	%00011110
 	%00011110
 	%00000000
end



	goto FUZIOSPACAL
NOMOOOVE
	
	; if !joy0up then goto NOUPEITHER
	asm
	lda	#$10
 	bit	SWCHA
  	BNE	.NOUPEITHER
end
	bally=37: ballheight=6: CTRLPF=$01
	; if !var1{5} then ballx=player0x+2 else ballx=player0x+17
	asm
	LDA	var1
  	AND	#32
  	BNE	.skipL01039_785
  	LDA	player0x
  	CLC
 	ADC	#2
  	jmp	.skipelse55_44
.skipL01039_785
  	LDA	player0x
  	CLC
  	ADC	#17
.skipelse55_44
	STA	ballx
end

	if joy0fire &&  missile1y>88  then var1{6}=1  
 	player0:
 	%01110110
 	%00011011
 	%00110011
 	%00110011
 	%01100110
 	%11100111
 	%11000011
 	%01110011
 	%01111111
 	%00111111
 	%00011110
 	%00001110
 	%00011110
 	%00011110
 	%00011111
 	%00011111
 	%00011111
 	%00111011
 	%00110011
 	%01101111
 	%10111110
 	%11011100
 	%11111110
 	%10111111
 	%11111111
 	%11111110
 	%10111110
 	%00010100
 	%00000100
 	%00000000
 	%00000000
 	%00000000
end
	goto FUZIOSPACAL



NOUPEITHER
	; if !joy0down then goto NODOWNEITHER
	asm
	lda	#$20
 	bit	SWCHA
  	BNE	.NODOWNEITHER
end
	bally=50
	if joy0fire &&  missile1y>88  then var1{6}=1 
	;  if !var1{5} then ballx=player0x-6 else ballx=player0x+18 
	asm
	LDA	var1
  	AND	#32
  	BNE	.skipL01046_41
  	LDA	player0x
 	SEC
  	SBC	#6
 	jmp	.skipelse56_55
.skipL01046_41
  	LDA	player0x
  	CLC
  	ADC	#18
.skipelse56_55
 	STA	ballx
end
	BoySprite=0: player0:
 	%00011110
 	%00000111
 	%00011111
 	%00111110
 	%01111011
 	%01100111
 	%00110111
 	%00011111
 	%00000111
 	%00000111
 	%00000111
 	%00000111
 	%00111111
 	%11001001
 	%11111011
 	%00000110
 	%00001111
 	%00111111
 	%00011111
 	%00011111
 	%00111111
 	%00011110
 	%00011110
 	%00000000
 	%00000000
 	%00000000
 	%00000000
 	%00000000
 	%00000000
 	%00000000
 	%00000000
 	%00000000
end
	goto FUZIOSPACAL
NODOWNEITHER
	; if !joy0fire || missile1y<88 then goto NONOFIRE
	asm
	bit	INPT4
  	BMI	.NONOFIRE
 	LDA	missile1y
  	CMP	#88
  	BCC	.NONOFIRE
end
	bally=45: var1{6}=1
	; if !var1{5} then ballx=player0x-6 else ballx=player0x+18 
	asm
  	LDA	var1
  	AND	#32
  	BNE	.skipL01051_511
  	LDA	player0x
  	SEC
  	SBC	#6
  	jmp	.skipelse57_57
.skipL01051_511
  	LDA	player0x
  	CLC
  	ADC	#18
.skipelse57_57
	STA	ballx
end
	BoySprite=0: player0:
 	%00011111
 	%00000111
 	%00000111
 	%00001101
 	%00011001
 	%00011001
 	%00111001
 	%01110011
 	%01110011
 	%00110011
 	%00011111
 	%00011111
 	%00001111
 	%00001111
 	%00000111
 	%00000111
 	%00000111
 	%00011111
 	%11101001
 	%11110011
 	%00001110
 	%00001100
 	%00011110
 	%00111111
 	%00011111
 	%00111111
 	%00011111
 	%00011110
 	%00000000
 	%00000000
 	%00000000
 	%00000000
end

	goto FUZIOSPACAL

NONOFIRE
 	BoySprite=0: player0:
 	%00111110
 	%00011111
 	%00001110
 	%00000110
 	%00000110
 	%01000110
 	%01000110
 	%01000110
 	%01100100
 	%01100110
 	%01101110
 	%01101110
 	%01101110
 	%01111111
 	%01111111
 	%01111111
 	%01101111
 	%01010110
 	%00111011
 	%00101001
 	%00101001
 	%00111001
 	%00011111
 	%00001110
 	%00000110
 	%00001110
 	%00111111
 	%00011111
 	%00011111
 	%00111111
 	%00011110
 	%00001110
end


FUZIOSPACAL
	; if !var15{3} && !var15{4}  then goto NoAnimalSprite
	asm
	LDA	var15
  	AND	#%00011000
  	BNE	.GZT
	JMP	.NoAnimalSprite
.GZT
end
	; if  !var15{2} then goto NotDead2
	asm
 	LDA	var15
  	AND	#4
 	BEQ	.NotDead2
end

	if var15{4}  then goto DeadRaven

	goto DeadDog
NotDead2
	; if player0x<player1x then var15{5}=1 else var15{5}=0
	asm
	LDA	player0x
  	CMP	player1x
  	BCS	.skipL01059_123
	LDA	var15
  	ORA	#32
 	jmp	.skipelse5888
.skipL01059_123
 	LDA	var15
  	AND	#223
.skipelse5888
	STA	var15
end
	; if var15{4}  then goto RavenSprite
	asm
 	LDA	var15
  	AND	#16
 	BNE	.RavenSprite
end
	asm
	LDA	EnemySprite
  	CMP	#10
  	BCS	.E10
end
	player1:
 	%10110100
	%11011000
 	%10010000
 	%10010100
 	%11111001
 	%11111110
 	%11011010
 	%10001100
 	%10000000
 	%01000000
end
	goto NoAnimalSprite
	asm
.E10
  	CMP	#20
  	BCS	.E20
end
	player1:
 	%01101000
 	%11110000
 	%11010000
 	%10011001
 	%11111110
 	%11111010
 	%11001100
 	%10000000
 	%01100000
 	%00000000
end
	goto NoAnimalSprite
E20
	player1:
 	%01101000
 	%10010000
 	%11010000
 	%11011000
 	%11111000
 	%11111111
 	%10011010
 	%10001100
 	%10000000
 	%00000000
end

	goto NoAnimalSprite

DeadDog
	asm
	LDA	EnemySprite
  	CMP	#10
  	BCS	.ED10
end

	player1:
 	%01010101
 	%11010101
 	%11111110
 	%11111100
 	%11111101
 	%11101110
 	%01001011
 	%00001110
 	%00000110
 	%00000101
end
	goto NoAnimalSprite
	asm
.ED10
  	CMP	#20
  	BCS	.ED20
end
	player1:
 	%10100100
 	%11111000
 	%11111111
 	%11111010
 	%10001110
 	%10110000
 	%10000000
 	%01000000
 	%00000000
 	%00000000
end
	goto NoAnimalSprite
ED20
	player1:
 	%11111111
 	%01111110
 	%00001110
 	%00010000
 	%00000000
 	%00000000
 	%00000000
 	%00000000
 	%00000000
 	%00000000
end
	goto NoAnimalSprite
RavenSprite
 	; if var15{7} then goto FLLLY
	asm
 	BIT	var15
  	BMI	.FLLLY
end
	player1:
 	%10101000
 	%11111000
 	%01011000
 	%01101100
 	%00111100
 	%00011101
 	%00001111
 	%00000110
end
	goto NoAnimalSprite

FLLLY
	asm
	LDA	EnemySprite
  	CMP	#10
  	BCS	.EF10
end


	player1:
 	%01100000
 	%00111000
 	%00110000
 	%00111000
 	%01111110
 	%11010010
 	%10111101
 	%00011000
end
	goto NoAnimalSprite
	asm
.EF10
  	CMP	#20
  	BCS	.EF20
end

	player1:
 	%00100000
 	%00110010
 	%00111100
 	%01111110
 	%11111000
 	%00011010
 	%00111100
 	%00011000
end
	goto NoAnimalSprite
EF20
	player1:
 	%00010000
 	%00110000
 	%11111111
 	%01111110
 	%01111100
 	%00111110
 	%00011000
 	%00000000
end

	goto NoAnimalSprite

DeadRaven
	if player1y<player0y-25 then DeathCounter=0: EnemySprite=0


	if player1y=player0y then goto DeadRavenFloor
 	player1:
 	%00011000
 	%00111100
 	%00111010
 	%00011000
 	%00111100
 	%01111100
 	%01011100
 	%01010100
end
	player1y=player1y+1
	goto NoAnimalSprite

DeadRavenFloor
 	player1:
 	%11111111
 	%11111111
 	%01110010
 	%01010100
 	%00000000
 	%00000000
 	%00000000
 	%00000000
end

NoAnimalSprite

	asm
	LDA	temp15
	CMP	MadnessLevel
	BNE	.NoBackGroundChange
end


	if MadnessLevel=0 then pfcolors:
	$00
	$80
	$82
	$80
	$82
	$84
	$84
	$86
	$84
	$86
	$84
	$82
	$80
	$d4
	$d6
	$d8
	$d6
	$d8
	$da
	$da
	$d8
	$d6
	$d8
end
	if MadnessLevel=2 then pfcolors:
	$00
	$90
	$90
	$92
	$94
	$92
	$94
	$96
	$94
	$94
	$92
	$90
	$90
	$d2
	$d4
	$d6
	$d4
	$d6
	$d8
	$d8
	$d6
	$d4
	$d6
end
	if MadnessLevel=4 then pfcolors:
	$00
	$10
	$12
	$30
	$30
	$32
	$34
	$36
	$32
	$30
	$30
	$12
	$10
	$d0
	$d2
	$d4
	$d2
	$d4
	$d6
	$d6
	$d4
	$d2
	$d4
end
	if MadnessLevel=6 then pfcolors:
	$00
	$40
	$40
	$40
	$42
	$44
	$42
	$42
	$44
	$42
	$40
	$40
	$40
	$d0
	$d0
	$d2
	$d0
	$d2
	$d4
	$d2
	$d4
	$d2
	$d0
end
NoBackGroundChange
	COLUP0=$00: NUSIZ0=$05
	; if collision(player1,playfield) && player1y<50 then COLUP1=$04 else COLUP1=$00
	asm
	bit	CXP1FB
  	BPL	.skipL01080_80
 	LDA	player1y
  	CMP	#50
  	BCS	.skipL01080_80
	LDA	player1x
  	CMP	#12
  	BCC	.skipL01080_80
 	CMP	#128
	BCS	.skipL01080_80



  	LDA	#$04
 	jmp	.skipelse57_8
.skipL01080_80
  	LDA	#$00	      
.skipelse57_8
	STA	COLUP1
end
	asm
	LDY	MadnessLevel
	LDA	Scores,y
	STA 	ScoreColor
	sta 	scorecolor
end
	if var1{5} then REFP0=8
	if var15{5} then REFP1=8 

	if switchselect then goto BackToMenu bank14
	if switchreset then COLUP0=$00: COLUP1=00: goto BackReset bank14

	drawscreen
	temp15=MadnessLevel
	asm
.Voron

	DEC	Channel_1Duration
	LDA	Channel_1Duration
	BNE	.LoadNextvoron
	LDX	#Channel_1Counter
	LDA	(0,x)
	INC	0,x
	BNE	*+4
	INC	1,x
	CMP	#255
	BNE	.Not255_voron
	LDA	#<.MusicChannel_voron
	STA	Channel_1Counter
	LDA	#>.MusicChannel_voron
	STA	Channel_1Counter+1
	LDX	#Channel_1Counter
	LDA	(0,x)
	INC	0,x
	BNE	*+4
	INC	1,x
.Not255_voron
	STA	AUDV0
	CMP	#0
	BEQ	.GotoDurationvoron
	lsr
	lsr
	lsr
	lsr
	STA	AUDC0
	LDX	#Channel_1Counter
	LDA	(0,x)
	INC	0,x
	BNE	*+4
	INC	1,x
	STA	AUDF0
.GotoDurationvoron
	LDX	#Channel_1Counter
	LDA	(0,x)
	INC	0,x
	BNE	*+4
	INC	1,x
	STA	Channel_1Duration
.LoadNextvoron
end
	if switchleftb then goto ScrollLoop
	temp5=rand&31
	if temp5<32-MadnessLevel then goto NoBullshit
	temp5=rand&31
	if temp5<20 then goto NoNoteChange
	if temp5<10 then goto NoteUP
	asm
	DEC	AUDF0
end
	goto NoNoteChange
NoteUP
	asm
	INC	AUDF0
end

NoNoteChange
	temp3=Difficulty*2
	if temp5>Difficulty then goto NoBullshit
	temp5=rand&3
	if temp5=0 then AUDC0=2
	if temp5=1 then AUDC0=3
	if temp5=2 then AUDC0=7
	if temp5=3 then AUDC0=15

NoBullshit
	goto ScrollLoop
FASZOM2
	if Scroller=0 then goto PFChange bank10 
	if joy0left then player1x=player1x+2: missile1x=missile1x+2 else player1x=player1x-2: missile1x=missile1x-2
	goto DOSPRITE


	
	asm
Scores
	.byte	#$14
	.byte	#$12
	.byte	#$10
	.byte	#$34
	.byte	#$32
	.byte	#$30
	.byte	#$42
	.byte	#$40
	.byte	#$00

.MusicChannel_voron
	.BYTE	#%01001100
	.BYTE	#19
	.BYTE	#21
	.BYTE	#0
	.BYTE	#7
	.BYTE	#%01001011
	.BYTE	#21
	.BYTE	#20
	.BYTE	#0
	.BYTE	#7
	.BYTE	#%01001100
	.BYTE	#17
	.BYTE	#43
	.BYTE	#0
	.BYTE	#11
	.BYTE	#%01001010
	.BYTE	#21
	.BYTE	#41
	.BYTE	#0
	.BYTE	#14
	.BYTE	#%01001011
	.BYTE	#19
	.BYTE	#22
	.BYTE	#0
	.BYTE	#5
	.BYTE	#%01001011
	.BYTE	#21
	.BYTE	#19
	.BYTE	#0
	.BYTE	#8
	.BYTE	#%01001100
	.BYTE	#17
	.BYTE	#46
	.BYTE	#0
	.BYTE	#9
	.BYTE	#%01001011
	.BYTE	#26
	.BYTE	#44
	.BYTE	#0
	.BYTE	#10
	.BYTE	#%01001011
	.BYTE	#26
	.BYTE	#16
	.BYTE	#0
	.BYTE	#11
	.BYTE	#%01001010
	.BYTE	#26
	.BYTE	#21
	.BYTE	#0
	.BYTE	#7
	.BYTE	#%01001101
	.BYTE	#16
	.BYTE	#64
	.BYTE	#0
	.BYTE	#18
	.BYTE	#%01001011
	.BYTE	#17
	.BYTE	#17
	.BYTE	#0
	.BYTE	#10
	.BYTE	#%01001010
	.BYTE	#19
	.BYTE	#17
	.BYTE	#0
	.BYTE	#10
	.BYTE	#%01001011
	.BYTE	#26
	.BYTE	#21
	.BYTE	#0
	.BYTE	#7
	.BYTE	#%01001100
	.BYTE	#19
	.BYTE	#68
	.BYTE	#0
	.BYTE	#14
	.BYTE	#%01001011
	.BYTE	#17
	.BYTE	#10
	.BYTE	#0
	.BYTE	#3
	.BYTE	#%01001101
	.BYTE	#16
	.BYTE	#10
	.BYTE	#0
	.BYTE	#3
	.BYTE	#%01001100
	.BYTE	#14
	.BYTE	#17
	.BYTE	#0
	.BYTE	#10
	.BYTE	#%01001011
	.BYTE	#14
	.BYTE	#15
	.BYTE	#0
	.BYTE	#13
	.BYTE	#%01001011
	.BYTE	#14
	.BYTE	#23
	.BYTE	#0
	.BYTE	#5
	.BYTE	#%01001100
	.BYTE	#17
	.BYTE	#24
	.BYTE	#0
	.BYTE	#3
	.BYTE	#%01001100
	.BYTE	#12
	.BYTE	#87
	.BYTE	#0
	.BYTE	#22
	.BYTE	#%01001100
	.BYTE	#14
	.BYTE	#18
	.BYTE	#0
	.BYTE	#9
	.BYTE	#%01001100
	.BYTE	#16
	.BYTE	#21
	.BYTE	#0
	.BYTE	#7
	.BYTE	#%01001011
	.BYTE	#17
	.BYTE	#21
	.BYTE	#0
	.BYTE	#6
	.BYTE	#%01001010
	.BYTE	#21
	.BYTE	#20
	.BYTE	#0
	.BYTE	#7
	.BYTE	#%01001011
	.BYTE	#26
	.BYTE	#91
	.BYTE	#0
	.BYTE	#18
	.BYTE	#%01001011
	.BYTE	#26
	.BYTE	#16
	.BYTE	#0
	.BYTE	#11
	.BYTE	#%01001010
	.BYTE	#26
	.BYTE	#21
	.BYTE	#0
	.BYTE	#7
	.BYTE	#%01001100
	.BYTE	#17
	.BYTE	#57
	.BYTE	#0
	.BYTE	#24
	.BYTE	#%01001100
	.BYTE	#19
	.BYTE	#9
	.BYTE	#0
	.BYTE	#5
	.BYTE	#%01001011
	.BYTE	#21
	.BYTE	#13
	.BYTE	#0
	.BYTE	#1
	.BYTE	#%01001100
	.BYTE	#19
	.BYTE	#26
	.BYTE	#0
	.BYTE	#1
	.BYTE	#%01001100
	.BYTE	#17
	.BYTE	#23
	.BYTE	#0
	.BYTE	#5
	.BYTE	#%01001011
	.BYTE	#26
	.BYTE	#88
	.BYTE	#0
	.BYTE	#50
	.BYTE	#255
end

BoyDeath
	if var1{5} then REFP0=8

	NUSIZ0=$05: COLUP0=$00
	player1y=0: missile1y=0: bally=0: pfclear 
	AUDV0=8: AUDV1=0: ScoreColor= $40
	temp2=temp12/4
	dec ScoreColor=ScoreColor+temp2
	scorecolor=ScoreColor
	if var15{1}  then AUDC0=6 else AUDC0=7
	AUDF0=26-temp12
	if temp12>0 then temp12=temp12-1: goto DFG 
	if player0height>0 then player0height=player0height-1
	if player0height>3 then player0height=player0height-1

	if player0x<72 then player0x=player0x+1
	if player0x>72 then player0x=player0x-1


	temp12=temp13: temp13=temp13-1
	if temp13=0 then REFP0=0: goto GameOver bank14
	var15{1} = !var15{1} 
	if var15{1}  then gosub Level0 bank8 else gosub Redness bank8 

DFG
	drawscreen	
	goto BoyDeath


StartSoldier
		Score1=$04: Haaard=1: ExtraLife=0
LevelStart_Soldier
 	playfield:
 	................................
 	................................
 	................................
 	................................
 	................................
 	.......................XXXXXXXXX
 	......................X......X..
 	......XXXXXXXXXXXXXXXXX.XXXX.X..
 	.....X................X.XXXX.X..
 	....X.................X.XXXX.X..
 	...X............................
 	..X.............................
 	.X..............................
 	X...............................
 	...............................X
 	..............................X.
 	.............................X..
 	............................X..X
 	...........................X..X.
 	..........................X.....
 	XXXXXXXXXXXXXXXXXXXXXXXXXX..X..X
 	.........................X.X..X.
 	XX.XX.XX.XX.XX.XX.XX.XX..X......
end
	var15{1} =0
RETURNER
	pfcolors:
	$00
	$84
	$86
	$86
	$84
	$82
	$06
	$08
	$0a
	$0c
	$0e
	$0e
	$0e
	$0c
	$0a
	$08
	$06
	$08
	$0a
	$08
	$06
	$06
	$04
end
	if var15{1}  then var15{1} =0: goto NewSoldier

	; if Haaard>10 then Haaard=10
	asm

  	LDA	#10
 	CMP	Haaard
  	BCS	.skipL0116999
 	STA	Haaard
.skipL0116999
end
	SoldierLeft=Score1
	;SorMax=19-Haaard
	;SorMax=SorMax-1
	; if SorMax<13 then SorMax=13
	; Sor=19: Remain=0
	asm
	LDA	#0
	STA 	Remain
	LDA	#19
	STA 	Sor
	LDA 	#18
	SEC
	SBC 	Haaard
	STA 	SorMax
	LDA	#13
 	CMP	SorMax
  	BCC	.skipL0117373
  	STA	SorMax	
.skipL0117373
end
SetStart

	
	; Oszlop=15-Sor
	; if Oszlop>2 then Oszlop=0
	; if Sor<17 then Oszlop=Oszlop+1
	; if Sor<16 then Oszlop=Oszlop+1
	if Sor>16 then Oszlop=0 else Oszlop=20-Sor

	OszlopMax=43-Sor

CreateGraphitte
	;  if Sor=SorMax || Sor=12 then AUDV0=0: goto NewSoldier
	asm
	LDA	Sor
  	CMP	SorMax
  	BEQ	.condpart35555
  	CMP	#12
  	BNE	.skip69OR_OR
.condpart35555
 	LDA	#0
  	STA	AUDV0
  	jmp	.NewSoldier
.skip69OR_OR
end
DoTile
	; temp5=rand&31
	; temp4=Haaard*2
	; temp5=temp5-temp4
	; if temp5>32 then temp5=0
	; if temp5>10 then Volumer=Volumer-1: goto NoNewSound 
	asm
	lda	rand
  	lsr
 	bcc	*+4
  	eor	#$B4
  	sta	rand
   	AND	#31
 	SEC 
	SBC 	Haaard
 	SEC 
	SBC 	Haaard
	CMP	#32
	BCC	.skipL0118484
 	LDA	#0
.skipL0118484
	CMP	#10
  	BCC	.skipL0118585
  	DEC	Volumer
  	jmp	.NoNewSound
.skipL0118585

end
	pfpixel Oszlop Sor on
	Remain=Remain+1
 	Volumer=8
	AUDC0=15
	AUDF0=Oszlop

NoNewSound
	 if Volumer>8 then Volumer=0
	 AUDV0=Volumer

	Oszlop=Oszlop+1
	if Oszlop>OszlopMax then Sor=Sor-1: goto SetStart
	drawscreen
	goto CreateGraphitte
NewSoldier
 	TicTic=0: SoldierLeft=SoldierLeft-1: Score2=$91
	player0x=116: player0y=41
	pfhline 0 2 20 off
	temp9=0
	temp10=0
	var1{4}=0
LoopDrawLeft
	if  SoldierLeft>temp10-$01 then pfpixel temp9 2 on
	temp10=temp10+$01: temp9=temp9+2
	if temp10=$10 then goto SoldierLoop bank11
	

	goto LoopDrawLeft 
 	bank 10
	asm
.PFChange
	LDY	PFIndex
	LDA	Town,y
	TAX

PF0_0
	AND	#%00000001
	BEQ	.ClearPF0_0 	; if set
	LDA	r036
	ORA	#%11000000
	JMP	.DonePF0_0
.ClearPF0_0
	LDA	r036
	AND	#%00111111
.DonePF0_0
	STA	w036
	STA	w040
PF1_0	
	TXA
	AND	#%00000010
	BEQ	.ClearPF1_0 	; if set
	LDA	r044
	ORA	#%11000000
	JMP	.DonePF1_0
.ClearPF1_0
	LDA	r044
	AND	#%00111111
.DonePF1_0
	STA	w044
	STA	w048
PF2_0
	TXA
	AND	#%00000100
	BEQ	.ClearPF2_0 	; if set
	LDA	r052
	ORA	#%11000000
	JMP	.DonePF2_0
.ClearPF2_0
	LDA	r052
	AND	#%00111111
.DonePF2_0
	STA	w052
	STA	w056

PF3_0
	TXA
	AND	#%00001000
	BEQ	.ClearPF3_0 	; if set
	LDA	r060
	ORA	#%11000000
	JMP	.DonePF3_0
.ClearPF3_0
	LDA	r060
	AND	#%00111111
.DonePF3_0
	STA	w060
	STA	w064

PF4_0
	TXA
	AND	#%00010000
	BEQ	.ClearPF4_0 	; if set
	LDA	r068
	ORA	#%11000000
	JMP	.DonePF4_0
.ClearPF4_0
	LDA	r068
	AND	#%00111111
.DonePF4_0
	STA	w068
	STA	w072

PF5_0
	TXA
	AND	#%00100000
	BEQ	.ClearPF5_0 	; if set
	LDA	r076
	ORA	#%11000000
	JMP	.DonePF5_0
.ClearPF5_0
	LDA	r076
	AND	#%00111111
.DonePF5_0
	STA	w076
	STA	w080

PF6_0
	TXA
	AND	#%01000000
	BEQ	.ClearPF6_0 	; if set
	LDA	r084
	ORA	#%11000000
	JMP	.DonePF6_0
.ClearPF6_0
	LDA	r084
	AND	#%00111111
.DonePF6_0
	STA	w084
	STA	w088

PF7_0
	TXA
	AND	#%10000000
	BEQ	.ClearPF7_0 	; if set
	LDA	r092
	ORA	#%11000000
	JMP	.DonePF7_0
.ClearPF7_0
	LDA	r092
	AND	#%00111111
.DonePF7_0
	STA	w096
	STA	w092

	INY
	LDA	Town,y
	TAX
PF0_1
	
	AND	#%00000001
	BEQ	.ClearPF0_1 	; if set
	LDA	r036
	ORA	#%00110000
	JMP	.DonePF0_1
.ClearPF0_1
	LDA	r036
	AND	#%11001111
.DonePF0_1
	STA	w036
	STA	w040
PF1_1
	TXA
	AND	#%00000010
	BEQ	.ClearPF1_1 	; if set
	LDA	r044
	ORA	#%00110000
	JMP	.DonePF1_1
.ClearPF1_1
	LDA	r044
	AND	#%11001111
.DonePF1_1
	STA	w044
	STA	w048

PF2_1
	TXA
	AND	#%00000100
	BEQ	.ClearPF2_1 	; if set
	LDA	r052
	ORA	#%00110000
	JMP	.DonePF2_1
.ClearPF2_1
	LDA	r052
	AND	#%11001111
.DonePF2_1
	STA	w052
	STA	w056

PF3_1
	TXA
	AND	#%00001000
	BEQ	.ClearPF3_1 	; if set
	LDA	r060
	ORA	#%00110000
	JMP	.DonePF3_1
.ClearPF3_1
	LDA	r060
	AND	#%11001111
.DonePF3_1
	STA	w060
	STA	w064

PF4_1
	TXA
	AND	#%00010000
	BEQ	.ClearPF4_1 	; if set
	LDA	r068
	ORA	#%00110000
	JMP	.DonePF4_1
.ClearPF4_1
	LDA	r068
	AND	#%11001111
.DonePF4_1
	STA	w068
	STA	w072

PF5_1
	TXA
	AND	#%00100000
	BEQ	.ClearPF5_1 	; if set
	LDA	r076
	ORA	#%00110000
	JMP	.DonePF5_1
.ClearPF5_1
	LDA	r076
	AND	#%11001111
.DonePF5_1
	STA	w076
	STA	w080

PF6_1
	TXA
	AND	#%01000000
	BEQ	.ClearPF6_1 	; if set
	LDA	r084
	ORA	#%00110000
	JMP	.DonePF6_1
.ClearPF6_1
	LDA	r084
	AND	#%11001111
.DonePF6_1
	STA	w084
	STA	w088

PF7_1
	TXA
	AND	#%10000000
	BEQ	.ClearPF7_1 	; if set
	LDA	r092
	ORA	#%00110000
	JMP	.DonePF7_1
.ClearPF7_1
	LDA	r092
	AND	#%11001111
.DonePF7_1
	STA	w092
	STA	w096

	INY
	LDA	Town,y
	TAX
PF0_2
	
	AND	#%00000001
	BEQ	.ClearPF0_2 	; if set
	LDA	r036
	ORA	#%00001100
	JMP	.DonePF0_2
.ClearPF0_2
	LDA	r036
	AND	#%11110011
.DonePF0_2
	STA	w036
	STA	w040

PF1_2
	TXA
	AND	#%00000010
	BEQ	.ClearPF1_2 	; if set
	LDA	r044
	ORA	#%00001100
	JMP	.DonePF1_2
.ClearPF1_2
	LDA	r044
	AND	#%11110011
.DonePF1_2
	STA	w044
	STA	w048

PF2_2
	TXA
	AND	#%00000100
	BEQ	.ClearPF2_2 	; if set
	LDA	r052
	ORA	#%00001100
	JMP	.DonePF2_2
.ClearPF2_2
	LDA	r052
	AND	#%11110011
.DonePF2_2
	STA	w052
	STA	w056


PF3_2
	TXA
	AND	#%00001000
	BEQ	.ClearPF3_2 	; if set
	LDA	r060
	ORA	#%00001100
	JMP	.DonePF3_2
.ClearPF3_2
	LDA	r060
	AND	#%11110011
.DonePF3_2
	STA	w060
	STA	w064

PF4_2
	TXA
	AND	#%00010000
	BEQ	.ClearPF4_2 	; if set
	LDA	r068
	ORA	#%00001100
	JMP	.DonePF4_2
.ClearPF4_2
	LDA	r068
	AND	#%11110011
.DonePF4_2
	STA	w068
	STA	w072

PF5_2
	TXA
	AND	#%00100000
	BEQ	.ClearPF5_2 	; if set
	LDA	r076
	ORA	#%00001100
	JMP	.DonePF5_2
.ClearPF5_2
	LDA	r076
	AND	#%11110011
.DonePF5_2
	STA	w076
	STA	w080

PF6_2
	TXA
	AND	#%01000000
	BEQ	.ClearPF6_2 	; if set
	LDA	r084
	ORA	#%00001100
	JMP	.DonePF6_2
.ClearPF6_2
	LDA	r084
	AND	#%11110011
.DonePF6_2
	STA	w084
	STA	w088


PF7_2
	TXA
	AND	#%10000000
	BEQ	.ClearPF7_2 	; if set
	LDA	r092
	ORA	#%00001100
	JMP	.DonePF7_2
.ClearPF7_2
	LDA	r092
	AND	#%11110011
.DonePF7_2
	STA	w092
	STA	w096

	INY
	LDA	Town,y
	TAX
PF0_3
	
	AND	#%00000001
	BEQ	.ClearPF0_3 	; if set
	LDA	r036
	ORA	#%00000011
	JMP	.DonePF0_3
.ClearPF0_3
	LDA	r036
	AND	#%11111100
.DonePF0_3
	STA	w036
	STA	w040


PF1_3
	TXA
	AND	#%00000010
	BEQ	.ClearPF1_3 	; if set
	LDA	r044
	ORA	#%00000011
	JMP	.DonePF1_3
.ClearPF1_3
	LDA	r044
	AND	#%11111100
.DonePF1_3
	STA	w044
	STA	w048


PF2_3
	TXA
	AND	#%00000100
	BEQ	.ClearPF2_3 	; if set
	LDA	r052
	ORA	#%00000011
	JMP	.DonePF2_3
.ClearPF2_3
	LDA	r052
	AND	#%11111100
.DonePF2_3
	STA	w052
	STA	w056

PF3_3
	TXA
	AND	#%00001000
	BEQ	.ClearPF3_3 	; if set
	LDA	r060
	ORA	#%00000011
	JMP	.DonePF3_3
.ClearPF3_3
	LDA	r060
	AND	#%11111100
.DonePF3_3
	STA	w060
	STA	w064

PF4_3
	TXA
	AND	#%00010000
	BEQ	.ClearPF4_3 	; if set
	LDA	r068
	ORA	#%00000011
	JMP	.DonePF4_3
.ClearPF4_3
	LDA	r068
	AND	#%11111100
.DonePF4_3
	STA	w068
	STA	w072

PF5_3
	TXA
	AND	#%00100000
	BEQ	.ClearPF5_3 	; if set
	LDA	r076
	ORA	#%00000011
	JMP	.DonePF5_3
.ClearPF5_3
	LDA	r076
	AND	#%11111100
.DonePF5_3
	STA	w076
	STA	w080

PF6_3
	TXA
	AND	#%01000000
	BEQ	.ClearPF6_3 	; if set
	LDA	r084
	ORA	#%00000011
	JMP	.DonePF6_3
.ClearPF6_3
	LDA	r084
	AND	#%11111100
.DonePF6_3
	STA	w084
	STA	w088

PF7_3
	TXA
	AND	#%10000000
	BEQ	.ClearPF7_3 	; if set
	LDA	r092
	ORA	#%00000011
	JMP	.DonePF7_3
.ClearPF7_3
	LDA	r092
	AND	#%11111100
.DonePF7_3
	STA	w092
	STA	w096



	INY
	LDA	Town,y
	TAX
PF0_4
	AND	#%00000001
	BEQ	.ClearPF0_4 	; if set
	LDA	r037
	ORA	#%00000011
	JMP	.DonePF0_4
.ClearPF0_4
	LDA	r037
	AND	#%11111100
.DonePF0_4
	STA	w037
	STA	w041

PF1_4
	TXA
	AND	#%00000010
	BEQ	.ClearPF1_4 	; if set
	LDA	r045
	ORA	#%00000011
	JMP	.DonePF1_4
.ClearPF1_4
	LDA	r045
	AND	#%11111100
.DonePF1_4
	STA	w045
	STA	w049

PF2_4
	TXA
	AND	#%00000100
	BEQ	.ClearPF2_4 	; if set
	LDA	r053
	ORA	#%00000011
	JMP	.DonePF2_4
.ClearPF2_4
	LDA	r053
	AND	#%11111100
.DonePF2_4
	STA	w053
	STA	w057

PF3_4
	TXA
	AND	#%00001000
	BEQ	.ClearPF3_4 	; if set
	LDA	r061
	ORA	#%00000011
	JMP	.DonePF3_4
.ClearPF3_4
	LDA	r061
	AND	#%11111100
.DonePF3_4
	STA	w061
	STA	w065

PF4_4
	TXA
	AND	#%00010000
	BEQ	.ClearPF4_4 	; if set
	LDA	r069
	ORA	#%00000011
	JMP	.DonePF4_4
.ClearPF4_4
	LDA	r069
	AND	#%11111100
.DonePF4_4
	STA	w069
	STA	w073

PF5_4
	TXA
	AND	#%00100000
	BEQ	.ClearPF5_4 	; if set
	LDA	r077
	ORA	#%00000011
	JMP	.DonePF5_4
.ClearPF5_4
	LDA	r077
	AND	#%11111100
.DonePF5_4
	STA	w077
	STA	w081

PF6_4
	TXA
	AND	#%01000000
	BEQ	.ClearPF6_4 	; if set
	LDA	r085
	ORA	#%00000011
	JMP	.DonePF6_4
.ClearPF6_4
	LDA	r085
	AND	#%11111100
.DonePF6_4
	STA	w085
	STA	w089

PF7_4
	TXA
	AND	#%10000000
	BEQ	.ClearPF7_4 	; if set
	LDA	r093
	ORA	#%00000011
	JMP	.DonePF7_4
.ClearPF7_4
	LDA	r093
	AND	#%11111100
.DonePF7_4
	STA	w093
	STA	w097


	INY
	LDA	Town,y
	TAX

PF0_5
	AND	#%00000001
	BEQ	.ClearPF0_5	; if set
	LDA	r037
	ORA	#%00001100
	JMP	.DonePF0_5
.ClearPF0_5
	LDA	r037
	AND	#%11110011
.DonePF0_5
	STA	w037
	STA	w041

PF1_5
	TXA
	AND	#%00000010
	BEQ	.ClearPF1_5	; if set
	LDA	r045
	ORA	#%00001100
	JMP	.DonePF1_5
.ClearPF1_5
	LDA	r045
	AND	#%11110011
.DonePF1_5
	STA	w045
	STA	w049

PF2_5
	TXA
	AND	#%00000100
	BEQ	.ClearPF2_5	; if set
	LDA	r053
	ORA	#%00001100
	JMP	.DonePF2_5
.ClearPF2_5
	LDA	r053
	AND	#%11110011
.DonePF2_5
	STA	w053
	STA	w057

PF3_5
	TXA
	AND	#%00001000
	BEQ	.ClearPF3_5	; if set
	LDA	r061
	ORA	#%00001100
	JMP	.DonePF3_5
.ClearPF3_5
	LDA	r061
	AND	#%11110011
.DonePF3_5
	STA	w061
	STA	w065

PF4_5
	TXA
	AND	#%00010000
	BEQ	.ClearPF4_5	; if set
	LDA	r069
	ORA	#%00001100
	JMP	.DonePF4_5
.ClearPF4_5
	LDA	r069
	AND	#%11110011
.DonePF4_5
	STA	w069
	STA	w073

PF5_5
	TXA
	AND	#%00100000
	BEQ	.ClearPF5_5	; if set
	LDA	r077
	ORA	#%00001100
	JMP	.DonePF5_5
.ClearPF5_5
	LDA	r077
	AND	#%11110011
.DonePF5_5
	STA	w077
	STA	w081

PF6_5
	TXA
	AND	#%01000000
	BEQ	.ClearPF6_5	; if set
	LDA	r085
	ORA	#%00001100
	JMP	.DonePF6_5
.ClearPF6_5
	LDA	r085
	AND	#%11110011
.DonePF6_5
	STA	w085
	STA	w089

PF7_5
	TXA
	AND	#%10000000
	BEQ	.ClearPF7_5	; if set
	LDA	r093
	ORA	#%00001100
	JMP	.DonePF7_5
.ClearPF7_5
	LDA	r093
	AND	#%11110011
.DonePF7_5
	STA	w093
	STA	w097


	INY
	LDA	Town,y
	TAX

PF0_6
	AND	#%00000001
	BEQ	.ClearPF0_6	; if set
	LDA	r037
	ORA	#%00110000
	JMP	.DonePF0_6
.ClearPF0_6
	LDA	r037
	AND	#%11001111
.DonePF0_6
	STA	w037
	STA	w041

PF1_6
	TXA
	AND	#%00000010
	BEQ	.ClearPF1_6	; if set
	LDA	r045
	ORA	#%00110000
	JMP	.DonePF1_6
.ClearPF1_6
	LDA	r045
	AND	#%11001111
.DonePF1_6
	STA	w045
	STA	w049

PF2_6
	TXA
	AND	#%00000100
	BEQ	.ClearPF2_6	; if set
	LDA	r053
	ORA	#%00110000
	JMP	.DonePF2_6
.ClearPF2_6
	LDA	r053
	AND	#%11001111
.DonePF2_6
	STA	w053
	STA	w057

PF3_6
	TXA
	AND	#%00001000
	BEQ	.ClearPF3_6	; if set
	LDA	r061
	ORA	#%00110000
	JMP	.DonePF3_6
.ClearPF3_6
	LDA	r061
	AND	#%11001111
.DonePF3_6
	STA	w061
	STA	w065


PF4_6
	TXA
	AND	#%00010000
	BEQ	.ClearPF4_6	; if set
	LDA	r069
	ORA	#%00110000
	JMP	.DonePF4_6
.ClearPF4_6
	LDA	r069
	AND	#%11001111
.DonePF4_6
	STA	w069
	STA	w073

PF5_6
	TXA
	AND	#%00100000
	BEQ	.ClearPF5_6	; if set
	LDA	r077
	ORA	#%00110000
	JMP	.DonePF5_6
.ClearPF5_6
	LDA	r077
	AND	#%11001111
.DonePF5_6
	STA	w077
	STA	w081

PF6_6
	TXA
	AND	#%01000000
	BEQ	.ClearPF6_6	; if set
	LDA	r085
	ORA	#%00110000
	JMP	.DonePF6_6
.ClearPF6_6
	LDA	r085
	AND	#%11001111
.DonePF6_6
	STA	w085
	STA	w089

PF7_6
	TXA
	AND	#%10000000
	BEQ	.ClearPF7_6	; if set
	LDA	r093
	ORA	#%00110000
	JMP	.DonePF7_6
.ClearPF7_6
	LDA	r093
	AND	#%11001111
.DonePF7_6
	STA	w093
	STA	w097

	INY
	LDA	Town,y
	TAX

PF0_7
	AND	#%00000001
	BEQ	.ClearPF0_7	; if set
	LDA	r037
	ORA	#%11000000
	JMP	.DonePF0_7
.ClearPF0_7
	LDA	r037
	AND	#%00111111
.DonePF0_7
	STA	w037
	STA	w041

PF1_7
	TXA
	AND	#%00000010
	BEQ	.ClearPF1_7	; if set
	LDA	r045
	ORA	#%11000000
	JMP	.DonePF1_7
.ClearPF1_7
	LDA	r045
	AND	#%00111111
.DonePF1_7
	STA	w045
	STA	w049

PF2_7
	TXA
	AND	#%00000100
	BEQ	.ClearPF2_7	; if set
	LDA	r053
	ORA	#%11000000
	JMP	.DonePF2_7
.ClearPF2_7
	LDA	r053
	AND	#%00111111
.DonePF2_7
	STA	w053
	STA	w057

PF3_7
	TXA
	AND	#%00001000
	BEQ	.ClearPF3_7	; if set
	LDA	r061
	ORA	#%11000000
	JMP	.DonePF3_7
.ClearPF3_7
	LDA	r061
	AND	#%00111111
.DonePF3_7
	STA	w061
	STA	w065

PF4_7
	TXA
	AND	#%00010000
	BEQ	.ClearPF4_7	; if set
	LDA	r069
	ORA	#%11000000
	JMP	.DonePF4_7
.ClearPF4_7
	LDA	r069
	AND	#%00111111
.DonePF4_7
	STA	w069
	STA	w073

PF5_7
	TXA
	AND	#%00100000
	BEQ	.ClearPF5_7	; if set
	LDA	r077
	ORA	#%11000000
	JMP	.DonePF5_7
.ClearPF5_7
	LDA	r077
	AND	#%00111111
.DonePF5_7
	STA	w077
	STA	w081

PF6_7
	TXA
	AND	#%01000000
	BEQ	.ClearPF6_7	; if set
	LDA	r085
	ORA	#%11000000
	JMP	.DonePF6_7
.ClearPF6_7
	LDA	r085
	AND	#%00111111
.DonePF6_7
	STA	w085
	STA	w089


PF7_7
	TXA
	AND	#%10000000
	BEQ	.ClearPF7_7	; if set
	LDA	r093
	ORA	#%11000000
	JMP	.DonePF7_7
.ClearPF7_7
	LDA	r093
	AND	#%00111111
.DonePF7_7
	STA	w093
	STA	w097


	INY
	LDA	Town,y
	TAX

PF0_8
	AND	#%00000001
	BEQ	.ClearPF0_8	; if set
	LDA	r038
	ORA	#%11000000
	JMP	.DonePF0_8
.ClearPF0_8
	LDA	r038
	AND	#%00111111
.DonePF0_8
	STA	w038
	STA	w042

PF1_8
	TXA
	AND	#%00000010
	BEQ	.ClearPF1_8	; if set
	LDA	r046
	ORA	#%11000000
	JMP	.DonePF1_8
.ClearPF1_8
	LDA	r046
	AND	#%00111111
.DonePF1_8
	STA	w046
	STA	w050

PF2_8
	TXA
	AND	#%00000100
	BEQ	.ClearPF2_8	; if set
	LDA	r054
	ORA	#%11000000
	JMP	.DonePF2_8
.ClearPF2_8
	LDA	r054
	AND	#%00111111
.DonePF2_8
	STA	w054
	STA	w058

PF3_8
	TXA
	AND	#%00001000
	BEQ	.ClearPF3_8	; if set
	LDA	r062
	ORA	#%11000000
	JMP	.DonePF3_8
.ClearPF3_8
	LDA	r062
	AND	#%00111111
.DonePF3_8
	STA	w062
	STA	w066

PF4_8
	TXA
	AND	#%00010000
	BEQ	.ClearPF4_8	; if set
	LDA	r070
	ORA	#%11000000
	JMP	.DonePF4_8
.ClearPF4_8
	LDA	r070
	AND	#%00111111
.DonePF4_8
	STA	w070
	STA	w074

PF5_8
	TXA
	AND	#%00100000
	BEQ	.ClearPF5_8	; if set
	LDA	r078
	ORA	#%11000000
	JMP	.DonePF5_8
.ClearPF5_8
	LDA	r078
	AND	#%00111111
.DonePF5_8
	STA	w078
	STA	w082

PF6_8
	TXA
	AND	#%01000000
	BEQ	.ClearPF6_8	; if set
	LDA	r086
	ORA	#%11000000
	JMP	.DonePF6_8
.ClearPF6_8
	LDA	r086
	AND	#%00111111
.DonePF6_8
	STA	w086
	STA	w090

PF7_8
	TXA
	AND	#%10000000
	BEQ	.ClearPF7_8	; if set
	LDA	r094
	ORA	#%11000000
	JMP	.DonePF7_8
.ClearPF7_8
	LDA	r094
	AND	#%00111111
.DonePF7_8
	STA	w094
	STA	w098

	INY
	LDA	Town,y
	TAX

PF0_9
	AND	#%00000001
	BEQ	.ClearPF0_9	; if set
	LDA	r038
	ORA	#%00110000
	JMP	.DonePF0_9
.ClearPF0_9
	LDA	r038
	AND	#%11001111
.DonePF0_9
	STA	w038
	STA	w042

PF1_9
	TXA
	AND	#%00000010
	BEQ	.ClearPF1_9	; if set
	LDA	r046
	ORA	#%00110000
	JMP	.DonePF1_9
.ClearPF1_9
	LDA	r046
	AND	#%11001111
.DonePF1_9
	STA	w046
	STA	w050

PF2_9
	TXA
	AND	#%00000100
	BEQ	.ClearPF2_9	; if set
	LDA	r054
	ORA	#%00110000
	JMP	.DonePF2_9
.ClearPF2_9
	LDA	r054
	AND	#%11001111
.DonePF2_9
	STA	w054
	STA	w058

PF3_9
	TXA
	AND	#%00001000
	BEQ	.ClearPF3_9	; if set
	LDA	r062
	ORA	#%00110000
	JMP	.DonePF3_9
.ClearPF3_9
	LDA	r062
	AND	#%11001111
.DonePF3_9
	STA	w062
	STA	w066

PF4_9
	TXA
	AND	#%00010000
	BEQ	.ClearPF4_9	; if set
	LDA	r070
	ORA	#%00110000
	JMP	.DonePF4_9
.ClearPF4_9
	LDA	r070
	AND	#%11001111
.DonePF4_9
	STA	w070
	STA	w074

PF5_9
	TXA
	AND	#%00100000
	BEQ	.ClearPF5_9	; if set
	LDA	r078
	ORA	#%00110000
	JMP	.DonePF5_9
.ClearPF5_9
	LDA	r078
	AND	#%11001111
.DonePF5_9
	STA	w078
	STA	w082

PF6_9
	TXA
	AND	#%01000000
	BEQ	.ClearPF6_9	; if set
	LDA	r086
	ORA	#%00110000
	JMP	.DonePF6_9
.ClearPF6_9
	LDA	r086
	AND	#%11001111
.DonePF6_9
	STA	w086
	STA	w090

PF7_9
	TXA
	AND	#%10000000
	BEQ	.ClearPF7_9	; if set
	LDA	r094
	ORA	#%00110000
	JMP	.DonePF7_9
.ClearPF7_9
	LDA	r094
	AND	#%11001111
.DonePF7_9
	STA	w094
	STA	w098

	INY
	LDA	Town,y
	TAX

PF0_10
	AND	#%00000001
	BEQ	.ClearPF0_10	; if set
	LDA	r038
	ORA	#%00001100
	JMP	.DonePF0_10
.ClearPF0_10
	LDA	r038
	AND	#%11110011
.DonePF0_10
	STA	w038
	STA	w042

PF1_10
	TXA
	AND	#%00000010
	BEQ	.ClearPF1_10	; if set
	LDA	r046
	ORA	#%00001100
	JMP	.DonePF1_10
.ClearPF1_10
	LDA	r046
	AND	#%11110011
.DonePF1_10
	STA	w046
	STA	w050

PF2_10
	TXA
	AND	#%00000100
	BEQ	.ClearPF2_10	; if set
	LDA	r054
	ORA	#%00001100
	JMP	.DonePF2_10
.ClearPF2_10
	LDA	r054
	AND	#%11110011
.DonePF2_10
	STA	w054
	STA	w058

PF3_10
	TXA
	AND	#%00001000
	BEQ	.ClearPF3_10	; if set
	LDA	r062
	ORA	#%00001100
	JMP	.DonePF3_10
.ClearPF3_10
	LDA	r062
	AND	#%11110011
.DonePF3_10
	STA	w062
	STA	w066

PF4_10
	TXA
	AND	#%00010000
	BEQ	.ClearPF4_10	; if set
	LDA	r070
	ORA	#%00001100
	JMP	.DonePF4_10
.ClearPF4_10
	LDA	r070
	AND	#%11110011
.DonePF4_10
	STA	w070
	STA	w074

PF5_10
	TXA
	AND	#%00100000
	BEQ	.ClearPF5_10	; if set
	LDA	r078
	ORA	#%00001100
	JMP	.DonePF5_10
.ClearPF5_10
	LDA	r078
	AND	#%11110011
.DonePF5_10
	STA	w078
	STA	w082

PF6_10
	TXA
	AND	#%01000000
	BEQ	.ClearPF6_10	; if set
	LDA	r086
	ORA	#%00001100
	JMP	.DonePF6_10
.ClearPF6_10
	LDA	r086
	AND	#%11110011
.DonePF6_10
	STA	w086
	STA	w090

PF7_10
	TXA
	AND	#%10000000
	BEQ	.ClearPF7_10	; if set
	LDA	r094
	ORA	#%00001100
	JMP	.DonePF7_10
.ClearPF7_10
	LDA	r094
	AND	#%11110011
.DonePF7_10
	STA	w094
	STA	w098

	INY
	LDA	Town,y
	TAX

PF0_11
	AND	#%00000001
	BEQ	.ClearPF0_11	; if set
	LDA	r038
	ORA	#%00000011
	JMP	.DonePF0_11
.ClearPF0_11
	LDA	r038
	AND	#%11111100
.DonePF0_11
	STA	w038
	STA	w042


PF1_11
	TXA
	AND	#%00000010
	BEQ	.ClearPF1_11	; if set
	LDA	r046
	ORA	#%00000011
	JMP	.DonePF1_11
.ClearPF1_11
	LDA	r046
	AND	#%11111100
.DonePF1_11
	STA	w046
	STA	w050

PF2_11
	TXA
	AND	#%00000100
	BEQ	.ClearPF2_11	; if set
	LDA	r054
	ORA	#%00000011
	JMP	.DonePF2_11
.ClearPF2_11
	LDA	r054
	AND	#%11111100
.DonePF2_11
	STA	w054
	STA	w058

PF3_11
	TXA
	AND	#%00001000
	BEQ	.ClearPF3_11	; if set
	LDA	r062
	ORA	#%00000011
	JMP	.DonePF3_11
.ClearPF3_11
	LDA	r062
	AND	#%11111100
.DonePF3_11
	STA	w062
	STA	w066

PF4_11
	TXA
	AND	#%00010000
	BEQ	.ClearPF4_11	; if set
	LDA	r070
	ORA	#%00000011
	JMP	.DonePF4_11
.ClearPF4_11
	LDA	r070
	AND	#%11111100
.DonePF4_11
	STA	w070
	STA	w074

PF5_11
	TXA
	AND	#%00100000
	BEQ	.ClearPF5_11	; if set
	LDA	r078
	ORA	#%00000011
	JMP	.DonePF5_11
.ClearPF5_11
	LDA	r078
	AND	#%11111100
.DonePF5_11
	STA	w078
	STA	w082

PF6_11
	TXA
	AND	#%01000000
	BEQ	.ClearPF6_11	; if set
	LDA	r086
	ORA	#%00000011
	JMP	.DonePF6_11
.ClearPF6_11
	LDA	r086
	AND	#%11111100
.DonePF6_11
	STA	w086
	STA	w090

PF7_11
	TXA
	AND	#%10000000
	BEQ	.ClearPF7_11	; if set
	LDA	r094
	ORA	#%00000011
	JMP	.DonePF7_11
.ClearPF7_11
	LDA	r094
	AND	#%11111100
.DonePF7_11
	STA	w094
	STA	w098


	INY
	LDA	Town,y
	TAX

PF0_12
	AND	#%00000001
	BEQ	.ClearPF0_12	; if set
	LDA	r039
	ORA	#%00000011
	JMP	.DonePF0_12
.ClearPF0_12
	LDA	r039
	AND	#%11111100
.DonePF0_12
	STA	w039
	STA	w043

PF1_12
	TXA
	AND	#%00000010
	BEQ	.ClearPF1_12	; if set
	LDA	r047
	ORA	#%00000011
	JMP	.DonePF1_12
.ClearPF1_12
	LDA	r047
	AND	#%11111100
.DonePF1_12
	STA	w047
	STA	w051
PF2_12
	TXA
	AND	#%00000100
	BEQ	.ClearPF2_12	; if set
	LDA	r055
	ORA	#%00000011
	JMP	.DonePF2_12
.ClearPF2_12
	LDA	r055
	AND	#%11111100
.DonePF2_12
	STA	w055
	STA	w059

PF3_12
	TXA
	AND	#%00001000
	BEQ	.ClearPF3_12	; if set
	LDA	r063
	ORA	#%00000011
	JMP	.DonePF3_12
.ClearPF3_12
	LDA	r063
	AND	#%11111100
.DonePF3_12
	STA	w063
	STA	w067

PF4_12
	TXA
	AND	#%00010000
	BEQ	.ClearPF4_12	; if set
	LDA	r071
	ORA	#%00000011
	JMP	.DonePF4_12
.ClearPF4_12
	LDA	r071
	AND	#%11111100
.DonePF4_12
	STA	w071
	STA	w075

PF5_12
	TXA
	AND	#%00100000
	BEQ	.ClearPF5_12	; if set
	LDA	r079
	ORA	#%00000011
	JMP	.DonePF5_12
.ClearPF5_12
	LDA	r079
	AND	#%11111100
.DonePF5_12
	STA	w079
	STA	w083


PF6_12
	TXA
	AND	#%01000000
	BEQ	.ClearPF6_12	; if set
	LDA	r087
	ORA	#%00000011
	JMP	.DonePF6_12
.ClearPF6_12
	LDA	r087
	AND	#%11111100
.DonePF6_12
	STA	w087
	STA	w091


PF7_12
	TXA
	AND	#%10000000
	BEQ	.ClearPF7_12	; if set
	LDA	r095
	ORA	#%00000011
	JMP	.DonePF7_12
.ClearPF7_12
	LDA	r095
	AND	#%11111100
.DonePF7_12
	STA	w095
	STA	w099


	INY
	LDA	Town,y
	TAX

PF0_13
	AND	#%00000001
	BEQ	.ClearPF0_13	; if set
	LDA	r039
	ORA	#%00001100
	JMP	.DonePF0_13
.ClearPF0_13
	LDA	r039
	AND	#%11110011
.DonePF0_13
	STA	w039
	STA	w043


PF1_13
	TXA
	AND	#%00000010
	BEQ	.ClearPF1_13	; if set
	LDA	r047
	ORA	#%00001100
	JMP	.DonePF1_13
.ClearPF1_13
	LDA	r047
	AND	#%11110011
.DonePF1_13
	STA	w047
	STA	w051

PF2_13
	TXA
	AND	#%00000100
	BEQ	.ClearPF2_13	; if set
	LDA	r055
	ORA	#%00001100
	JMP	.DonePF2_13
.ClearPF2_13
	LDA	r055
	AND	#%11110011
.DonePF2_13
	STA	w055
	STA	w059

PF3_13
	TXA
	AND	#%00001000
	BEQ	.ClearPF3_13	; if set
	LDA	r063
	ORA	#%00001100
	JMP	.DonePF3_13
.ClearPF3_13
	LDA	r063
	AND	#%11110011
.DonePF3_13
	STA	w063
	STA	w067

PF4_13
	TXA
	AND	#%00010000
	BEQ	.ClearPF4_13	; if set
	LDA	r071
	ORA	#%00001100
	JMP	.DonePF4_13
.ClearPF4_13
	LDA	r071
	AND	#%11110011
.DonePF4_13
	STA	w071
	STA	w075

PF5_13
	TXA
	AND	#%00100000
	BEQ	.ClearPF5_13	; if set
	LDA	r079
	ORA	#%00001100
	JMP	.DonePF5_13
.ClearPF5_13
	LDA	r079
	AND	#%11110011
.DonePF5_13
	STA	w079
	STA	w083

PF6_13
	TXA
	AND	#%01000000
	BEQ	.ClearPF6_13	; if set
	LDA	r087
	ORA	#%00001100
	JMP	.DonePF6_13
.ClearPF6_13
	LDA	r087
	AND	#%11110011
.DonePF6_13
	STA	w087
	STA	w091

PF7_13
	TXA
	AND	#%10000000
	BEQ	.ClearPF7_13	; if set
	LDA	r095
	ORA	#%00001100
	JMP	.DonePF7_13
.ClearPF7_13
	LDA	r095
	AND	#%11110011
.DonePF7_13
	STA	w095
	STA	w099

	INY
	LDA	Town,y
	TAX

PF0_14
	AND	#%00000001
	BEQ	.ClearPF0_14	; if set
	LDA	r039
	ORA	#%00110000
	JMP	.DonePF0_14
.ClearPF0_14
	LDA	r039
	AND	#%11001111
.DonePF0_14
	STA	w039
	STA	w043

PF1_14
	TXA
	AND	#%00000010
	BEQ	.ClearPF1_14	; if set
	LDA	r047
	ORA	#%00110000
	JMP	.DonePF1_14
.ClearPF1_14
	LDA	r047
	AND	#%11001111
.DonePF1_14
	STA	w047
	STA	w051

PF2_14
	TXA
	AND	#%00000100
	BEQ	.ClearPF2_14	; if set
	LDA	r055
	ORA	#%00110000
	JMP	.DonePF2_14
.ClearPF2_14
	LDA	r055
	AND	#%11001111
.DonePF2_14
	STA	w055
	STA	w059

PF3_14
	TXA
	AND	#%00001000
	BEQ	.ClearPF3_14	; if set
	LDA	r063
	ORA	#%00110000
	JMP	.DonePF3_14
.ClearPF3_14
	LDA	r063
	AND	#%11001111
.DonePF3_14
	STA	w063
	STA	w067

PF4_14
	TXA
	AND	#%00010000
	BEQ	.ClearPF4_14	; if set
	LDA	r071
	ORA	#%00110000
	JMP	.DonePF4_14
.ClearPF4_14
	LDA	r071
	AND	#%11001111
.DonePF4_14
	STA	w071
	STA	w075

PF5_14
	TXA
	AND	#%00100000
	BEQ	.ClearPF5_14	; if set
	LDA	r079
	ORA	#%00110000
	JMP	.DonePF5_14
.ClearPF5_14
	LDA	r079
	AND	#%11001111
.DonePF5_14
	STA	w079
	STA	w083

PF6_14
	TXA
	AND	#%01000000
	BEQ	.ClearPF6_14	; if set
	LDA	r087
	ORA	#%00110000
	JMP	.DonePF6_14
.ClearPF6_14
	LDA	r087
	AND	#%11001111
.DonePF6_14
	STA	w087
	STA	w091

PF7_14
	TXA
	AND	#%10000000
	BEQ	.ClearPF7_14	; if set
	LDA	r095
	ORA	#%00110000
	JMP	.DonePF7_14
.ClearPF7_14
	LDA	r095
	AND	#%11001111
.DonePF7_14
	STA	w095
	STA	w099

	INY
	LDA	Town,y
	TAX

PF0_15
	AND	#%00000001
	BEQ	.ClearPF0_15	; if set
	LDA	r039
	ORA	#%11000000
	JMP	.DonePF0_15
.ClearPF0_15
	LDA	r039
	AND	#%00111111
.DonePF0_15
	STA	w039
	STA	w043

PF1_15
	TXA
	AND	#%00000010
	BEQ	.ClearPF1_15	; if set
	LDA	r047
	ORA	#%11000000
	JMP	.DonePF1_15
.ClearPF1_15
	LDA	r047
	AND	#%00111111
.DonePF1_15
	STA	w047
	STA	w051

PF2_15
	TXA
	AND	#%00000100
	BEQ	.ClearPF2_15	; if set
	LDA	r055
	ORA	#%11000000
	JMP	.DonePF2_15
.ClearPF2_15
	LDA	r055
	AND	#%00111111
.DonePF2_15
	STA	w055
	STA	w059

PF3_15
	TXA
	AND	#%00001000
	BEQ	.ClearPF3_15	; if set
	LDA	r063
	ORA	#%11000000
	JMP	.DonePF3_15
.ClearPF3_15
	LDA	r063
	AND	#%00111111
.DonePF3_15
	STA	w063
	STA	w067

PF4_15
	TXA
	AND	#%00010000
	BEQ	.ClearPF4_15	; if set
	LDA	r071
	ORA	#%11000000
	JMP	.DonePF4_15
.ClearPF4_15
	LDA	r071
	AND	#%00111111
.DonePF4_15
	STA	w071
	STA	w075

PF5_15
	TXA
	AND	#%00100000
	BEQ	.ClearPF5_15	; if set
	LDA	r079
	ORA	#%11000000
	JMP	.DonePF5_15
.ClearPF5_15
	LDA	r079
	AND	#%00111111
.DonePF5_15
	STA	w079
	STA	w083


PF6_15
	TXA
	AND	#%01000000
	BEQ	.ClearPF6_15	; if set
	LDA	r087
	ORA	#%11000000
	JMP	.DonePF6_15
.ClearPF6_15
	LDA	r087
	AND	#%00111111
.DonePF6_15
	STA	w087
	STA	w091

PF7_15
	TXA
	AND	#%10000000
	BEQ	.ClearPF7_15	; if set
	LDA	r095
	ORA	#%11000000
	JMP	.DonePF7_15
.ClearPF7_15
	LDA	r095
	AND	#%00111111
.DonePF7_15
	STA	w095
	STA	w099
end
	goto DOSPRITE bank9
	asm
Town
	.byte	#%00010000
	.byte	#%00010000
	.byte	#%11111000
	.byte	#%11111000
	.byte	#%11011100
	.byte	#%11011100
	.byte	#%11111110
	.byte	#%11111110
	.byte	#%00111111
	.byte	#%00111011
	.byte	#%00111011
	.byte	#%00111111
	.byte	#%11111110
	.byte	#%11111110
	.byte	#%11111100
	.byte	#%11011110
	.byte	#%11011110
	.byte	#%11111000
	.byte	#%00010000
	.byte	#%00010000
	.byte	#%00000010
	.byte	#%00000101
	.byte	#%11111110
	.byte	#%11111110
	.byte	#%00001001
	.byte	#%00000100
	.byte	#%11111000
	.byte	#%00111110
	.byte	#%00111011
	.byte	#%11111111
	.byte	#%11111101
	.byte	#%11011011
	.byte	#%11011111
	.byte	#%11111111
	.byte	#%11111111
	.byte	#%11011111
	.byte	#%11011111
	.byte	#%11111111
	.byte	#%11111111
	.byte	#%11011111
	.byte	#%11011111
	.byte	#%11111111
	.byte	#%11111111
	.byte	#%11011111
	.byte	#%11011110
	.byte	#%11111100
	.byte	#%00000000
	.byte	#%00000000
	.byte	#%01100000
	.byte	#%01100000
	.byte	#%11110000
	.byte	#%11101000
	.byte	#%01111000
	.byte	#%01101000
	.byte	#%01101000
	.byte	#%01101000
	.byte	#%01111000
	.byte	#%01101000
	.byte	#%11101000
	.byte	#%11101000
	.byte	#%01111000
	.byte	#%01110000
	.byte	#%00000000
	.byte	#%00000000
	.byte	#%00100000
	.byte	#%11100000
	.byte	#%11110000
	.byte	#%11100000
	.byte	#%00100000
	.byte	#%00000000
	.byte	#%11111100
	.byte	#%11111110
	.byte	#%10001111
	.byte	#%10001111
	.byte	#%10001111
	.byte	#%10001101
	.byte	#%10001101
	.byte	#%10001101
	.byte	#%10001101
	.byte	#%11111111
	.byte	#%11111111
	.byte	#%00111111
	.byte	#%00111111
	.byte	#%00111111
	.byte	#%00111111
	.byte	#%11111111
	.byte	#%11111111
	.byte	#%10001111
	.byte	#%10001101
	.byte	#%10001101
	.byte	#%10001101
	.byte	#%10001101
	.byte	#%10001111
	.byte	#%10001111
	.byte	#%10001111
	.byte	#%11111110
	.byte	#%11111110
	.byte	#%00000000
	.byte	#%00000000
	.byte	#%10000000
	.byte	#%11000010
	.byte	#%11000101
	.byte	#%10000011
	.byte	#%00000001
	.byte	#%00000001
	.byte	#%11111111
	.byte	#%00000010
	.byte	#%00000000
	.byte	#%11111111
	.byte	#%01010101
	.byte	#%11111111
	.byte	#%01010101
	.byte	#%11111111
	.byte	#%01010101
	.byte	#%11111111
	.byte	#%00000000
	.byte	#%00000000
	.byte	#%11000100
	.byte	#%11100100
	.byte	#%11111110
	.byte	#%11111110
	.byte	#%11100100
	.byte	#%11000100
	.byte	#%00000000
	.byte	#%00000000
	.byte	#%00000000
	.byte	#%11000000
	.byte	#%11100010
	.byte	#%11100010
	.byte	#%11111111
	.byte	#%11111111
	.byte	#%11100010
	.byte	#%11100010
	.byte	#%11000000
	.byte	#%00000000
	.byte	#%00000000
	.byte	#%00000000
	.byte	#%00000010
	.byte	#%11111111
	.byte	#%00000001
	.byte	#%00000001
	.byte	#%00000001
	.byte	#%01101001
	.byte	#%00011111
	.byte	#%01101011
	.byte	#%00000000
	.byte	#%00000000
	.byte	#%00000000
	.byte	#%00001000
	.byte	#%11111100
	.byte	#%11111110
	.byte	#%11111111
	.byte	#%00111011
	.byte	#%00111011
	.byte	#%11111111
	.byte	#%11111111
	.byte	#%11011111
	.byte	#%11011111
	.byte	#%11111111
	.byte	#%11111101
	.byte	#%11111001
	.byte	#%11011001
	.byte	#%11011001
	.byte	#%11111011
	.byte	#%11111110
	.byte	#%00001100
	.byte	#%00001000
	.byte	#%00000000
	.byte	#%00000000
	.byte	#%00010001
	.byte	#%00111111
	.byte	#%00111111
	.byte	#%01111001
	.byte	#%11101000
	.byte	#%11111000
	.byte	#%01101000
	.byte	#%00111000
	.byte	#%00101000
	.byte	#%00111000
	.byte	#%00101000
	.byte	#%00111000
	.byte	#%01111111
	.byte	#%11111111
	.byte	#%11111001
	.byte	#%01111001
	.byte	#%00111001
	.byte	#%00101001
	.byte	#%00101001
	.byte	#%00111111
	.byte	#%00111111
	.byte	#%10000000
	.byte	#%11000000
	.byte	#%11100010
	.byte	#%11110010
	.byte	#%11111111
end
	


 	bank 11
SoldierLoop
	CTRLPF=$21
	; if  TicTic>0 then goto NoTic
	asm
	LDA	#0
  	CMP	TicTic
  	BNE	.NoTic
end
	dec Score2=Score2-$01
	; TicTic=28-Haaard
	; TicTic=TicTic-Haaard
	; if TicTic>40 then TicTic=1
	asm
	LDA	#28
	SEC
	SBC 	Haaard
	SEC
	SBC 	Haaard
	CMP	#40
  	BCC	.Smallerthan40
	LDA	#1
.Smallerthan40
	STA 	TicTic
end
	SoundFade=20
NoTic
	; if SoundFade=0 then AUDV0=0: goto NoFade
	asm
	LDA 	#0
	CMP	SoundFade
	BNE	.ZZ0
	STA 	AUDV0
	JMP	.NoFade

.ZZ0

end
	if switchleftb then  AUDV0=SoundFade/2 else AUDV0=0: goto NoFade 
	AUDC0=6
	AUDF0=20-SoundFade
	SoundFade=SoundFade-1
	; if SoundFade>7 then temp4=7 else temp4=SoundFade
	; ScoreColor = 0 : dec ScoreColor=ScoreColor+temp4
	; if Score2<$11 then dec ScoreColor=ScoreColor+$40: AUDC0=3
	; scorecolor=ScoreColor
	asm
	LDA	#7
	CMP 	SoundFade
	BCC	.Benedek
	LDA 	SoundFade
.Benedek
	STA 	temp4
	LDA	#0
  	SED
  	CLC
  	ADC	temp4
  	TAY	
 	LDA	Score2
 	CMP	#$11
 	BCS	.skipL01225_25
	TYA  
  	CLC
	ADC	#$40
  	TAY
  	CLD
  	LDA	#3
  	STA	AUDC0
.skipL01225_25
	STY 	ScoreColor
	STY 	scorecolor
	CLD
end


NoFade
	TicTic=TicTic-1

	asm
.SetY
	ldy 	#0
	lda	player0y
	
Still_3
	CMP	#3
	BCC	Than3	
	iny
	SEC
	SBC	#3
	jmp	Still_3
Than3
	STY	PosY	
	TYA
	CLC
	ADC	#1
	STA	temp1
	SEC
	SBC	#2
	STA 	temp15
	SEC
	SBC	#1
	STA 	temp14
	SEC
	SBC	#1
	STA 	temp5
.SetX
	LDA	player0x
  	SEC
  	SBC	#13
  	lsr
  	lsr
  	SEC
	SBC	#1
  	CMP	#30
	BCC	.skipL0527_1299
	LDA	#30
.skipL0527_1299
	STA	PosX

end
	asm
	CLC
	ADC	#1
	STA	temp4
	CLC
	ADC	#1
	STA	temp6

end
	; temp4=PosX+1: temp6=PosX+2:  temp15=PosY-1: temp14=PosY-2: temp5=PosY-3: temp1=PosY+1
 	; if !joy0up then goto NoSoldUp
	asm
  	lda	#$10
  	bit	SWCHA
 	BNE	.NoSoldUp
	LDA	player0y
 	CMP	#10
  	BCS	.GZT0
	JMP 	.NoSoldDown
.GZT0
end
	;if player0y<10 then goto NoSoldDown
	if pfread(PosX,temp5) then goto NoSoldDown
	if pfread(temp4,temp5) then goto NoSoldDown
	; if player0y >45 then goto No50
	; if player0x<125 &&  player0x>110  then goto No50
	asm
	LDA	#45
  	CMP	player0y
  	BCC	.No50
  	LDA	player0x
 	CMP	#125
  	BCS	.skipL0123536
  	LDA	#110
  	CMP	player0x
  	BCC	.No50
.skipL0123536
end
	if collision(playfield, player0) then goto NoSoldDown
No50

	player0y=player0y-1: var1{3} =1
	goto NoSoldDown
NoSoldUp
	; if !joy0down then goto NoSoldDown
	; if player0y>68 then goto NoSoldDown
	asm
	lda	#$20
  	bit	SWCHA
  	BNE	.NoSoldDown
  	LDA	#68
 	CMP	player0y
  	BCC	.NoSoldDown
end

	if pfread(PosX,temp1) then goto NoSoldDown
	if pfread(temp4,temp1) then goto NoSoldDown
	player0y=player0y+1: var1{3} =1

NoSoldDown
	; Oszlop=15-PosY
	;  if Oszlop>2 then Oszlop=0
	;  OszlopMax=43-PosY
	asm
	LDA	#15
  	SEC
  	SBC	PosY
  	CMP	#2
  	BCC	.skipL0124555
  	LDA	#0
.skipL0124555
  	STA	Oszlop
 	LDA	#43
 	SEC
  	SBC	PosY
  	STA	OszlopMax
end
	 if !joy0left then goto NoSoldLeft

	; temp3=Oszlop
	;  if player0x<18 then goto NoSoldRight
	;  if PosX<temp3 then goto NoSoldRight
	asm
  	LDA	PosX
  	CMP	Oszlop
  	BCC	.RIKK
 	LDA	player0x
 	CMP	#18
 	BCC	.RIKK
end
	if pfread(PosX, PosY) then goto NoSoldRight
	if pfread(PosX, temp15) then goto NoSoldRight
	if pfread(PosX, temp14) then goto NoSoldRight

	player0x=player0x-1: var1{3} =1
	if var1{5}  then REFP0=0
RIKK
	goto NoSoldRight
NoSoldLeft
	; if !joy0right then goto NoSoldRight
	;  temp3=OszlopMax-1
	;  if player0x>138 then goto NoSoldRight

	;  if PosX>temp3 then goto NoSoldRight
	asm
	bit	SWCHA
  	BPL	.KIKIKI
.LALALA
	JMP	.NoSoldRight
.KIKIKI
	LDA	OszlopMax
  	SEC
  	SBC	#1
 	CMP	PosX
  	BCC	.NoSoldRight
 	LDA	#138
  	CMP	player0x
  	BCC	.NoSoldRight
end
	if pfread(temp6, PosY) then goto NoSoldRight
	if pfread(temp6, temp15) then goto NoSoldRight
	if pfread(temp6, temp14) then goto NoSoldRight
	if var1{5}  then REFP0=8
	player0x=player0x+1: var1{3} =1
	
NoSoldRight
	if var1{4}  then goto WithBlock

	


	missile1height=10: missile1x=player0x+1: REFP0=0: NUSIZ1=0
	player1x=player0x: player1y=player0y-7
	player1:
	%00111100
	%00111100
	%01111110
	%01111110
	%01111110
end
	; if var1{3}  then goto SoldierMove
	asm
	LDA	var1
  	AND	#8
  	BNE	.SoldierMove
end
	missile1y=player0y+3
 	player0:
 	%01100110
 	%00100100
 	%01100110
 	%01100110
 	%01100110
 	%11111111
 	%10111101
 	%10011001
 	%10100101
 	%11100111
 	%11000011
 	%01100110
 	%00111100
 	%00011000
 	%00111100
 	%01011010
 	%01111110
 	%00111100
end

	goto BreakingTheLaw
SoldierMove

 	; if SoldierSprite>9 then S010
	asm
	LDA	#9
  	CMP	SoldierSprite
  	BCC	.S010

end
	missile1y=player0y+2: player0:
 	%00100000
 	%00100000
 	%01100100
 	%01100110
 	%01101110
 	%00111100
 	%01111100
 	%01100100
 	%10100101
 	%10100101
 	%10100101
 	%01011011
 	%00111100
 	%01111110
 	%01011010
 	%00111100
	 %00011000
 	%00000000
end
	goto BreakingTheLaw
S010
 	; if SoldierSprite>19 then goto S020
	asm
	LDA	#19
  	CMP	SoldierSprite
  	BCC	.S020
end

	player1y=player0y-8
	missile1y=player0y:  player0:
 	%00000100
 	%00000100
 	%00000110
 	%00000110
 	%00100110
 	%01100110
 	%01100111
 	%00111111
 	%10111101
 	%10100101
 	%11100111
 	%10000010
 	%11111100
 	%00011000
 	%01111110
 	%00111100
 	%01011010
 	%00111100
end

	goto BreakingTheLaw
S020
 	missile1y=player0y+4: player0:
 	%00100100
 	%00100100
 	%01100110
 	%01100110
 	%01100110
 	%01111110
 	%00111100
 	%10011001
	%10100101
 	%11100111
 	%11000011
 	%01100110
 	%00111100
 	%00011000
 	%00111100
 	%01011010
 	%01111110
	%00111100
end
	goto BreakingTheLaw
WithBlock
	player1y=160
	; if var1{5}  then REFP0=8 else REFP0=0
	asm
	LDA	var1
  	AND	#32
  	BEQ	.skipL0125959
  	LDA	#8
	jmp	.skipelse4949
.skipL0125959
  	LDA	#0
.skipelse4949
 	STA	REFP0
end
	missile1height=0: missile1y=player0y-5: NUSIZ1=$30: ballheight=3: CTRLPF=$21: bally=player0y-7
	; if var1{3}  then goto CarryMove
	asm
	LDA	var1
  	AND	#8
  	BNE	.CarryMove
end
	if !var1{5}  then ballx=player0x-5: missile1x=player0x-5 else ballx=player0x+12: missile1x=player0x+8 
	asm
	LDA	var1
  	AND	#32
  	BNE	.skipL0126262
  	LDA	player0x
  	SEC
  	SBC	#5
  	STA	ballx
  	LDA	player0x
  	SEC
  	SBC	#5
  	jmp	.skipelse5050
.skipL0126262
  	LDA	player0x
  	CLC
  	ADC	#12
 	STA	ballx
 	LDA	player0x
  	CLC
  	ADC	#8
.skipelse5050
	STA 	missile1x
end
 	player0:
 	%00011010
 	%00001001
 	%00010001
 	%00001011
 	%00001011
 	%11111101
 	%01010111
 	%01101111
 	%00100101
 	%00010111
 	%00011110
 	%00001111
 	%00111110
 	%00011101
 	%00011110
 	%00101011
 	%00111111
 	%00011110
end
	goto BreakingTheLaw
CarryMove
	;  if SoldierSprite>9 then goto Carry10
	asm
	LDA	#9
  	CMP	SoldierSprite
  	BCC	.Carry10

end
	; if !var1{5}  then ballx=player0x-5: missile1x=player0x-5  else ballx=player0x+12: missile1x=player0x+8
	asm
	LDA	var1
  	AND	#32
  	BNE	.skipL0126666
  	LDA	player0x
  	SEC
  	SBC	#5
  	STA	ballx
  	LDA	player0x
 	SEC
  	SBC	#5
  	jmp	.skipelse5151
.skipL0126666
  	LDA	player0x
 	CLC
  	ADC	#12
 	STA	ballx
  	LDA	player0x
  	CLC
  	ADC	#8
.skipelse5151
  	STA	missile1x

end

 	player0:
 	%00110001
 	%00010111
 	%00001100
 	%00010111
 	%00001011
 	%11111101
 	%00101111
 	%01000101
 	%00100101
 	%00110111
 	%00111111
 	%00011111
 	%00011110
 	%00011111
 	%00101011
 	%00111111
 	%00011110
 	%00000000
end
	goto BreakingTheLaw

Carry10
 	; if SoldierSprite>19 then  goto Carry20
	asm
	LDA	#19
  	CMP	SoldierSprite
 	BCC	.Carry20

end
	; if !var1{5}  then ballx=player0x-6: missile1x=player0x-6 else ballx=player0x+13: missile1x=player0x+9
	asm
	LDA	var1
  	AND	#32
  	BNE	.skipL0127070
  	LDA	player0x
  	SEC
  	SBC	#6
  	STA	ballx
  	LDA	player0x
  	SEC
  	SBC	#6
  	jmp	.skipelse5252
.skipL0127070
  	LDA	player0x
  	CLC
 	ADC	#13
  	STA	ballx
  	LDA	player0x
 	CLC
  	ADC	#9
.skipelse5252
	STA	missile1x
end
	player0:
 	%00000110
 	%00011010
 	%00001010
 	%00001111
 	%00000011
 	%11111111
 	%01010111
 	%00101011
 	%00010111
 	%00001101
 	%00000111
 	%01111111
 	%00110111
 	%00111110
 	%01010100
 	%01111100
 	%00111000
 	%00000000
end
	goto BreakingTheLaw

Carry20
	; if !var1{5}  then ballx=player0x-4: missile1x=player0x-4  else ballx=player0x+11: missile1x=player0x+7
	asm
  	LDA	var1
  	AND	#32
  	BNE	.skipL0127373
  	LDA	player0x
 	SEC
  	SBC	#4
  	STA	ballx
  	LDA	player0x
  	SEC
  	SBC	#4
  	jmp	.skipelse5353
.skipL0127373
  	LDA	player0x
  	CLC
 	ADC	#11
 	STA	ballx
  	LDA	player0x
 	CLC
  	ADC	#7
.skipelse5353
	STA	missile1x
end
 	 player0:
 	%00011011
	%00001001
 	%00000111
 	%00000011
 	%00000011
 	%11111111
 	%01001011
 	%00100111
 	%00011011
 	%00001101
 	%00000111
 	%00001111
 	%11101110
 	%11111100
 	%01111100
 	%01101100
 	%00011000
 	%00000000
end

BreakingTheLaw
	COLUP0=$42: COLUP1=$46
	if !joy0up && !joy0down && !joy0left && !joy0right then var1{3} =0

	if var1{4} then goto pickeditup

	if player0y>38 || Score2>$85 then goto NoGOIN
	if player0x>121 || player0x<113 then goto NoGOIN
	if SoldierLeft=0 then goto NoGOIN 
	scorecolor=0 : ScoreColor=0: temp8=0: AUDV0=0: SSS=15: player0y=160: player1y=160: missile1y=160
	
	
	
WaitLoop
	 AUDV1=SSS: AUDF1=SSS: AUDC1=2
	SSS=SSS-1
	if SSS=0 then goto NewSoldier bank9 else drawscreen
	goto WaitLoop

NoGOIN





	if !collision(missile1, playfield) then goto nopickup
	asm
.Ballyy
	ldy 	#0
	lda	missile1y
	
Still_3ball
	CMP	#3
	BCC	Than3ball	
	iny
	SEC
	SBC	#3
	jmp	Still_3ball
Than3ball
	STY	temp13	
.Ballxx
	LDA	missile1x
  	SEC
  	SBC	#13
  	lsr
  	lsr
  	SEC
	SBC	#1
  	CMP	#30
	BCC	.skipL0527_1299ball
	LDA	#30
.skipL0527_1299ball
	STA	temp14
end
 	if temp13>19 || temp13<SorMax then goto nopickup
	temp2=15-temp13
 	if temp2>2 then temp2=0
 	temp3=43-temp13
	if temp14<temp2 || temp14>temp3 then goto nopickup
	if var1{6} then goto nopickup
	if !pfread(temp14, temp13) then goto nopickup
	pfpixel temp14 temp13 off	
	var1{4} = 1: SSS=10: AUDC1=3
pickeditup
	if !var1{3} then goto NONONONO
	if joy0left then var1{5}=0 
	if joy0right then var1{5}=1 

NONONONO 

	asm
.Ballyy2
	ldy 	#0
	lda	bally
	
Still_3ball2
	CMP	#3
	BCC	Than3ball2	
	iny
	SEC
	SBC	#3
	jmp	Still_3ball2
Than3ball2
	STY	temp13	
.Ballxx2
	LDA	ballx
  	SEC
  	SBC	#13
  	lsr
  	lsr
  	SEC
	SBC	#1
  	CMP	#30
	BCC	.skipL0527_1299ball2
	LDA	#30
.skipL0527_1299ball2
	STA	temp14
end
	if temp13>12 || player0x>72  then goto Larger12
	
	
	if temp14>14-temp13 then goto nopickup
Exxx
	var1{6} = 1: var1{4} = 0	
	bally=bally-3: SSS=9: AUDC1=1 

	temp5=Haaard
Add102
	if temp5=0 then goto NoMore102
	temp5=temp5-1
	dec score=score+10
	goto Add102
NoMore102


	ExtraLife=ExtraLife+Haaard
	Remain=Remain-1
	if ExtraLife>100 then ExtraLife=ExtraLife-100: var15{0}=0: goto ExxtraLife

	goto  nopickup

Larger12  
	if temp13<15 || player0x<72 then goto nopickup
	if temp14<43-temp13 then goto nopickup else goto Exxx



nopickup
	if  !var1{3} || SoldierSprite>30 then SoldierSprite=0  else SoldierSprite=SoldierSprite+1 
	if !var1{6} then goto NoFalling
	if var1{7}  then bally=bally+1
	if ballx>72 then ballx=ballx+1 else ballx=ballx-1
	if ballx<12 || ballx>142 then bally=160: var1{6} = 0
NoFalling
	var1{7} = !var1{7} 
	if SSS>0 then SSS=SSS-1: AUDV1=SSS: AUDF1=SSS else AUDV1=0 

	if !var1{6} && Remain=0 then goto LevelEnd
	if Score2=0 then goto SoldierDeath
	if switchselect then goto BackToMenu bank14
	if switchreset then COLUP0=$00: COLUP1=00: goto BackReset bank14
	drawscreen
	goto SoldierLoop

LevelEnd
	ScoreColor=$00
	AUDV0=0: AUDV1=0: SSS=0
	

EndLoop	
	
	if SSS>0 then SSS=SSS-1: AUDV1=SSS: AUDF1=SSS : goto FPGA else AUDV1=0 
	if SoldierLeft=0 then Score2=$90: Haaard=Haaard+1: player0y=160: player1y=160: missile1y=160: bally=160: goto LevelStart_Soldier bank9 
	temp3=50
	temp5=Haaard*5: ExtraLife=ExtraLife+temp5
Add10
	if temp3=0 then goto NoMore10
	temp3=temp3-1
	
	dec score=score+Haaard
	goto Add10
NoMore10

	temp5=SoldierLeft*2
	temp5=temp5+2
	pfpixel temp5 2 off
	SoldierLeft=SoldierLeft-1: SSS=12: AUDC1=3
	if ExtraLife>100 then ExtraLife=ExtraLife-100: var15{0}=1: goto ExxtraLife

FPGA
	if SSS>7 then temp4=7 else temp4=SSS

	if SSS=0 then ScoreColor=$00 else dec ScoreColor=$d0+temp4
	scorecolor=ScoreColor 
	AUDV1=SSS: AUDF1=SSS
	COLUP0=$42: COLUP1=$46
	drawscreen
	goto EndLoop


ExxtraLife
	if Score1=$09 then goto Noou
	SSS=14: AUDC0=7: dec Score1=Score1+$01: SoldierLeft=SoldierLeft+1
	pfhline 0 2 20 off
	temp9=0
	temp10=0

LoopDrawLeft2
	if  SoldierLeft>temp10-$01 then pfpixel temp9 2 on
	temp10=temp10+$01: temp9=temp9+2
	if temp10=$10 then goto ExxtraLoop
	

	goto LoopDrawLeft2

ExxtraLoop
	if SSS>0 then goto NOBACK
	AUDV0=0: ScoreColor =0
Noou
	if var15{0} then goto FPGA else goto nopickup
	
	
NOBACK
	AUDV0=SSS: AUDF0=SSS: SSS=SSS-1
	if SSS>7 then temp4=7 else temp4=SSS
	ScoreColor=$10: dec ScoreColor = ScoreColor+temp4
	scorecolor=ScoreColor 
	COLUP0=$42: COLUP1=$46
		drawscreen
	goto ExxtraLoop
SoldierDeath
	bally=160: player1y=160: missile1y=160
	SSS=0: AUDC0=15: AUDV1=0: var1{7}=0
DeathDance

	if SSS>0 then goto OOP
	SSS=10: var1{7}=!var1{7}
	if !var1{7} then goto REW
	if player0height>3 then player0height=player0height-2 else player0height=player0height-1
	gosub Redness bank8 
	goto OOP
REW
	gosub Level0 bank8
	if player0height>0 then goto OOP
	dec Score1=Score1-$01
	if SoldierLeft=0 then goto GameOver bank14
	if var1{4} then Remain=Remain-1
	var15{1} =1: goto RETURNER bank9
	
OOP
	AUDF0=15-SSS: SSS=SSS-1
	if SSS>7 then temp4=7 else temp4=SSS
	if var1{7} then AUDV0=SSS: COLUP0=$00: ScoreColor=$40: dec ScoreColor = ScoreColor+temp4  else AUDV0=0 : dec COLUP0 = $40+temp4  : ScoreColor=0
	ScoreColor=scorecolor
	if var1{5} && var1{4}   then REFP0=8 
	drawscreen
	goto DeathDance
 	bank 12
ReactorStart
	ReactorLoop=0: ReactorSpeed=30: Particles=0: ReactorCounter=0
	Performance1=$00: Performance2=$16: Performance3=$00: bally=160: missile1y=160
	WaterL=10: var1{1}=0: Rudak=15: Temperature=0: SlowCounter=0: temp8=4: temp9=0: temp10=0
Reactor
	if Performance1<$03 then goto NotStopped else playfield:
 	XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 	................................
 	XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 	........XXX.X.X..X.X.XXX........
 	XX.XXXX.XXXXXXXXXXXXXXXX.XXXX.XX
 	X...XX...X............X...XX...X
 	X...XX....................XX...X
 		X.X....X.X............X.X....X.X
 	X.X.XXXXXX............XXXXXX.X.X
 	X.X..........................X.X
 	X.XXXXXXXX............XXXXXXXX.X
 	X..XXX.X.X............X.X.XXX..X
 	XX.XXX.X.X............X.X.XXX.XX
 	XXXXXX.X.X............X.X.XXXXXX
 	X...XX.X.X............X.X.XX...X
 	XXXXXX.XXX............XXX.XXXXXX
 	XX.XXX.XXX............XXX.XXX.XX
 	XX.XXX.XXX............XXX.XXX.XX
 	XX.XX....X............X....XX.XX
 	XX.XX....X............X....XX.XX
 	XX.XX......................XX.XX
 	XX.XXXXXXX............XXXXXXX.XX
 	XX.XXXXXXXXXXXXXXXXXXXXXXXXXX.XX
end

	player0y=160: player1y=160: missile1y=160: bally=160
	goto Stopped
NotStopped
	if ReactorLoop>0 then goto  Reac1
 	playfield:
 	XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 	.X..X..X..X..X..X..X..X..X..X..X
 	XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
	 X..X..X.XXX.X.X..X.X.XXX.X..X..X
 	XXXXXXX.XXXXXXXXXXXXXXXXXXXXX.XX
 	X...XX...X............X...XX...X
 	X...XX....................XX...X
 	X.X..X.X.X............X.X.X..X.X
 	XXXXXXXXXX............XXXXXXXXXX
 	X.X..X..X..............X..X..X.X
 	X.XXXXXXXX............XXXXXXXX.X
 	XX.XXX.XXX............XXX.XXX.XX
 	XX.XXXXX.X............X.XXXXX.XX
 	XXXXXX.X.X............X.X.XXXXXX
 	XX..XX.XXX............XXX.XX..XX
 	XXXXXXXXXX............XXXXXXXXXX
 	XXXXXX.XXX............XXX.XXXXXX
 	XX.XXX.XXX............XXX.XXX.XX
 	XX.XX....X............X....XX.XX
 	XXXXX....X............X....XXXXX
 	XX.XX......................XX.XX
 	XX.XXXXXXX............XXXXXXX.XX
 	XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
end

 	player0:
 	%00000100
 	%00001100
 	%11111100
 	%01100100
 	%00100110
 	%00111111
 	%00110000
 	%00100000
end


	goto Stopped
Reac1
	if ReactorLoop=2 then goto  Reac2
 	playfield:
 	XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 	X..X..X..X..X..X..X..X..X..X..X.
 	XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 	.X..X..XXXX.X.X..X.X.XXXX..X..X.
 	XX.XXXX.XXXXXXXXXXXXXXXX.XXXX.XX
 	X...XX...X............X...XX...X
 	X...XX....................XX...X
 	XXX.X..XXX............XXX..X.XXX
 	X.X.XXXXXX............XXXXXX.X.X
 	X.XX..X..X............X..X..XX.X
 	XXXXXXXXXX............XXXXXXXXXX
 	X..XXX.X.X............X.X.XXX..X
 	XXXXXX.X.X............X.X.XXXXXX
 	XXXXXXXXXX............XXXXXXXXXX
 	X.X.XX.X.X............X.X.XX.X.X
 	XXXXXX.XXX............XXX.XXXXXX
 	XX.XXXXXXX............XXXXXXX.XX
 	XX.XXX.XXX............XXX.XXX.XX
 	XXXXX....X............X....XXXXX
 	XX.XX....X............X....XX.XX
 	XX.XX......................XX.XX
 	XXXXXXXXXX............XXXXXXXXXX
 	XX.XXXXXXXXXXXXXXXXXXXXXXXXXX.XX
end

 	player0:
 	%00010000
 	%00110000
 	%00111110
 	%00100111
 	%11100100
 	%01111100
 	%00001100
 	%00001000
end

	goto Stopped
Reac2
 	playfield:
 	XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 	..X..X..X..X..X..X..X..X..X..X..
 	XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 	..X..X..XXX.X.X..X.X.XXX..X..X..
 	XX.XXXXXXXXXXXXXXXXXXXXXXXXXX.XX
 	X...XX...X............X...XX...X
 	XX..XX....................XX..XX
 	X.XX..XX.X............X.XX..XX.X
 	X.X.XXXXXX............XXXXXX.X.X
 	XXX.X..X................X..X.XXX
 	X.XXXXXXXX............XXXXXXXX.X
 	X.XXXXXX.X............X.XXXXXX.X
 	XX.XXX.XXX............XXX.XXX.XX
 	XXXXXX.X.X............X.X.XXXXXX
 	X..XXXXX.X............X.XXXXX..X
 	XXXXXX.XXX............XXX.XXXXXX
 	XX.XXX.XXX............XXX.XXX.XX
 	XXXXXXXXXX............XXXXXXXXXX
 	XX.XX....X............X....XX.XX
 	XX.XX....X............X....XX.XX
 	XXXXX......................XXXXX
 	XX.XXXXXXX............XXXXXXX.XX
 	XX.XXXXXXXXXXXXXXXXXXXXXXXXXX.XX
end

 	player0:
 	%00000010
 	%11000110
 	%01111100
 	%00100100
 	%00100100
 	%00111110
 	%01100011
 	%01000000
end

Stopped

SetRudak	
	; if Rudak>250 then goto NoRud

	;  if Rudak>11 then goto Rud4
	;  if Rudak>7 then goto Rud3
	;  if Rudak>3 then goto Rud2

	asm
	LDA	Rudak
	CMP	#250
	BCC	.Fuck1
	JMP	.NoRud
.Fuck1
	CMP	#12
	BCC	.Fuck2
	JMP	.Rud4
.Fuck2
	CMP	#8
	BCC	.Fuck3
	JMP	.Rud3
.Fuck3
	CMP	#4
	BCC	.Fuck4
	JMP	.Rud2
.Fuck4
end

	asm
	LDA	Rudak
	asl
	CLC
	ADC	#7
	STA	temp1
end

	pfvline 20 5 temp1 on
	goto NoRud
Rud2
	; pfvline 20 5 13 on

	asm
	LDA	r058
	AND	#%00000111
	ORA	#%00001000
	STA	w058

	LDA	r062
	AND	#%00000111
	ORA	#%00001000
	STA	w062

	LDA	r066
	AND	#%00000111
	ORA	#%00001000
	STA	w066

	LDA	r070
	AND	#%00000111
	ORA	#%00001000
	STA	w070

	LDA	r074
	AND	#%00000111
	ORA	#%00001000
	STA	w074

	LDA	r078
	AND	#%00000111
	ORA	#%00001000
	STA	w078

	LDA	r082
	AND	#%00000111
	ORA	#%00001000
	STA	w082

	LDA	r086
	AND	#%00000111
	ORA	#%00001000
	STA	w086

	LDA	r090
	AND	#%00000111
	ORA	#%00001000
	STA	w090

	
end
  

	asm
	LDA	Rudak
	SEC
	SBC	#3
	asl
	CLC
	ADC	#5
	STA	temp1
end

	pfvline 18 5 temp1 on
	goto NoRud
Rud3
	 ; pfvline 18 5 13 on
	 ; pfvline 20 5 13 on
	asm
	LDA	r058
	AND	#%00000111
	ORA	#%00101000
	STA	w058

	LDA	r062
	AND	#%00000111
	ORA	#%00101000
	STA	w062

	LDA	r066
	AND	#%00000111
	ORA	#%00101000
	STA	w066

	LDA	r070
	AND	#%00000111
	ORA	#%00101000
	STA	w070

	LDA	r074
	AND	#%00000111
	ORA	#%00101000
	STA	w074

	LDA	r078
	AND	#%00000111
	ORA	#%00101000
	STA	w078

	LDA	r082
	AND	#%00000111
	ORA	#%00101000
	STA	w082

	LDA	r086
	AND	#%00000111
	ORA	#%00101000
	STA	w086

	LDA	r090
	AND	#%00000111
	ORA	#%00101000
	STA	w090

	


end

	asm
	LDA	Rudak
	SEC
	SBC	#7
	asl
	CLC
	ADC	#5
	STA	temp1
end

	pfvline 13 5 temp1 on
	goto NoRud
Rud4
	pfvline 13 5 13 on
	; pfvline 18 5 13 on
	; pfvline 20 5 13 on
	asm
	LDA	r058
	AND	#%00000111
	ORA	#%00101000
	STA	w058

	LDA	r062
	AND	#%00000111
	ORA	#%00101000
	STA	w062

	LDA	r066
	AND	#%00000111
	ORA	#%00101000
	STA	w066

	LDA	r070
	AND	#%00000111
	ORA	#%00101000
	STA	w070

	LDA	r074
	AND	#%00000111
	ORA	#%00101000
	STA	w074

	LDA	r078
	AND	#%00000111
	ORA	#%00101000
	STA	w078

	LDA	r082
	AND	#%00000111
	ORA	#%00101000
	STA	w082

	LDA	r086
	AND	#%00000111
	ORA	#%00101000
	STA	w086

	LDA	r090
	AND	#%00000111
	ORA	#%00101000
	STA	w090

	


end

	asm
	LDA	Rudak
	SEC
	SBC	#11
	asl
	CLC
	ADC	#5
	STA	temp1
end

	pfvline 11 5 temp1 on

NoRud
	if Performance1>$02 then temp8=0: temp9=0: var1{3}=0: goto BurnReactor
	if ReactorSpeed>0 then temp2=220-ReactorCounter: AUDV1=temp2/32: temp3=temp2/8: AUDC1=6: AUDF1=temp3+ReactorLoop else AUDV1=0
	if SlowCounter>0 then goto NoVentEither
	if var1{4} then goto Automatic
	if !switchselect || var1{6}  then SlowCounter=0: goto NOMOVEofRud
	if Temperature>100 then goto NOMOVEofRud
	if !switchrightb then goto goesUp2
	if temp8=0 then goto NOMOVEofRud else var1{4}  = 1 : var1{5}  = 1: goto Automatic 

goesUp2
	if temp8=4 then goto NOMOVEofRud else var1{4}  = 1 : var1{5}  = 0
	

Automatic
	
	temp9=temp9+1
	if !var1{5}  then  Rudak=Rudak+1 else Rudak=Rudak-1

	if temp9<4 then temp1=temp9*3: AUDV0=temp1+2: AUDF0=temp1+temp8: AUDC0=2:  goto NoVentEither	
	if !var1{5}  then  temp8=temp8+1 else temp8=temp8-1
	AUDV0=0: temp9=0: var1{4}  = 0
	Rudak=temp8*4
	Rudak=Rudak-1
	goto NoVentEither
NOMOVEofRud
	 if switchleftb then goto RiseVent	

	 if ReactorSpeed<31 then AUDV0=0: goto NoVentEither
	ReactorSpeed=ReactorSpeed-2
	goto DoTheSound
	
RiseVent
	 if ReactorSpeed>80 then AUDV0=0: goto NoVentEither
	ReactorSpeed=ReactorSpeed+2
DoTheSound	
	temp4=ReactorSpeed/8: AUDV0=15-temp4: AUDC0=8: temp4=ReactorSpeed/4: AUDF0=31-temp4

NoVentEither		

	if SlowCounter>3 then goto NoPower
	temp1=Performance3: temp2=Performance2
	temp4=rand&7
	if switchbw && Performance1=0 && Performance2<$60 then goto PowerDown


	if Rudak>15 then goto Larger15
	if Performance1>$00 then goto PowerDown
	if Performance2>$15 && Rudak=15 then goto PowerDown
	if Performance2>$42 && Rudak>10 then goto PowerDown
	if Performance2>$87 && Rudak>6 then goto PowerDown
Larger15
	if Performance1>$00 && Performance2>$34 && Rudak<250 then goto PowerDown

	temp5=Temperature/8
	if temp5>9 then temp5=9
	dec Performance3=Performance3+temp4
	dec Performance3=Performance3+temp5
	if Performance3<temp1 then dec Performance2=Performance2+$01
	if Performance2<temp2 then dec Performance1=Performance1+$01



	goto NoPower
PowerDown
	if Performance3<$32 && Performance2=$00 && Performance1=$00 then dec Performance3=Performance3+temp4: goto NoPower 



DotheDown
	dec Performance3=Performance3-temp4
	if Performance3>temp1 then dec Performance2=Performance2-$01
	if Performance2>temp2 then dec Performance1=Performance1-$01

NoPower


	if ReactorCounter<200 then  ReactorCounter=ReactorCounter+ReactorSpeed: goto HECC
	ReactorCounter=0
	if ReactorLoop<2 then ReactorLoop=ReactorLoop+1 else ReactorLoop=0 
	gosub Redness bank8
	goto ReturnHere
HECC

	temp4=0
	temp5=rand&7

	temp2=10-WaterL
	temp5=temp5+temp2
	if temp5>15 then temp5=15


	temp3=Performance1
TempSetLoop1
	if temp3=0 then goto SetLoop1Done
	temp3=temp3-1
	temp4=temp4+50
	goto TempSetLoop1
SetLoop1Done

	temp3=Performance2
TempSetLoop2
	if temp3<100 then goto SetLoop2Done
	temp3=temp3-10
	temp4=temp4+2
	goto TempSetLoop2
SetLoop2Done
	temp2=10-WaterL
	temp2=temp2*4
	temp6=temp4+temp2
	if temp6<temp4 then temp4=255 else temp4=temp6
	if Temperature>temp4 then goto TempDown

	temp3=Temperature+temp5
	if Temperature>temp3 then goto TemperatureSet
	Temperature=temp3: goto TemperatureSet 

TempDown
 	if Temperature>temp5 then Temperature=Temperature-temp5 else Temperature=0

TemperatureSet


SetWaterL
	if SlowCounter>0 then goto WaterLDone
 	temp4=Temperature/32
	temp5=ReactorSpeed/16
	temp6=temp4+temp5
	if temp6>10 then WaterL=0: goto WaterLDone
	temp6=10-temp6


	if WaterL<temp6 then WaterL=WaterL+1
	if WaterL>temp6 then WaterL=WaterL-1

	goto WaterLDone
	if WaterL>100 then WaterL=0: goto WaterLDone
	if WaterL>10 then WaterL=10
WaterLDone
	if Temperature<100 then goto SirenDone
	temp5=SlowCounter*2
	AUDV0=12-temp5: AUDC0=15: AUDF0=12-temp5


SirenDone

	temp4=ReactorSpeed+Temperature
	if temp4<Temperature then temp4=255
	temp5=temp4/64
	temp5=temp5+1
	temp6=WaterL*5
	temp6=66-temp6
	temp3=rand

	if bally<90 then goto balldone
	if temp3>Temperature || Temperature<20  then goto noball
	CTRLPF=$05
	ballheight=1
	ballx=(rand&63)+50
	if ballx<60 then ballx=60
	if ballx>102 then ballx=102


	bally=88
balldone

	bally=bally-temp5
	if bally<temp6 || bally>160 then bally=160
noball 
	if missile1y<90 then goto missile1done
	if temp3>ReactorSpeed || Temperature<40 then goto nomissile1
	NUSIZ1=$00
	missile1height=1
	missile1x=(rand&63)+50
	if missile1x<60 then missile1x=60
	if missile1x>102 then missile1x=102


	missile1y=88
missile1done

	missile1y=missile1y-temp5
	if missile1y<temp6 || missile1y>160 then missile1y=160
nomissile1
	if player1y<90 then goto spritedone
	if temp3>ReactorSpeed ||  Temperature<60 then goto nosprite
	NUSIZ1=$00

	player1x=(rand&63)+50
	if player1x<60 then player1x=60
	if player1x>94 then player1x=94


	player1y=88
spritedone

	player1y=player1y-temp5
	temp6=temp6+7
	if player1y<temp6 || player1y>160 then player1y=160

	
	if SlowCounter>1 then goto Bubbles2
 	player1:
 	%00000000
 	%00000000
 	%00000010
 	%00000000
 	%00110000
 	%01001000
 	%01001000
 	%00110000
end
	goto nosprite
Bubbles2
	if SlowCounter>4 then goto Bubbles3
 	player1:
 	%00000000
 	%00000010
 	%00000101
 	%00000010
 	%00000000
 	%00100000
 	%01010000
 	%00100000
end
	goto nosprite
Bubbles3
 	player1:
 	%00000000
 	%00000110
 	%00001001
 	%00001001
 	%00000110
 	%00000000
 	%00100000
 	%00000000
end

nosprite


ParticlesDone
	var1{2} = !var1{2}
	if !var1{2}  then  player0x=40 else player0x=114: REFP0=8 
	player0y=62

	if SlowCounter<6 then SlowCounter=SlowCounter+1 else SlowCounter=0
	


noslowdown

	asm
	sta	temp7
	lda	#(((>(.ReturnHere-1)) & $0F) | $b0)
  	pha
  	lda	#<(.ReturnHere-1)
  	pha
end
 	on WaterL goto WL0 WL1 WL2 WL3 WL4 WL5 WL6 WL7 WL8 WL9 WL10
	asm
.WL0
	lda	#>(.Level0-1)
  	pha
  	lda	#<(.Level0-1)
 	pha
	JMP	.GotoShit
.WL1

	lda	#>(.Level1-1)
  	pha
  	lda	#<(.Level1-1)
 	pha
	JMP	.GotoShit
.WL2

	lda	#>(.Level2-1)
  	pha
  	lda	#<(.Level2-1)
 	pha
	JMP	.GotoShit
.WL3

	lda	#>(.Level3-1)
  	pha
  	lda	#<(.Level3-1)
 	pha
	JMP	.GotoShit
.WL4
	LDA	WaterL
  	CMP	#4
  	BNE	.WL5
	lda	#>(.Level4-1)
  	pha
  	lda	#<(.Level4-1)
 	pha
	JMP	.GotoShit
.WL5

	lda	#>(.Level5-1)
  	pha
  	lda	#<(.Level5-1)
 	pha
	JMP	.GotoShit
.WL6

	lda	#>(.Level6-1)
  	pha
  	lda	#<(.Level6-1)
 	pha
	JMP	.GotoShit
.WL7

	lda	#>(.Level7-1)
  	pha
  	lda	#<(.Level7-1)
 	pha
	JMP	.GotoShit
.WL8

	lda	#>(.Level8-1)
  	pha
  	lda	#<(.Level8-1)
 	pha
	JMP	.GotoShit
.WL9

	lda	#>(.Level9-1)
  	pha
  	lda	#<(.Level9-1)
 	pha
	JMP	.GotoShit
.WL10	
	lda	#>(.Level10-1)
  	pha
  	lda	#<(.Level10-1)
 	pha

.GotoShit
	lda	temp7
  	pha
  	txa
  	pha
  	ldx	#8
 	jmp	BS_jsr
.ReturnHere
end
	if  switchreset && !var1{3} then var1{3}=1 : temp8=0: temp9=0: AUDV0=0: AUDV1=0: goto PreAZ5Done bank13
	scorecolor=$12

  	COLUP0=$00: COLUP1=$00
	drawscreen
	



	goto Reactor
BurnReactor
	if ReactorLoop>2 then ReactorLoop=0 else ReactorLoop=ReactorLoop+1
	if ReactorLoop=0 && Temperature>100 then gosub LetsFire bank6
	if ReactorLoop=1 then gosub Redness bank8 

	var1{2} = !var1{2}
	
	temp8=(rand&31): temp4=(rand&31): if temp4>22 then temp4=22

	AUDV1=8: AUDF1=temp8
	if var1{2} then AUDC1=6 else AUDC1=7
	asm
	DEC	AUDV0
end

	if !var1{3} && Temperature>100   then pfpixel temp8 temp9 off

	if SlowCounter>6 then SlowCounter=0 else SlowCounter=SlowCounter+1: goto OOIIOO 
	
	if  !var1{3}  then   pfhline 0 temp9 31 off else pfhline 0 temp9 31 on
	temp9=temp9+1
	AUDV0=6: AUDF0=temp9: AUDC0=2
	
	if temp9<22 then goto OOIIOO	 
	if  !var1{3}  then  var1{3}=1: temp9=0 else goto GameOver bank14
OOIIOO
	drawscreen

	goto BurnReactor
	bank 13
PreAZ5Done
	playfield:
 	XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 	................................
 	XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 	........XXX.X.X..X.X.XXX........
 	XX.XXXX.XXXXXXXXXXXXXXXX.XXXX.XX
 	X...XX...X............X...XX...X
 	X...XX....................XX...X
 		X.X....X.X............X.X....X.X
 	X.X.XXXXXX............XXXXXX.X.X
 	X.X..........................X.X
 	X.XXXXXXXX............XXXXXXXX.X
 	X..XXX.X.X............X.X.XXX..X
 	XX.XXX.X.X............X.X.XXX.XX
 	XXXXXX.X.X............X.X.XXXXXX
 	X...XX.X.X............X.X.XX...X
 	XXXXXX.XXX............XXX.XXXXXX
 	XX.XXX.XXX............XXX.XXX.XX
 	XX.XXX.XXX............XXX.XXX.XX
 	XX.XX....X............X....XX.XX
 	XX.XX....X............X....XX.XX
 	XX.XX......................XX.XX
 	XX.XXXXXXX............XXXXXXX.XX
 	XX.XXXXXXXXXXXXXXXXXXXXXXXXXX.XX
end
SetRudak2	


	asm
	LDA	Rudak
	CMP	#250
	BCC	.Fuck12
	JMP	.NoRud2
.Fuck12
	CMP	#12
	BCC	.Fuck22
	JMP	.Rud42
.Fuck22
	CMP	#8
	BCC	.Fuck32
	JMP	.Rud32
.Fuck32
	CMP	#4
	BCC	.Fuck42
	JMP	.Rud22
.Fuck42
end

	asm
	LDA	Rudak
	asl
	CLC
	ADC	#7
	STA	temp1
end

	pfvline 20 5 temp1 on
	goto NoRud2
Rud22
	; pfvline 20 5 13 on

	asm
	LDA	r058
	AND	#%00000111
	ORA	#%00001000
	STA	w058

	LDA	r062
	AND	#%00000111
	ORA	#%00001000
	STA	w062

	LDA	r066
	AND	#%00000111
	ORA	#%00001000
	STA	w066

	LDA	r070
	AND	#%00000111
	ORA	#%00001000
	STA	w070

	LDA	r074
	AND	#%00000111
	ORA	#%00001000
	STA	w074

	LDA	r078
	AND	#%00000111
	ORA	#%00001000
	STA	w078

	LDA	r082
	AND	#%00000111
	ORA	#%00001000
	STA	w082

	LDA	r086
	AND	#%00000111
	ORA	#%00001000
	STA	w086

	LDA	r090
	AND	#%00000111
	ORA	#%00001000
	STA	w090

	
end
  

	asm
	LDA	Rudak
	SEC
	SBC	#3
	asl
	CLC
	ADC	#5
	STA	temp1
end

	pfvline 18 5 temp1 on
	goto NoRud2
Rud32
	 ; pfvline 18 5 13 on
	 ; pfvline 20 5 13 on
	asm
	LDA	r058
	AND	#%00000111
	ORA	#%00101000
	STA	w058

	LDA	r062
	AND	#%00000111
	ORA	#%00101000
	STA	w062

	LDA	r066
	AND	#%00000111
	ORA	#%00101000
	STA	w066

	LDA	r070
	AND	#%00000111
	ORA	#%00101000
	STA	w070

	LDA	r074
	AND	#%00000111
	ORA	#%00101000
	STA	w074

	LDA	r078
	AND	#%00000111
	ORA	#%00101000
	STA	w078

	LDA	r082
	AND	#%00000111
	ORA	#%00101000
	STA	w082

	LDA	r086
	AND	#%00000111
	ORA	#%00101000
	STA	w086

	LDA	r090
	AND	#%00000111
	ORA	#%00101000
	STA	w090

	


end

	asm
	LDA	Rudak
	SEC
	SBC	#7
	asl
	CLC
	ADC	#5
	STA	temp1
end

	pfvline 13 5 temp1 on
	goto NoRud2
Rud42
	pfvline 13 5 13 on
	; pfvline 18 5 13 on
	; pfvline 20 5 13 on
	asm
	LDA	r058
	AND	#%00000111
	ORA	#%00101000
	STA	w058

	LDA	r062
	AND	#%00000111
	ORA	#%00101000
	STA	w062

	LDA	r066
	AND	#%00000111
	ORA	#%00101000
	STA	w066

	LDA	r070
	AND	#%00000111
	ORA	#%00101000
	STA	w070

	LDA	r074
	AND	#%00000111
	ORA	#%00101000
	STA	w074

	LDA	r078
	AND	#%00000111
	ORA	#%00101000
	STA	w078

	LDA	r082
	AND	#%00000111
	ORA	#%00101000
	STA	w082

	LDA	r086
	AND	#%00000111
	ORA	#%00101000
	STA	w086

	LDA	r090
	AND	#%00000111
	ORA	#%00101000
	STA	w090

	


end

	asm
	LDA	Rudak
	SEC
	SBC	#11
	asl
	CLC
	ADC	#5
	STA	temp1
end

	pfvline 11 5 temp1 on
NoRud2
	player0y=160: player1y=160: missile1y=160: bally=160
	gosub Redness bank8
AZ5Done
	temp8=Temperature/8

	temp8=18-temp8
	if temp8>18 then temp8=2
	if temp8>14 then temp8=14
	if temp8<2 then temp8=2
	temp9=4
	var1{2} = !var1{2}
BackToCount
	if temp8=0 then goto EndRudDown 
	temp9=temp9+1
	temp8=temp8-1

	pfpixel 20 temp9 on
	pfpixel 18 temp9 on
	pfpixel 13 temp9 on
	pfpixel 11 temp9 on

	AUDV0=16-temp9: AUDC0=7: AUDF0=25-temp9
	AUDV1=temp9-4: AUDF1=temp9: AUDC1=15

	
	COLUP0=$00: COLUP1=$00
	drawscreen
	



	goto BackToCount

	
EndRudDown
	SlowCounter=0
	var1{2} = !var1{2}
	temp8=0: temp9=0: temp5=(rand&7)
	temp1=Performance3
	temp2=Performance2
	if temp10>8 then temp10=0 else temp10=temp10+1
	AUDC1=1: temp3=temp5+temp10
	AUDV0=0
	if Temperature>100 then goto Incrase 
	AUDV1=8-temp10: AUDF1=16-temp3

Again1
	dec Performance3=Performance3-temp5
	if Performance3>temp1 then dec Performance2=Performance2-$01
	if Performance2>temp2 then dec Performance1=Performance1-$01
	if Performance1>$90 then Performance1=$00: Performance2=00: Performance3=$00: var1{3}=1  : goto BurnReactor bank12
	if SlowCounter<3 then SlowCounter=SlowCounter+1: goto Again1

	drawscreen

	goto EndRudDown
Incrase
	AUDV1=temp10: AUDF1=temp3

Again2
	dec Performance3=Performance3+temp5
	if Performance3<temp1 then dec Performance2=Performance2+$01
	if Performance2<temp2 then dec Performance1=Performance1+$01
	if Performance1>$02 then var1{3}=0: goto BurnReactor bank12
	if SlowCounter<3 then SlowCounter=SlowCounter+1: goto Again2
	drawscreen

	goto EndRudDown

 	

 	bank 14
GameOver
	temp6=0: temp4=0: temp5=0: AUDV0=0: AUDV1=0: goto Restart_Music_2
	asm
title_eat_overscan2
	clc
	lda INTIM
	bmi title_eat_overscan2

title_do_vertical_sync2
	lda #2
	sta WSYNC ;one line with VSYNC
	sta VSYNC ;enable VSYNC
	sta WSYNC ;one line with VSYNC
	sta WSYNC ;one line with VSYNC
	lda #0
	sta WSYNC ;one line with VSYNC
	sta VSYNC ;turn off VSYNC

        ;lda #42+128
	ifnconst vblank_time
 	lda #41+128
 	else
 	lda #vblank_time+128
 	endif

	sta TIM64T
title_vblank_loop2
	lda INTIM
	bmi title_vblank_loop2
	lda #0
	sta WSYNC
	sta VBLANK
	sta ENAM0
	sta ENAM1
	sta ENABL
	sta 	COLUBK
 	sta 	COLUPF
	sta 	COLUP0
	STA	COLUP1
	STA	GRP0
	STA	GRP1

	LDA	#1
	sta	VDELP0
	STA	VDELP1

	lda 	#230
        	sta 	TIM64T
	ldy	#41
WaitABit		
	sta 	WSYNC  
	dey			; 2
	bpl 	WaitABit		; 2 (4)

	sleep	32		; 34 (38)
	sta 	RESP0		; 3 (41)
	sta 	RESP1		; 3 (44)
	lda	#$c0		; 2 (46)
	sta 	HMP0		; 3 (49)
	lda	#$d0		; 2 (51)
	sta 	HMP1		; 3 (54)
	LDA	#$03		; 2 (56)
	STA 	NUSIZ0		; 3 (59)
	STA	NUSIZ1		; 3 (62)
	ldy	#43		; 2 (64)
	Lda 	#0		; 2 (66)
	sleep 	10
	sta 	HMOVE
	LDA 	SkullColors,Y
	adc	temp6
	Sta 	COLUP0
	
	
	Sta 	COLUP1
DrawSkull
Logoloop 
	Sta WSYNC 
	Sty temp1
	Lda Skull_00,y
	Sta GRP0
	Lda Skull_01,y
	Sta GRP1
	Ldx Skull_04,y

	Lda Skull_02,y
	Sta GRP0
	Lda Skull_05,y
	Sta temp2
	Lda Skull_03,y
	Ldy temp2
	Sta GRP1
	Stx GRP0
	Sty GRP1
	Sta GRP0
	Ldy temp1
	Lda SkullColors,y
	adc temp6
	Sta COLUP0
	Sta COLUP1
	

	Sta WSYNC 
	Sty temp1
	Lda Skull_00,y
	Sta GRP0
	Lda Skull_01,y
	Sta GRP1
	Lda Skull_02,y
	Ldx Skull_04,y

	Sta GRP0
	Lda Skull_05,y
	Sta temp2
	Lda Skull_03,y
	Ldy temp2
	Sta GRP1
	Stx GRP0
	Sty GRP1
	Sta GRP0
	Ldy temp1
	Dey 

	Bpl Logoloop

	LDA	#0
	STA	GRP0
	STA	GRP1
	STA	VDELP0
	STA	VDELP1       
PFWAIT2
	lda INTIM 
        	bne PFWAIT2

OVERSCAN2
	;lda #35+128 

 	ifnconst overscan_time
 	lda #35+128
 	else
 	lda #overscan_time+128-3-1
 	endif


	sta TIM64T
	lda #%11000010
	sta WSYNC
	sta VBLANK
	sleep 34
end
BackReset
	if switchreset then AUDV0=0: AUDV1=0: c=0: var1{0}=0: scorecolor=$00 : p=0: var24=0: goto GotoGame bank5
BackToMenu
	if switchselect then AUDV0=0: AUDV1=0:  Add=$09: titlescreencolor=$04: Segment=4: REFP0=0: REFP1=0:  Selected=0: var24=0: goto ZeroMenu

BLAH
	goto Music_PlayerOver

ZeroMenu
	a=0: b=0: c=0: h=0:  j=0:k=0:l=0:m=0: o=0:p=0:t=0:y=0: BaseColor=$00
 	goto RestartMusic_1 bank1
	asm
	
.Restart_Music_2
	LDA	#1
	STA	Channel_1Duration
	LDA	#<.MusicChannel_3
	STA	Channel_1Counter
	LDA	#>.MusicChannel_3
	STA	Channel_1Counter+1
	LDA	#1
	STA	Channel_2Duration
	LDA	#<.MusicChannel_4
	STA	Channel_2Counter
	LDA	#>.MusicChannel_4
	STA	Channel_2Counter+1

.Music_PlayerOver
.LoadNext3
	DEC	Channel_1Duration
	LDA 	Channel_1Duration
	BNE	.LoadNext4
	LDX	#Channel_1Counter
	LDA	(0,x)
	INC	0,x
	BNE	*+4
	INC	1,x
	CMP	#255
	BNE	.Not255_3


	LDA	#<.MusicChannel_3
	STA	Channel_1Counter
	LDA	#>.MusicChannel_3
	STA	Channel_1Counter+1
	LDX	#Channel_1Counter
	LDA	(0,x)
	INC	0,x
	BNE	*+4
	INC	1,x
.Not255_3
	STA	AUDV0
	CMP	#0
	BEQ	.GotoDuration3
	lsr
	lsr
	lsr
	lsr
	STA	AUDC0
	LDX	#Channel_1Counter
	LDA	(0,x)
	INC	0,x
	BNE	*+4
	INC	1,x
	STA	AUDF0
.GotoDuration3
	LDX	#Channel_1Counter
	LDA	(0,x)
	INC	0,x
	BNE	*+4
	INC	1,x
	STA	Channel_1Duration
.LoadNext4
	DEC	Channel_2Duration
	LDA	Channel_2Duration
	BNE	.LoadNext5

	LDX	#Channel_2Counter
	LDA	(0,x)
	INC	0,x
	BNE	*+4
	INC	1,x
	CMP	#255
	BNE	.Not255_4

	LDA	#<.MusicChannel_4
	STA	Channel_2Counter
	LDA	#>.MusicChannel_4
	STA	Channel_2Counter+1
	LDX	#Channel_2Counter
	LDA	(0,x)
	INC	0,x
	BNE	*+4
	INC	1,x
.Not255_4
	STA	AUDV1
	STA	temp6
	CMP	#0
	BEQ	.GotoDuration4
	lsr
	lsr
	lsr
	lsr
	STA	AUDC1
	LDX	#Channel_2Counter
	LDA	(0,x)
	INC	0,x
	BNE	*+4
	INC	1,x
	STA	AUDF1
.GotoDuration4
	LDX	#Channel_2Counter
	LDA	(0,x)
	INC	0,x
	BNE	*+4
	INC	1,x
	STA	Channel_2Duration
.LoadNext5
	LDA 	temp6
	BNE	.NotNotZero
	JMP	.NotProblem
.NotNotZero
	LDA	Channel_2Duration
	cmp	#9
	bcc	.NotProblem
	lda	#9
.NotProblem	
	sta 	temp6

	JMP	title_eat_overscan2
.MusicChannel_3
	.BYTE	#%00010101
	.BYTE	#13
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#23
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#31
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#23
	.BYTE	#17
	.BYTE	#%00010101
	.BYTE	#13
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#23
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#31
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#23
	.BYTE	#17
	.BYTE	#0
	.BYTE	#1
	.BYTE	#%00010101
	.BYTE	#13
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#23
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#31
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#23
	.BYTE	#17
	.BYTE	#%00010101
	.BYTE	#13
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#23
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#31
	.BYTE	#17
	.BYTE	#0
	.BYTE	#1
	.BYTE	#%11001011
	.BYTE	#23
	.BYTE	#17
	.BYTE	#%00010101
	.BYTE	#15
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#26
	.BYTE	#17
	.BYTE	#%00010101
	.BYTE	#13
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#26
	.BYTE	#17
	.BYTE	#%00010101
	.BYTE	#15
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#26
	.BYTE	#17
	.BYTE	#0
	.BYTE	#1
	.BYTE	#%00010101
	.BYTE	#13
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#26
	.BYTE	#17
	.BYTE	#%00010101
	.BYTE	#15
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#26
	.BYTE	#17
	.BYTE	#%00010101
	.BYTE	#13
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#26
	.BYTE	#17
	.BYTE	#%00010101
	.BYTE	#15
	.BYTE	#17
	.BYTE	#%00010001
	.BYTE	#15
	.BYTE	#1
	.BYTE	#%11001011
	.BYTE	#26
	.BYTE	#17
	.BYTE	#%00010101
	.BYTE	#13
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#26
	.BYTE	#17
	.BYTE	#%00010101
	.BYTE	#13
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#23
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#31
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#23
	.BYTE	#17
	.BYTE	#0
	.BYTE	#1
	.BYTE	#%00010101
	.BYTE	#13
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#23
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#31
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#23
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#29
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#19
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#26
	.BYTE	#17
	.BYTE	#0
	.BYTE	#1
	.BYTE	#%11001011
	.BYTE	#19
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#29
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#19
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#26
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#19
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#29
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#17
	.BYTE	#17
	.BYTE	#0
	.BYTE	#1
	.BYTE	#%11001011
	.BYTE	#26
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#17
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#29
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#19
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#26
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#19
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#29
	.BYTE	#17
	.BYTE	#0
	.BYTE	#1
	.BYTE	#%11001011
	.BYTE	#19
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#26
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#19
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#29
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#19
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#26
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#19
	.BYTE	#17
	.BYTE	#0
	.BYTE	#1
	.BYTE	#%11001011
	.BYTE	#29
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#17
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#26
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#17
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#29
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#19
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#26
	.BYTE	#17
	.BYTE	#0
	.BYTE	#1
	.BYTE	#%11001011
	.BYTE	#19
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#29
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#19
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#26
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#19
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#22
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#14
	.BYTE	#17
	.BYTE	#0
	.BYTE	#1
	.BYTE	#%11001011
	.BYTE	#19
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#14
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#22
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#14
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#19
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#14
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#22
	.BYTE	#17
	.BYTE	#0
	.BYTE	#1
	.BYTE	#%11001011
	.BYTE	#14
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#19
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#14
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#22
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#14
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#19
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#14
	.BYTE	#17
	.BYTE	#0
	.BYTE	#1
	.BYTE	#%11001011
	.BYTE	#29
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#19
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#26
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#19
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#29
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#19
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#26
	.BYTE	#17
	.BYTE	#0
	.BYTE	#1
	.BYTE	#%11001011
	.BYTE	#19
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#29
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#19
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#26
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#19
	.BYTE	#17
	.BYTE	#%00010101
	.BYTE	#13
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#23
	.BYTE	#17
	.BYTE	#0
	.BYTE	#1
	.BYTE	#%11001011
	.BYTE	#31
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#23
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#29
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#19
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#26
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#19
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#31
	.BYTE	#17
	.BYTE	#0
	.BYTE	#1
	.BYTE	#%11001011
	.BYTE	#19
	.BYTE	#17
	.BYTE	#%00010101
	.BYTE	#13
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#19
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#31
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#19
	.BYTE	#17
	.BYTE	#%00010101
	.BYTE	#13
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#31
	.BYTE	#17
	.BYTE	#0
	.BYTE	#1


	.BYTE	#%00010101
	.BYTE	#13
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#23
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#31
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#23
	.BYTE	#17
	.BYTE	#%00010101
	.BYTE	#13
	.BYTE	#17
	.BYTE	#%11001011
	.BYTE	#23
	.BYTE	#17
	.byte	#0
	.byte	#1
	.BYTE	#%00010101
	.BYTE	#13
	.BYTE	#17
	.byte	#0
	.byte	#10
	.byte 	#255
.MusicChannel_4
	.BYTE	#0
	.BYTE	#171
	.BYTE	#%11001101
	.BYTE	#17
	.BYTE	#15
	.BYTE	#%11000010
	.BYTE	#17
	.BYTE	#2
	.BYTE	#%11001101
	.BYTE	#17
	.BYTE	#17
	.BYTE	#%11001101
	.BYTE	#14
	.BYTE	#15
	.BYTE	#%11000010
	.BYTE	#14
	.BYTE	#2
	.BYTE	#%11001101
	.BYTE	#14
	.BYTE	#17
	.BYTE	#%11001101
	.BYTE	#11
	.BYTE	#17
	.BYTE	#0
	.BYTE	#1
	.BYTE	#%11001101
	.BYTE	#11
	.BYTE	#17
	.BYTE	#%11001101
	.BYTE	#12
	.BYTE	#129
	.BYTE	#0
	.BYTE	#26
	.BYTE	#%11001101
	.BYTE	#19
	.BYTE	#15
	.BYTE	#%11000010
	.BYTE	#19
	.BYTE	#2
	.BYTE	#%11001101
	.BYTE	#19
	.BYTE	#15
	.BYTE	#%11000010
	.BYTE	#19
	.BYTE	#2
	.BYTE	#%11001101
	.BYTE	#19
	.BYTE	#17
	.BYTE	#%11001101
	.BYTE	#15
	.BYTE	#15
	.BYTE	#%11000010
	.BYTE	#15
	.BYTE	#2
	.BYTE	#%11001101
	.BYTE	#15
	.BYTE	#17
	.BYTE	#%11001101
	.BYTE	#12
	.BYTE	#15
	.BYTE	#%11000010
	.BYTE	#12
	.BYTE	#2
	.BYTE	#%11001101
	.BYTE	#12
	.BYTE	#17
	.BYTE	#%11001101
	.BYTE	#14
	.BYTE	#129
	.BYTE	#0
	.BYTE	#26
	.BYTE	#%11001101
	.BYTE	#14
	.BYTE	#15
	.BYTE	#%11000010
	.BYTE	#14
	.BYTE	#2
	.BYTE	#%11001101
	.BYTE	#14
	.BYTE	#15
	.BYTE	#%11000010
	.BYTE	#14
	.BYTE	#2
	.BYTE	#%11001101
	.BYTE	#14
	.BYTE	#17
	.BYTE	#%11001101
	.BYTE	#11
	.BYTE	#15
	.BYTE	#%11000010
	.BYTE	#11
	.BYTE	#2
	.BYTE	#%11001101
	.BYTE	#11
	.BYTE	#17
	.BYTE	#%01001101
	.BYTE	#29
	.BYTE	#15
	.BYTE	#%01000010
	.BYTE	#29
	.BYTE	#2
	.BYTE	#%01001101
	.BYTE	#29
	.BYTE	#17
	.BYTE	#%01001101
	.BYTE	#26
	.BYTE	#29
	.BYTE	#0
	.BYTE	#6
	.BYTE	#%01001101
	.BYTE	#26
	.BYTE	#17
	.BYTE	#%01001101
	.BYTE	#29
	.BYTE	#77
	.BYTE	#0
	.BYTE	#43
	.BYTE	#%11001101
	.BYTE	#14
	.BYTE	#15
	.BYTE	#%11000010
	.BYTE	#14
	.BYTE	#2
	.BYTE	#%11001101
	.BYTE	#14
	.BYTE	#17
	.BYTE	#%11001101
	.BYTE	#11
	.BYTE	#15
	.BYTE	#%11000010
	.BYTE	#11
	.BYTE	#2
	.BYTE	#%11001101
	.BYTE	#11
	.BYTE	#17
	.BYTE	#%01001101
	.BYTE	#29
	.BYTE	#15
	.BYTE	#%01000010
	.BYTE	#29
	.BYTE	#2
	.BYTE	#%01001101
	.BYTE	#29
	.BYTE	#17
	.BYTE	#0
	.BYTE	#1
	.BYTE	#%01001101
	.BYTE	#26
	.BYTE	#29
	.BYTE	#0
	.BYTE	#6
	.BYTE	#%01001101
	.BYTE	#26
	.BYTE	#17
	.BYTE	#%01001101
	.BYTE	#29
	.BYTE	#77
	.BYTE	#0
	.BYTE	#43
	.BYTE	#%11001101
	.BYTE	#14
	.BYTE	#15
	.BYTE	#%11000010
	.BYTE	#14
	.BYTE	#2
	.BYTE	#%11001101
	.BYTE	#14
	.BYTE	#17
	.BYTE	#%01001101
	.BYTE	#26
	.BYTE	#15
	.BYTE	#%01000010
	.BYTE	#26
	.BYTE	#2
	.BYTE	#%01001101
	.BYTE	#26
	.BYTE	#79
	.BYTE	#0
	.BYTE	#6
	.BYTE	#%01001101
	.BYTE	#26
	.BYTE	#17
	.BYTE	#%01001101
	.BYTE	#23
	.BYTE	#17
	.BYTE	#%01001101
	.BYTE	#21
	.BYTE	#17
	.BYTE	#0
	.BYTE	#1
	.BYTE	#%01001101
	.BYTE	#21
	.BYTE	#46
	.BYTE	#0
	.BYTE	#6
	.BYTE	#%01001101
	.BYTE	#23
	.BYTE	#17
	.BYTE	#%01001101
	.BYTE	#26
	.BYTE	#29
	.BYTE	#0
	.BYTE	#5
	.BYTE	#%01001101
	.BYTE	#29
	.BYTE	#114
	.BYTE	#0
	.BYTE	#6
	.BYTE	#%01001101
	.BYTE	#26
	.BYTE	#17
	.BYTE	#%01001101
	.BYTE	#29
	.BYTE	#17
	.BYTE	#%11001101
	.BYTE	#11
	.BYTE	#129
	.BYTE	#0
	.BYTE	#26
	.BYTE	#%11001101
	.BYTE	#14
	.BYTE	#15
	.BYTE	#%11000010
	.BYTE	#14
	.BYTE	#2
	.BYTE	#%11001101
	.BYTE	#14
	.BYTE	#15
	.BYTE	#%11000010
	.BYTE	#14
	.BYTE	#2
	.BYTE	#%11001101
	.BYTE	#14
	.BYTE	#17
	.BYTE	#%01001101
	.BYTE	#29
	.BYTE	#94
	.BYTE	#0
	.BYTE	#26
	.BYTE	#%11001101
	.BYTE	#15
	.BYTE	#17
	.BYTE	#%11001101
	.BYTE	#14
	.BYTE	#17
	.BYTE	#%11001101
	.BYTE	#17
	.BYTE	#111
	.byte	#255




SkullColors
	.byte	#$10
	.byte	#$10
	.byte	#$12
	.byte	#$12
	.byte	#$14
	.byte	#$16
	.byte	#$16
	.byte	#$14
	.byte	#$14
	.byte	#$12
	.byte	#$40
	.byte	#$40
	.byte	#$40
	.byte	#$42
	.byte	#$44
	.byte	#$42
	.byte	#$42
	.byte	#$42
	.byte	#$44
	.byte	#$44
	.byte	#$44
	.byte	#$44
	.byte	#$44
	.byte	#$46
	.byte	#$46
	.byte	#$46
	.byte	#$46
	.byte	#$46
	.byte	#$46
	.byte	#$46
	.byte	#$46
	.byte	#$46
	.byte	#$44
	.byte	#$44
	.byte	#$44
	.byte	#$44
	.byte	#$42
	.byte	#$42
	.byte	#$42
	.byte	#$42
	.byte	#$40
	.byte	#$40
	.byte	#$40
	.byte	#$40




Skull_00
	.BYTE #%11111010
	.BYTE #%11111011
	.BYTE #%11011011
	.BYTE #%00011011
	.BYTE #%11111011
	.BYTE #%11011011
	.BYTE #%11011001
	.BYTE #%11111001
	.BYTE #%01111001
	.BYTE #%00000000
	.BYTE #%00000000
	.BYTE #%00000000
	.BYTE #%00000000
	.BYTE #%00000000
	.BYTE #%00000001
	.BYTE #%00000011
	.BYTE #%00000110
	.BYTE #%00000101
	.BYTE #%00000111
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

      align 16


Skull_01
	.BYTE #%01011011
	.BYTE #%11111011
	.BYTE #%11111011
	.BYTE #%01111011
	.BYTE #%01111111
	.BYTE #%01111111
	.BYTE #%11111111
	.BYTE #%11111111
	.BYTE #%11011011
	.BYTE #%00000000
	.BYTE #%00011000
	.BYTE #%00110100
	.BYTE #%01101110
	.BYTE #%11011111
	.BYTE #%10111111
	.BYTE #%01111111
	.BYTE #%11111111
	.BYTE #%11111111
	.BYTE #%11111110
	.BYTE #%11111110
	.BYTE #%01111100
	.BYTE #%00111001
	.BYTE #%00000111
	.BYTE #%00001111
	.BYTE #%00000000
	.BYTE #%00001111
	.BYTE #%00011111
	.BYTE #%00011111
	.BYTE #%00011110
	.BYTE #%00011100
	.BYTE #%00011100
	.BYTE #%00011110
	.BYTE #%00011111
	.BYTE #%00011111
	.BYTE #%00011111
	.BYTE #%00001111
	.BYTE #%00001111
	.BYTE #%00000111
	.BYTE #%00000011
	.BYTE #%00000001
	.BYTE #%00000000
	.BYTE #%00000000
	.BYTE #%00000000
	.BYTE #%00000000

      align 16


Skull_02
	.BYTE #%01111000
	.BYTE #%01111100
	.BYTE #%01101100
	.BYTE #%01100000
	.BYTE #%01110000
	.BYTE #%01100000
	.BYTE #%01101100
	.BYTE #%01111100
	.BYTE #%01111000
	.BYTE #%00000000
	.BYTE #%00000111
	.BYTE #%00000000
	.BYTE #%00001111
	.BYTE #%00000111
	.BYTE #%10000100
	.BYTE #%11011111
	.BYTE #%10011111
	.BYTE #%00011111
	.BYTE #%01111001
	.BYTE #%11101111
	.BYTE #%11111001
	.BYTE #%11111111
	.BYTE #%11101111
	.BYTE #%11111001
	.BYTE #%00011111
	.BYTE #%11101111
	.BYTE #%11110011
	.BYTE #%11111000
	.BYTE #%00011111
	.BYTE #%00001111
	.BYTE #%00011111
	.BYTE #%00111111
	.BYTE #%11111111
	.BYTE #%11111111
	.BYTE #%11111111
	.BYTE #%11111111
	.BYTE #%11111111
	.BYTE #%11111111
	.BYTE #%11111111
	.BYTE #%11111111
	.BYTE #%11111111
	.BYTE #%01111111
	.BYTE #%00011111
	.BYTE #%00000011


      align 16


Skull_03
	.BYTE #%00111110
	.BYTE #%00111110
	.BYTE #%00011110
	.BYTE #%00110110
	.BYTE #%00110110
	.BYTE #%00110110
	.BYTE #%00111110
	.BYTE #%00011110
	.BYTE #%00011110
	.BYTE #%00000000
	.BYTE #%11100000
	.BYTE #%00000000
	.BYTE #%11110000
	.BYTE #%11100000
	.BYTE #%00100001
	.BYTE #%11111011
	.BYTE #%11111001
	.BYTE #%11111000
	.BYTE #%10011110
	.BYTE #%11111011
	.BYTE #%10011111
	.BYTE #%11111111
	.BYTE #%11111011
	.BYTE #%10011111
	.BYTE #%11111000
	.BYTE #%11110111
	.BYTE #%11001111
	.BYTE #%00011111
	.BYTE #%11111000
	.BYTE #%11110000
	.BYTE #%11111000
	.BYTE #%11111100
	.BYTE #%11111111
	.BYTE #%11111111
	.BYTE #%11111111
	.BYTE #%11111111
	.BYTE #%11111111
	.BYTE #%11111111
	.BYTE #%11111111
	.BYTE #%11111111
	.BYTE #%11111111
	.BYTE #%11111100
	.BYTE #%11111000
	.BYTE #%11000000


      align 16

Skull_04
	.BYTE #%01100011
	.BYTE #%01100111
	.BYTE #%01110110
	.BYTE #%11110110
	.BYTE #%11110111
	.BYTE #%11010111
	.BYTE #%11010110
	.BYTE #%11010111
	.BYTE #%11010011
	.BYTE #%00000000
	.BYTE #%00001100
	.BYTE #%00010110
	.BYTE #%00111011
	.BYTE #%11111101
	.BYTE #%11111110
	.BYTE #%11111111
	.BYTE #%11111111
	.BYTE #%11111111
	.BYTE #%01111111
	.BYTE #%00111111
	.BYTE #%10111110
	.BYTE #%10011100
	.BYTE #%11100000
	.BYTE #%11110000
	.BYTE #%00000000
	.BYTE #%11110000
	.BYTE #%11111000
	.BYTE #%11111000
	.BYTE #%01111000
	.BYTE #%00111000
	.BYTE #%00111000
	.BYTE #%01111000
	.BYTE #%11111000
	.BYTE #%11111000
	.BYTE #%11111000
	.BYTE #%11110000
	.BYTE #%11110000
	.BYTE #%11100000
	.BYTE #%11000000
	.BYTE #%10000000
	.BYTE #%00000000
	.BYTE #%00000000
	.BYTE #%00000000
	.BYTE #%00000000


      align 16


Skull_05
	.BYTE #%11011010
	.BYTE #%11011110
	.BYTE #%11011110
	.BYTE #%00011110
	.BYTE #%10011011
	.BYTE #%00011011
	.BYTE #%11011011
	.BYTE #%11011111
	.BYTE #%11011110
	.BYTE #%00000000
	.BYTE #%00000000
	.BYTE #%00000000
	.BYTE #%00000000
	.BYTE #%10000000
	.BYTE #%11000000
	.BYTE #%01100000
	.BYTE #%10100000
	.BYTE #%11100000
	.BYTE #%10000000
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

end
 	bank 15
	asm
Numbers
	.byte #%00111100	; 0
	.byte #%01100110
	.byte #%11100011
	.byte #%11010011
	.byte #%11001011
	.byte #%11000111
	.byte #%01100110
	.byte #%00111100
	.byte #%01111110	; 1
	.byte #%00011000
	.byte #%00011000
	.byte #%00011000
	.byte #%01011000
	.byte #%01111000
	.byte #%00111000
	.byte #%00111100
	.byte #%01111110	;2
	.byte #%00110000
	.byte #%00011000
	.byte #%00001100
	.byte #%00001110
	.byte #%01000110
	.byte #%01101110
	.byte #%00111100
	.byte #%00111100	; 3
	.byte #%01100110
	.byte #%01000100
	.byte #%00011110
	.byte #%00011110
	.byte #%01000100
	.byte #%01100110
	.byte #%00111100
	.byte #%00001100	; 4
	.byte #%00001100
	.byte #%11111110
	.byte #%11001100
	.byte #%01101100
	.byte #%00111100
	.byte #%00011100
	.byte #%00001100
	.byte #%00111100	; 5
	.byte #%01100010
	.byte #%01000010
	.byte #%00011110
	.byte #%00110000
	.byte #%01000000
	.byte #%01100000
	.byte #%01111110
	.byte #%00111100	; 6
	.byte #%01110110
	.byte #%01000010
	.byte #%01101110
	.byte #%01011000
	.byte #%01000010
	.byte #%01100110
	.byte #%00111100
	.byte #%00010000	; 7
	.byte #%00011000
	.byte #%00001000
	.byte #%00001000
	.byte #%00001100
	.byte #%00000110
	.byte #%01000110
	.byte #%01111110
	.byte #%00111100	; 8
	.byte #%01100010
	.byte #%01011010
	.byte #%01000110
	.byte #%00111100
	.byte #%01110010
	.byte #%01001110
	.byte #%00111100
	.byte #%00111100	; 9
	.byte #%01000010
	.byte #%00000010
	.byte #%00111110
	.byte #%01100010
	.byte #%01011010
	.byte #%01000110
	.byte #%00111100
	
Icon_Chopter
	.byte #%01111100
	.byte #%00101001
	.byte #%11111111
	.byte #%10010101
	.byte #%01011000
	.byte #%00110000
	.byte #%11111110
	.byte #%00010000
Icon_B
	 .byte #%11000011
	 .byte #%10111001
	 .byte #%00100100
	 .byte #%00100100
	 .byte #%00111000
	 .byte #%00100100
	 .byte #%10111001
	 .byte #%11000011
Soldier_Icon
 	.byte #%10011001
 	.byte #%11111111
 	.byte #%10111101
 	.byte #%00100100
 	.byte #%01111110
 	.byte #%01011010
 	.byte #%01100110
 	.byte #%00111100

Clock_Icon
 	.byte #%00111100
 	.byte #%01000010
 	.byte #%10000001
 	.byte #%10011111
 	.byte #%10010001
 	.byte #%10010001
 	.byte #%01010010
 	.byte #%00111100




Colors
	 .byte #$02
	 .byte #$04
	 .byte #$06
	 .byte #$08
	 .byte #$08
	 .byte #$06
	 .byte #$04
	 .byte #$02

end
mini
	asm

	lda	#$00
	sta 	WSYNC
	sta 	COLUBK
end
	on Selected goto MiniKernel0 MiniKernel1  MiniKernel2  RETTT2 MiniKernel1 


MiniKernel1


	asm
	LDA	var1
   	BNE	.FUUUUUUU
   	JMP 	.RETTT2
.FUUUUUUU
end
	dim temp0digit = Score2IconPointer
	dim temp1digit1 = Score5IconPointer
	dim temp1digit2 = Score6IconPointer
	ScoreColor= scorecolor

	asm
 	ldx 	#>Numbers    
 	stx 	temp0digit+1  
 	stx 	temp1digit1+1  
 	stx 	temp1digit2+1 
    
 
 	clc 

 	sta 	WSYNC  

 	lda 	Score1	
 	and 	#$0F          
 	asl               
 	asl               
 	asl               
 	adc 	<#Numbers
 	sta 	temp0digit

 	lda 	Score2 
 	and 	#$F0          
 	lsr               
 	adc 	<#Numbers
 	sta 	temp1digit1           
 	lda 	Score2	
 	and 	#$0F          
 	asl               
 	asl               
 	asl               
 	adc 	<#Numbers
 	sta 	temp1digit2 
	sta 	WSYNC


   	LDA	#<Empty
   	STA	Score3IconPointer
   	LDA	#>Empty
   	STA	Score3IconPointer+1

	LDA	Selected
	CMP	#1
	BNE	.SoldierIcons


   	LDA	#<Icon_Chopter
   	STA	Score1IconPointer
   	LDA	#>Icon_Chopter
   	STA	Score1IconPointer+1

   	LDA	#<Icon_B
   	STA	Score4IconPointer
   	LDA	#>Icon_B
   	STA	Score4IconPointer+1
	JMP	.SetColors
.SoldierIcons
   	LDA	#<Soldier_Icon
   	STA	Score1IconPointer
   	LDA	#>Soldier_Icon
   	STA	Score1IconPointer+1

   	LDA	#<Clock_Icon
   	STA	Score4IconPointer
   	LDA	#>Clock_Icon
   	STA	Score4IconPointer+1
	
	JMP 	.SetColors

end


MiniKernel2
	asm
	LDA	var1
   	BNE	.FUUUUUUU3
   	jmp	.RETTT2
.FUUUUUUU3
	LDA	var1
   	AND	#2
   	BNE	.NotSet
   	LDA	#<Flash1_2
   	STA	Score1IconPointer
   	LDA	#>Flash1_2
   	STA	Score1IconPointer+1
	jmp	.Set

.NotSet
   	LDA	#<Flash1_1
   	STA	Score1IconPointer
   	LDA	#>Flash1_1
   	STA	Score1IconPointer+1


.Set
   	LDA	#<Flash2
   	STA	Score2IconPointer
   	LDA	#>Flash2
   	STA	Score2IconPointer+1

	sta 	WSYNC
end
CreateLines
	dim BarPart1 = temp1
	dim BarPart2 = temp2
	dim BarPart3 = temp3
	dim BarPart4 = temp4
	
	asm
	LDX	#0
	LDY	#255
	lda	Score2
	lsr
	lsr
	lsr
	cmp	#3
	beq	.24to31
	cmp	#2
	beq	.16to23
	cmp	#1
	beq	.8to15
	
.0to7
	STX	temp2
	STX	temp3
	STX	temp4

	LDY	Score2
	LDA	ForBars,y
	STA	temp1

	jmp	BarsDone

.8to15
	STX	temp3
	STX	temp4
	STY	temp1

	LDA	Score2
	SEC
	SBC	#7
	TAY
	LDA	ForBars,y
	STA	temp2

	jmp	BarsDone
.16to23
	STX	temp4
	STY	temp1
	STY	temp2

	LDA	Score2
	SEC
	SBC	#15
	TAY
	LDA	ForBars,y
	STA	temp3

	jmp 	BarsDone
.24to31
	STY	temp1
	STY	temp2
	STY	temp3


	LDA	Score2
	SEC
	SBC	#23
	TAY
	LDA	ForBars,y
	STA	temp4
BarsDone





	
lightdisplay


	sta WSYNC


	LDA	#1		; 2
	sta	VDELP0		; 3 (5)
	STA	VDELP1		; 3 (8)

	
	sleep	30		; 31 (39)
	sta 	RESP0		; 3 (42)
	sta 	RESP1		; 3 (45)
	lda	#$20		; 2 (47)
	sta 	HMP0		; 3 (50)
	lda	#$30		; 2 (52)
	sta 	HMP1		; 3 (55)
	LDA	#$03		; 2 (57)
	STA 	NUSIZ0
	STA	NUSIZ1		; 6 (63)
	ldy	#7		; 2 (65)
	Lda 	#0		; 2 (67)
	STA 	GRP0		; 3 (70)
	STA 	GRP1		; 3 (73)
	STA 	WSYNC
	sta 	HMOVE

	LDA 	Colors
	adc	ScoreColor
	Sta 	COLUP0
	
	
	Sta 	COLUP1
	Sta 	WSYNC 
	; align 	256
LigtLoop
	
	Sty 	temp7			; 3
	Lda 	(Score1IconPointer),y	; 5
	Sta 	GRP0			; 3
	Lda 	(Score2IconPointer),y	; 5
	Sta 	GRP1			; 3
	Lda 	temp1			; 3
	Ldx 	temp3			; 3
	Ldy 	temp4			; 3
	sleep 	9			; 9
	Sta 	GRP0			; 3
	Lda 	temp2			; 3
	Sta 	GRP1			; 3
	Stx 	GRP0			; 3 
	Sty 	GRP1			; 3
	Sta 	GRP0			; 3
	Ldy 	temp7			; 3
	Lda 	Colors,y			; 4
	adc 	ScoreColor		; 3
	Sta 	COLUP0			; 3
	Sta 	COLUP1			; 3
	Dey 				; 2

	Bpl LigtLoop			; 3

	
	
 	ldy 	#0
	sty	VDELP1
 	sty 	GRP0
 	sty 	GRP1 
 	sty 	NUSIZ0 
 	sty 	NUSIZ1 
 	sty 	COLUP0
	sty	COLUP1
 	sta 	WSYNC  
end
RETTT3
	return otherbank
	asm
Flash1_1
	.byte #%10011000
	.byte #%01011100
	.byte #%00011011
	.byte #%11011010
	.byte #%11011011
	.byte #%00011011
	.byte #%01011100
	.byte #%10011000
Flash1_2
	.byte #%00011000
	.byte #%00011100
	.byte #%00011011
	.byte #%00011011
	.byte #%00011010
	.byte #%00011011
	.byte #%00011100
	.byte #%00011000
Flash2
	.byte #%00000000
	.byte #%00000000
	.byte #%11111100
	.byte #%11110110
	.byte #%11110110
	.byte #%11111100
	.byte #%00000000
	.byte #%00000000

ForBars
	.byte #%00000000
	.byte #%10000000
	.byte #%11000000
	.byte #%11100000
	.byte #%11110000
	.byte #%11111000
	.byte #%11111100
	.byte #%11111110
	.byte #%11111111

end 
BLANK
	asm

	LDA	var24
   	BNE	.FUUUUUUU2
.UIOP
   	jmp	.RETTT2
.FUUUUUUU2
	AND	#8
	BNE	.UIOP
	LDA	var24
	AND	#16
	BNE	.UIOP
end
 	;  if Selected=0 || Selected=4 then return otherbank
	asm
	LDA	Selected
  	CMP	#0
  	BEQ	.condpart1789
  	CMP	#3
  	BEQ	.condpart1789
	CMP	#4
  	BNE	.skip49OR6
.condpart1789
 	JMP	BS_return
.skip49OR6
end
	; if GeigerFade=0 then goto  NOBEEP
	; GeigerFade=GeigerFade-1
	; temp3=(rand&1)
	; if temp3=1 then AUDC1=15 else AUDC1=8
	; AUDF1=8-GeigerFade: AUDV1=8
	; if GeigerFade=0 then AUDV1=0
	asm
	LDA	GeigerFade
  	CMP	#0
  	BEQ	.NOBEEP
  	SEC
	SBC	#1
	STA	GeigerFade
	CMP	#0
	BNE 	.ContinueGeiger
	STA 	AUDV1
	JMP 	.NoMoreGeiger
.ContinueGeiger
	 lda	rand
  	lsr
  	bcc	*+4
  	eor	#$B4
 	sta	rand
  	AND	#1
  	CMP	#1
  	BNE	.skipL0423_222
	LDY	#15
	LDA 	#8
	JMP	.OOO
.skipL0423_222
	LDY	#8
	TYA
.OOO
	STY	AUDC1
	STA 	AUDV1
	SEC
	SBC 	GeigerFade
	STA 	AUDF1
	
end
	goto NoMoreGeiger
NOBEEP

	;  if Selected=1 then goto GeigerLevel2
	asm
	LDA	Selected
	
  	CMP	#1
  	BEQ	.GeigerLevel2
  	CMP	#2
  	BEQ	.GeigerLevel3
end

	goto NoMoreGeiger


GeigerLevel2
	; temp4=Chopter_X-25-Level-Level: if temp4>Chopter_X then temp4=0

	asm
	LDA 	Chopter_X
	SEC
	SBC	#25
	SEC
	SBC 	Level
	SEC
	SBC 	Level
	CMP	Chopter_X
	BCC 	.NoZero
	LDA	#0
.NoZero
end
CountGeiger
	GeigerCount=GeigerCount+1
	; if GeigerCount<temp4 then goto NoMoreGeiger

	asm
 	CMP	GeigerCount
  	BCS	.NoMoreGeiger
end
	GeigerFade=8: GeigerCount=0
	goto NoMoreGeiger
GeigerLevel3
	temp1=r008+4: temp2=RadCentX+2
	if temp1>temp2 then temp3=temp1-temp2 else temp3=temp2-temp1
	temp1=r009-6: temp2=RadCentY-2
	if temp1>temp2 then temp5=temp1-temp2 else temp5=temp2-temp1


	temp4=temp3+temp5: temp4=temp4/2
	if GeigerCount<temp4 then GeigerCount=GeigerCount+1 else GeigerCount=0: GeigerFade=8
	w011=temp4
	goto NoMoreGeiger

NoMoreGeiger
	; if switchleftb then DroneWait=0: return otherbank

	asm
	bit	SWCHB
  	BVC	.NoDrone
	BIT	var1
  	BPL	.Drone
.NoDrone
  	LDA	#0
  	STA	DroneWait
  	JMP	BS_return
end
Drone
	if DroneWait>0 then DroneWait=DroneWait-1: return otherbank
	
NoWait
	; temp3=rand: temp4=(rand&1) 
	; if temp3<230 then NoFrekvChange
	; if temp4=0 then AUDC1=2
	; if temp4=1 then AUDC1=6

	asm
	lda	rand
  	lsr
  	bcc	*+4
  	eor	#$B4
	tay
	lsr
   	bcc	*+4
  	eor	#$B4
	sta 	rand
  	AND	#1
 	CPY	#230
  	bcc	.NoFrekvChange
	CMP	#0
  	BNE	.skipL0416_11
	LDA	#2
	JMP	.KKK
.skipL0416_11
	LDA	#6
.KKK
	STA	AUDC1
end
NoFrekvChange

	; temp5=rand
	;  if temp5<180 then return otherbank
	;  if temp5<220 && DroneFrekv<20 then DroneFrekv=DroneFrekv+1
	;  if temp5>219 && DroneFrekv>0 then DroneFrekv=DroneFrekv-1

	asm
	lda	rand
  	lsr
  	bcc	*+4
  	eor	#$B4
	tay
	lsr
   	bcc	*+4
  	eor	#$B4

	CMP	#180
	BCS	.skipL0418_777
  	JMP	BS_return
.skipL0418_777
	CMP	#220
  	BCS	.skipL0419_888
	LDA	DroneFrekv
  	CMP	#20
  	BCS	.XXX
  	INC	DroneFrekv
	JMP	.XXX
.skipL0419_888
	CMP	#0
	BEQ	.XXX
	DEC	DroneFrekv
.XXX
end
	; temp3=DroneFrekv/2
	; AUDV1=temp3: AUDF1=DroneFrekv
	asm
	lda	 DroneFrekv
	sta 	AUDF1
	lsr
	sta 	AUDV1
end
	DroneWait=(rand&31)+30


RETTT2	
	return otherbank


MiniKernel0


ZZUU
	asm
	LDA	var1
   	BEQ	.RETTT2
end 

	if var1{2} then SelectedOnly
	asm
	LDA	#0
	STA 	ScoreColor

   	LDA	#<Lock
   	STA	Score1IconPointer
   	LDA	#>Lock
   	STA	Score1IconPointer+1

   	LDA	#<Term
   	STA	Score2IconPointer
   	LDA	#>Term
   	STA	Score2IconPointer+1

   	LDA	#<Vent
   	STA	Score3IconPointer
   	LDA	#>Vent
   	STA	Score3IconPointer+1

   	LDA	#<UP
   	STA	Score4IconPointer
   	LDA	#>UP
   	STA	Score4IconPointer+1


   	LDA	#<DOWN
   	STA	Score5IconPointer
   	LDA	#>DOWN
   	STA	Score5IconPointer+1

   	LDA	#<AZ5
   	STA	Score6IconPointer
   	LDA	#>AZ5
   	STA	Score6IconPointer+1

   	LDA	#<Colors
   	STA	ColorPointer
   	LDA	#>Colors
   	STA	ColorPointer+1
end
	goto SelectDone
SelectedOnly
	asm
	LDA	#$34
	STA 	ScoreColor
end
	if switchbw then goto NoLock 

	asm
  	LDA	#<Lock
   	STA	Score1IconPointer
   	LDA	#>Lock
   	STA	Score1IconPointer+1
end
	goto Term2
NoLock
	asm
  	LDA	#<Empty
   	STA	Score1IconPointer
   	LDA	#>Empty
   	STA	Score1IconPointer+1
end

Term2
	if Temperature<100 then  goto NoTerm
	asm
   	LDA	#<Term
   	STA	Score2IconPointer
   	LDA	#>Term
   	STA	Score2IconPointer+1
end





	goto Vent2
NoTerm
	asm
  	LDA	#<Empty
   	STA	Score2IconPointer
   	LDA	#>Empty
   	STA	Score2IconPointer+1
end
Vent2
	if switchleftb then goto NoVent
	asm
   	LDA	#<Vent
   	STA	Score3IconPointer
   	LDA	#>Vent
   	STA	Score3IconPointer+1
end
	goto Up2
NoVent
	asm
  	LDA	#<Empty
   	STA	Score3IconPointer
   	LDA	#>Empty
   	STA	Score3IconPointer+1
end

Up2
	if switchrightb then goto Down2
	asm
   	LDA	#<UP
   	STA	Score4IconPointer
   	LDA	#>UP
   	STA	Score4IconPointer+1

  	LDA	#<Empty
   	STA	Score4IconPointer
   	LDA	#>Empty
   	STA	Score4IconPointer+1
end
	goto AZ52
Down2
	asm
   	LDA	#<DOWN
   	STA	Score5IconPointer
   	LDA	#>DOWN
   	STA	Score5IconPointer+1

  	LDA	#<Empty
   	STA	Score5IconPointer
   	LDA	#>Empty
   	STA	Score5IconPointer+1
end
AZ52
	if !var1{3} then goto NoAZ5
	asm
   	LDA	#<AZ5
   	STA	Score6IconPointer
   	LDA	#>AZ5
   	STA	Score6IconPointer+1
end
	goto SetColors
NoAZ5
	asm
  	LDA	#<Empty
   	STA	Score6IconPointer
   	LDA	#>Empty
   	STA	Score6IconPointer+1
end

SetColors
	asm
   	LDA	#<Colors
   	STA	ColorPointer
   	LDA	#>Colors
   	STA	ColorPointer+1
end	





SelectDone
	asm
 	
 	ldy 	#7		; size of sprites
	lda 	#3
	sta 	NUSIZ0	
	sta 	NUSIZ1	
	ldx 	#0
	stx 	GRP0
	stx 	GRP1
	clc

	lda 	#0
	sta 	COLUBK	; set background color
	sta 	COLUPF		
	lda 	#%11111111
	sta 	PF1
	lda 	#%00000001
	sta 	PF2
	lda 	#1
	sta 	CTRLPF		; what is this??

	tsx
	stx 	temp3 		; save the stack pointer


	sta 	WSYNC		; newline
	lda 	#$20		
	sta 	HMP0
	lda 	#$30	
	sta 	HMP1
	lda 	#$d0
	sta 	HMBL
	lda 	#$20
	sta 	HMM0

	sta 	WSYNC
	sleep 	38
	sta 	RESP0
	sta 	RESP1
	sta 	WSYNC
	sleep 	30
	sta 	RESM0
	sleep 	6
	sta 	RESBL
	sta 	WSYNC

	sta 	HMOVE 		; 3

	lda 	#3		; 2
	sta 	VDELP0		; 3
	sta 	VDELP1		; 3


	lda 	#5		; 2
	sta 	CTRLPF		; 3
	lda 	#0		; 2
	sta 	VDELBL		; 3

	;enough cycles have passed for the HMOV, so we can clear HMCLR
	sta HMCLR
	sta WSYNC

	sleep 	38

	lda 	(ColorPointer),y 	; 5
	adc 	ScoreColor	; 3
	sta 	COLUP0		; 3
	sta 	COLUP1		; 3
	

	lda #2
	sta ENABL
	sta ENAM0

	sleep 	6
	jmp 	DisplayThings
	align 	256
	
DisplayThings

	lda 	(Score1IconPointer),y 	;5
	sta 	GRP0			;3

	;fix the lost bit0 in the first character
	rol 				;2
	eor 	#2			;2
	sta 	ENABL 			;3

	lda 	(Score2IconPointer),y 	;5
	sta 	GRP1			; 3

	lax 	(Score6IconPointer),y	; 5
	txs				; 2	
	lax 	(Score5IconPointer),y	; 5

	lda 	(Score3IconPointer),y	; 5
	sta 	GRP0
	lda 	(Score4IconPointer),y	; 5
	sta 	GRP1

	stx 	GRP0
	tsx
	stx 	GRP1
	sty 	GRP0

	sleep 	6	
	

SecondLine

	lda 	(Score1IconPointer),y 	;5
	sta 	GRP0			;3

	lda 	(ColorPointer),y 		;5
	adc 	ScoreColor
	sta 	COLUP0
	sta 	COLUP1+256

	lda 	(Score2IconPointer),y 	;5
	sta 	GRP1			; 3

	lax 	(Score6IconPointer),y	; 5
	txs				; 2	
	lax 	(Score5IconPointer),y	; 5

	lda 	(Score3IconPointer),y	; 5
	sta 	GRP0
	lda 	(Score4IconPointer),y	; 5
	sta 	GRP1
	stx 	GRP0
	tsx
	stx 	GRP1
	sty 	GRP0

	sleep 	9

	dey
	
	bpl  	DisplayThings

	lda #0
	sta 	COLUBK
	sta GRP0
	sta GRP1
	sta ENABL
	sta ENAM0
	sta VDELP0
	sta VDELP1
	sta PF0
	sta PF1
	sta PF2
	sta WSYNC
	ldx temp3
	txs
 	sta 	WSYNC  
end


	return otherbank
	asm
Lock
	.byte	#%00111100
	.byte	#%01000010
	.byte	#%10000001
	.byte	#%10000001
	.byte	#%10011001
	.byte	#%01011010
	.byte	#%00011000
	.byte	#%00011000

Term
	.byte	#%01000000
	.byte	#%10100011
	.byte	#%01000100
	.byte	#%11100100
	.byte	#%11100100
	.byte	#%10101011
	.byte	#%10100000
	.byte	#%01000000

Vent
	.byte	#%00000100
	.byte	#%00001100
	.byte	#%11111100
	.byte	#%01100100
	.byte	#%00100110
	.byte	#%00111111
	.byte	#%00110000
	.byte	#%00100000

DOWN
	.byte	#%00111100
	.byte	#%01000010
	.byte	#%10011001
	.byte	#%00111100
	.byte	#%01111110
	.byte	#%00011000
	.byte	#%00011000
	.byte	#%00011000

UP
	.byte	#%00111100
	.byte	#%01000010
	.byte	#%10011001
	.byte	#%00011000
	.byte	#%00011000
	.byte	#%01111110
	.byte	#%00111100
	.byte	#%00011000

AZ5
	.byte	#%00000110
	.byte	#%00000001
	.byte	#%01110111
	.byte	#%00000100
	.byte	#%10111111
	.byte	#%11101000
	.byte	#%10100100
	.byte	#%01011100

Empty
	.byte	#%00000000
	.byte	#%00000000
	.byte	#%00000000
	.byte	#%00000000
	.byte	#%00000000
	.byte	#%00000000
	.byte	#%00000000
	.byte	#%00000000
end


	bank 16
	asm
ScoreColors
	.byte #$02
	.byte #$04
	.byte #$06
	.byte #$08
	.byte #$08
	.byte #$06
	.byte #$04
	.byte #$02
end
	vblank
	goto BLANK bank15

	asm
minikernel
end
	goto mini bank15

