	includesfile multisprite_bankswitch.inc
	set kernel multisprite
	set romsize 32k
	set smartbranching on
	set tv ntsc
	set optimization speed
	set optimization inlinerand
	const noscore=1
 	pfheight=3
 	const playerscores = 4

	asm
	lda #0
	sta player0score
	sta player1score
	sta player2score
	sta player3score
	sta AUDV0
	sta AUDV1
 	sta $1F 
 	sta ENABL 
	sta $1E
	sta ENAM1
end



	scorecolor=$00
	dim duration=c
	dim titlescreencolor=d
	dim bmp_48x1_1_color=f
	dim space=g
	dim back=h
	duration=1
	space=1
	dim Life1=player0score
	dim Life2=player1score
	dim Kills1=player2score
	dim Kills2=player3score
	dim MaxKill=j
	dim MaxLife=i
	MaxKill=$50
	MaxLife=$30	
	dim Selection=k

	dim HouseHeight=z
	dim SoundCounter=f
	dim ShitCounter=g

	dim Reaper1_X = d
	dim Reaper1_Y= f
	dim Reaper2_X= g
	dim Reaper2_Y= h
	dim Shoot1_X= k
 	dim Shoot1_Y= l
	dim Shoot2_X= m
 	dim Shoot2_Y= n
	dim Player1Counter_1=v
	dim Player2Counter_1=p
	dim Player1Counter_Jump=q
	dim Player2Counter_Jump=r
	dim Player1Counter_Sprite=t
	dim Player2Counter_Sprite=u
	dim Enemy_Sprite_Counter=x
	dim PowerUp_Counter=y
	dim PowerUp_Type=missile1x
	dim Dash_Delay=scorecolor


	dim ThunderCount=f
	dim StormPower=g
	dim Delay=h
	dim ColorForText=d
	dim AddToColor=e
	dim HowWhite=k
	goto MusicSetup1
test
	e{0}=!e{0}
	w{0}=0
	if e{0} then e{3}=!e{3}
	if !e{2} && e{3} then space=space+1
	if e{2} && e{3} then space=space-1
	if space=0 then space=1
	if space> 6 then space=6
	if space=1 then e{2}=0
	if space=6 then e{2}=1

	if e{0} && !e{7} && titlescreencolor>0 then titlescreencolor=titlescreencolor-$02
	if e{7} then e{7}=0
	if joy0fire || joy1fire then Selection=0: e{6}=1: e{4} = 1: back=$08
	gosub titledrawscreen bank2

Calculate_Duration
	duration=duration-1
	if duration =0 then goto DoMusic
	if e{4} then goto Main_Menu else goto test
DoMusic
	titlescreencolor=$0e: back=$08: e{7}=1
	e{5}=!e{5}
	if e{0} && !e{1} then bmp_48x1_1_color=bmp_48x1_1_color+$02
	if e{0} && e{1} then bmp_48x1_1_color=bmp_48x1_1_color-$02
	if bmp_48x1_1_color=$0e && !e{1} then e{1} = 1
	if bmp_48x1_1_color=$00 && e{1} then e{1} = 0

	temp4=sread(Title_Music)
	if temp4=255 then duration=1: goto MusicSetup1
	if temp4=0 then AUDV0=0: AUDF0=0: goto Channel1
	AUDV0=temp4: if temp4=8 || temp4=2 then AUDC0=1 else AUDC0=7

	AUDF0=sread(Title_Music)
Channel1
	temp5=sread(Title_Music)
	if temp5=0 then AUDV1=0: AUDF1=0: goto ChannelNO
	AUDV1=temp5
	if temp5=8 || temp5=2 then AUDC1=1 else AUDC1=7


	AUDF1=sread(Title_Music)
ChannelNO
	duration=sread(Title_Music)
	if e{4} then goto Main_Menu else goto test


MusicSetup1
	sdata Title_Music = a
	7,24
	0
	12
	8,10
	7,24
	12
	8,16
	6,24
	12
	5,24
	0
	12
	8,11
	4,24
	12

	8,16
	0
	12
	3,24
	0
	12
	2,24
	0
	12

	7,24
	0
	12
	8,10
	7,24
	12
	8,16
	6,24
	12
	5,24
	0
	12
	8,11
	4,24
	12

	8,16
	0
	12
	3,24
	0
	12
	2,24
	0
	12

	7,24
	0
	12
	8,10
	7,24
	12
	8,16
	6,24
	12
	5,24
	0
	12
	8,11
	4,24
	12

	8,16
	0
	12
	3,24
	0
	12
	2,24
	0
	12

	7,24
	0
	12
	8,10
	7,24
	12
	8,16
	6,24
	12
	5,24
	0
	12

	8,20
	7,20
	8
	2,20
	1,20
	4
	8,20
	7,20
	8
	2,20
	1,20
	4
	8,22
	7,21
	12


	7,24
	0
	8
	1,24
	0
	4
	7,24
	0
	8
	1,24
	0
	4
	7,24
	8,10
	8
	1,24
	8,10
	4
	7,24
	8,16
	8
	1,24
	8,16
	4
	7,24
	0
	8
	1,24
	0
	4
	7,24
	8,11
	8
	1,24
	8,11
	4
	7,24
	8,16
	8
	1,24
	8,16
	4
	7,24
	0
	8
	1,24
	0
	4
	7,24
	0
	8
	1,24
	0
	4
	7,24
	8,10
	8
	1,24
	8,10
	4
	7,24
	8,16
	8
	1,24
	8,16
	4
	7,24
	0
	8
	1,24
	0
	4
	7,22
	8,11
	8
	1,22
	8,11
	4

	8,16
	0
	12
	8,24
	0
	12

	8,20
	7,20
	8
	2,20
	1,20
	4
	8,20
	7,20
	8
	2,20
	1,20
	4
	8,22
	7,21
	12


	7,24
	0
	8
	1,24
	0
	4
	7,24
	0
	8
	1,24
	0
	4
	7,24
	8,10
	8
	1,24
	8,10
	4
	7,24
	8,16
	8
	1,24
	8,16
	4
	7,24
	0
	8
	1,24
	0
	4
	7,24
	8,11
	8
	1,24
	8,11
	4
	7,24
	8,16
	8
	1,24
	8,16
	4
	7,24
	0
	8
	1,24
	0
	4
	7,24
	0
	8
	1,24
	0
	4
	7,24
	8,10
	8
	1,24
	8,10
	4
	7,24
	8,16
	8
	1,24
	8,16
	4
	7,24
	0
	8
	1,24
	0
	4
	7,22
	8,11
	8
	1,22
	8,11
	4

	8,16
	0
	12
	8,24
	0
	12

	8,20
	7,20
	8
	2,20
	1,20
	4
	8,20
	7,20
	8
	2,20
	1,20
	4
	8,22
	7,21
	12


	7,24
	0
	8
	1,24
	0
	4
	7,24
	0
	8
	1,24
	0
	4
	7,24
	8,10
	8
	1,24
	8,10
	4
	7,24
	8,16
	8
	1,24
	8,16
	4
	7,24
	0
	8
	1,24
	0
	4
	7,24
	8,11
	8
	1,24
	8,11
	4
	7,24
	8,16
	8
	1,24
	8,16
	4
	7,24
	0
	8
	1,24
	0
	4
	7,24
	0
	8
	1,24
	0
	4
	7,24
	8,10
	8
	1,24
	8,10
	4
	7,24
	8,16
	8
	1,24
	8,16
	4
	7,24
	0
	8
	1,24
	0
	4
	7,22
	8,11
	8
	1,22
	8,11
	4

	8,16
	0
	12
	8,24
	0
	12


	8,20
	7,20
	8
	2,20
	1,20
	4
	8,20
	7,20
	8
	2,20
	1,20
	4
	8,22
	7,21
	12


	7,24
	0
	8
	1,24
	0
	4
	7,24
	0
	8
	1,24
	0
	4
	7,24
	8,10
	8
	1,24
	8,10
	4
	7,24
	8,16
	8
	1,24
	8,16
	4
	7,24
	0
	8
	1,24
	0
	4
	7,24
	8,11
	8
	1,24
	8,11
	4
	7,24
	8,16
	8
	1,24
	8,16
	4
	7,24
	0
	8
	1,24
	0
	4
	7,24
	0
	8
	1,24
	0
	4
	7,24
	8,10
	8
	1,24
	8,10
	4
	7,24
	8,16
	8
	1,24
	8,16
	4
	7,24
	0
	8
	1,24
	0
	4


	8,18
	7,20
	8
	2,18
	1,20
	4
	8,18
	7,20
	8
	2,18
	1,20
	4
	8,19
	7,19
	12






	7,12
	0
	24
	8,12
	6,12
	24
	8,10
	5,12
	24
	8,13
	4,12
	24
	8,12
	3,12
	24
	8,17
	2,12
	24
	8,22
	1,12
	24

	8,13
	0
	24

	7,12
	0
	24
	8,12
	7,12
	24
	8,10
	6,12
	24
	8,13
	5,12
	24
	8,12
	4,12
	24
	8,17
	3,12
	24
	8,16
	2,12
	24
	8,13
	7,13
	24


	7,12
	0
	24
	8,11
	7,12
	24
	8,10
	6,12
	24
	8,12
	5,12
	24
	8,11
	4,12
	24
	8,16
	3,12
	24
	8,15
	2,12
	24
	8,16
	7,13
	24

	7,12
	0
	24
	8,11
	7,12
	24
	8,10
	6,12
	24
	8,12
	5,12
	24
	8,11
	4,12
	24
	8,16
	3,12
	24
	8,20
	2,12
	24
	8,23
	7,13
	24


	8,11
	7,13
	24
	



	7,12
	0
	4
	1,12
	0
	2
	7,12
	0
	4
	1,12
	0
	2
	7,12
	0
	4
	1,12
	0
	2
	7,12
	0
	4
	1,12
	0
	2


	7,12
	8,12
	4
	1,12
	8,12
	2
	7,12
	8,12
	4
	1,12
	8,12
	2
	7,12
	8,12
	4
	1,12
	8,12
	2
	7,12
	8,12
	4
	1,12
	8,12
	2


	7,12
	8,10
	4
	1,12
	8,10
	2
	7,12
	8,10
	4
	1,12
	8,10
	2
	7,12
	8,10
	4
	1,12
	8,10
	2
	7,12
	8,10
	4
	1,12
	8,10
	2

	7,12
	8,13
	4
	1,12
	8,13
	2
	7,12
	8,13
	4
	1,12
	8,13
	2
	7,12
	8,13
	4
	1,12
	8,13
	2
	7,12
	8,13
	4
	1,12
	8,13
	2

	7,12
	8,12
	4
	1,12
	8,12
	2
	7,12
	8,12
	4
	1,12
	8,12
	2
	7,12
	8,12
	4
	1,12
	8,12
	2
	7,12
	8,12
	4
	1,12
	8,12
	2

	7,12
	8,17
	4
	1,12
	8,17
	2
	7,12
	8,17
	4
	1,12
	8,17
	2
	7,12
	8,17
	4
	1,12
	8,17
	2
	7,12
	8,17
	4
	1,12
	8,17
	2

	7,12
	8,22
	4
	1,12
	8,22
	2
	7,12
	8,22
	4
	1,12
	8,22
	2
	7,12
	8,22
	4
	1,12
	8,22
	2
	7,12
	8,22
	4
	1,12
	8,22
	2

	7,13
	8,28
	4
	1,13
	8,28
	2
	7,13
	8,28
	4
	1,13
	8,28
	2
	7,13
	8,28
	4
	1,13
	8,28
	2
	7,13
	8,28
	4
	1,13
	8,28
	2


	7,12
	0
	4
	1,12
	0
	2
	7,12
	0
	4
	1,12
	0
	2
	7,12
	0
	4
	1,12
	0
	2
	7,12
	0
	4
	1,12
	0
	2


	7,12
	8,12
	4
	1,12
	8,12
	2
	7,12
	8,12
	4
	1,12
	8,12
	2
	7,12
	8,12
	4
	1,12
	8,12
	2
	7,12
	8,12
	4
	1,12
	8,12
	2


	7,12
	8,10
	4
	1,12
	8,10
	2
	7,12
	8,10
	4
	1,12
	8,10
	2
	7,12
	8,10
	4
	1,12
	8,10
	2
	7,12
	8,10
	4
	1,12
	8,10
	2

	7,12
	8,13
	4
	1,12
	8,13
	2
	7,12
	8,13
	4
	1,12
	8,13
	2
	7,12
	8,13
	4
	1,12
	8,13
	2
	7,12
	8,13
	4
	1,12
	8,13
	2

	7,12
	8,12
	4
	1,12
	8,12
	2
	7,12
	8,12
	4
	1,12
	8,12
	2
	7,12
	8,12
	4
	1,12
	8,12
	2
	7,12
	8,12
	4
	1,12
	8,12
	2

	7,12
	8,17
	4
	1,12
	8,17
	2
	7,12
	8,17
	4
	1,12
	8,17
	2
	7,12
	8,17
	4
	1,12
	8,17
	2
	7,12
	8,17
	4
	1,12
	8,17
	2

	7,12
	8,16
	4
	1,12
	8,16
	2
	7,12
	8,16
	4
	1,12
	8,16
	2
	7,12
	8,16
	4
	1,12
	8,16
	2
	7,12
	8,16
	4
	1,12
	8,16
	2

	7,13
	8,13
	4
	1,13
	8,13
	2
	7,13
	8,13
	4
	1,13
	8,13
	2
	7,13
	8,13
	4
	1,13
	8,13
	2
	7,13
	8,13
	4
	1,13
	8,13
	2

	7,11
	0
	4
	1,11
	0
	2
	7,11
	0
	4
	1,11
	0
	2
	7,11
	0
	4
	1,11
	0
	2
	7,11
	0
	4
	1,11
	0
	2


	7,11
	8,11
	4
	1,11
	8,11
	2
	7,11
	8,11
	4
	1,11
	8,11
	2
	7,11
	8,11
	4
	1,11
	8,11
	2
	7,11
	8,11
	4
	1,11
	8,11
	2

	7,11
	8,10
	4
	1,11
	8,10
	2
	7,11
	8,10
	4
	1,11
	8,10
	2
	7,11
	8,10
	4
	1,11
	8,10
	2
	7,11
	8,10
	4
	1,11
	8,10
	2

	7,11
	8,12
	4
	1,11
	8,12
	2
	7,11
	8,12
	4
	1,11
	8,12
	2
	7,11
	8,12
	4
	1,11
	8,12
	2
	7,11
	8,12
	4
	1,11
	8,12
	2

	7,11
	8,11
	4
	1,11
	8,11
	2
	7,11
	8,11
	4
	1,11
	8,11
	2
	7,11
	8,11
	4
	1,11
	8,11
	2
	7,11
	8,11
	4
	1,11
	8,11
	2

	7,11
	8,16
	4
	1,11
	8,16
	2
	7,11
	8,16
	4
	1,11
	8,16
	2
	7,11
	8,16
	4
	1,11
	8,16
	2
	7,11
	8,16
	4
	1,11
	8,16
	2

	7,11
	8,15
	4
	1,11
	8,15
	2
	7,11
	8,15
	4
	1,11
	8,15
	2
	7,11
	8,15
	4
	1,11
	8,15
	2
	7,11
	8,15
	4
	1,11
	8,15
	2

	7,13
	8,16
	4
	1,13
	8,16
	2
	7,13
	8,16
	4
	1,13
	8,16
	2
	7,13
	8,16
	4
	1,13
	8,16
	2
	7,13
	8,16
	4
	1,13
	8,16
	2

	7,11
	0
	4
	1,11
	0
	2
	7,11
	0
	4
	1,11
	0
	2
	7,11
	0
	4
	1,11
	0
	2
	7,11
	0
	4
	1,11
	0
	2


	7,11
	8,11
	4
	1,11
	8,11
	2
	7,11
	8,11
	4
	1,11
	8,11
	2
	7,11
	8,11
	4
	1,11
	8,11
	2
	7,11
	8,11
	4
	1,11
	8,11
	2

	7,11
	8,10
	4
	1,11
	8,10
	2
	7,11
	8,10
	4
	1,11
	8,10
	2
	7,11
	8,10
	4
	1,11
	8,10
	2
	7,11
	8,10
	4
	1,11
	8,10
	2

	7,11
	8,12
	4
	1,11
	8,12
	2
	7,11
	8,12
	4
	1,11
	8,12
	2
	7,11
	8,12
	4
	1,11
	8,12
	2
	7,11
	8,12
	4
	1,11
	8,12
	2

	7,11
	8,11
	4
	1,11
	8,11
	2
	7,11
	8,11
	4
	1,11
	8,11
	2
	7,11
	8,11
	4
	1,11
	8,11
	2
	7,11
	8,11
	4
	1,11
	8,11
	2

	7,11
	8,16
	4
	1,11
	8,16
	2
	7,11
	8,16
	4
	1,11
	8,16
	2
	7,11
	8,16
	4
	1,11
	8,16
	2
	7,11
	8,16
	4
	1,11
	8,16
	2

	7,11
	8,20
	4
	1,11
	8,20
	2
	7,11
	8,20
	4
	1,11
	8,20
	2
	7,11
	8,20
	4
	1,11
	8,20
	2
	7,11
	8,20
	4
	1,11
	8,20
	2

	7,13
	8,23
	4
	1,13
	8,23
	2
	7,13
	8,23
	4
	1,13
	8,23
	2
	7,13
	8,23
	4
	1,13
	8,23
	2
	7,13
	8,23
	4
	1,13
	8,23
	2



	8,28
	7,13
	24

	8,12
	7,5
	24

	8,13
	7,6
	24

	8,28
	7,13
	24

	8,12
	7,4
	24
	8,13
	7,5
	24

	8,28
	7,13
	24


	8,12
	7,5
	24

	8,28
	7,13
	24

	8,12
	7,5
	24
	8,13
	7,6
	24


	8,28
	7,13
	24

	8,11
	7,4
	24

	8,12
	7,5
	24

	8,11
	7,4
	12

	8,12
	7,5
	12

	8,28
	7,13
	24

	8,12
	7,5
	24

	8,13
	7,6
	24

	8,28
	7,13
	24

	8,12
	7,4
	24
	8,13
	7,5
	24

	8,28
	7,13
	24


	8,12
	7,5
	24

	8,28
	7,13
	24

	8,12
	7,5
	24
	8,13
	7,6
	24


	8,28
	7,13
	24

	8,11
	7,4
	24

	8,12
	7,5
	24

	8,11
	7,4
	12

	8,12
	7,5
	12

	8,13
	7,6
	24

	8,11
	7,4
	24

	8,12
	7,5
	24

	8,11
	7,4
	12

	8,12
	7,5
	12


	255
end
	if !e{4} then goto test

Main_Menu
	w{0}=0

	playfield:
	...............
	....XXXXX......
	..XXXXXXXX.....
	XXXXXXXX..X....
	XXXXXXXX..X....
	XXXXXXXX.X.....
	.XXX.XXXXXX....
	.XX.XXX.X.X....
	..XXXX.........
	...XXXX.X.X....
	..X...XXXX.....
	..X............
	...X...........
	....XX.........
	....XXXX.......
	....X...XX.....
	....XXXXXX.....
	....X....X.....
	....XXXXX......
	....X...X......
	...XXXXX.......
	..X............
end
	CTRLPF=$03: player0y=160: player1y=160: player2y=160: player3y=0: player4y=160: player5y=160

	asm
	lda	#$0e
	sta	COLUP0
	sta	COLUPF
	lda 	#0
	sta 	COLUP1
	sta 	_COLUP1
	sta 	COLUP2
	sta 	COLUP3
	sta 	COLUP4
	sta 	COLUP5

end
Dontdoit
	missile0y= 160: missile1y=160: player0y=120
	playfieldpos=8
	if !e{5} && back>$00 then back=back-$01
	if e{5} && back<$0e then back=back+$01
 	COLUBK=back
	player0scorecolor=$08
	player1scorecolor=$08
	player2scorecolor=$08
	player3scorecolor=$08
	player0score=MaxLife
	player1score=MaxLife
	player2score=MaxKill
	player3score=MaxKill

	asm
	lda #0
 	sta $1F 
 	sta ENABL 
end
	bally=160

	player1:
 	%11111100
 	%10011100
 	%11111100
 	%01111000
 	%00110010
 	%00110010
 	%00110110
 	%00110010
end

	if !o{0} then player2:
 	%11111100
 	%10011100
 	%11111100
 	%01111100
 	%00110111
 	%00110010
 	%00110101
 	%00110011
end
	if o{0} then player2:
 	%11111111
 	%10001011
 	%11111111
 	%01111110
 	%01000010
 	%01000110
 	%01001010
 	%01111110
end


	e{0}=!e{0}
	if e{0} then e{3}=!e{3}
	if !e{2} && e{3} then space=space+1
	if e{2} && e{3} then space=space-1
	if space=0 then space=1
	if space> 6 then space=6
	if space=1 then e{2}=0
	if space=6 then e{2}=1

 	player3:
 	%00000000
 	%00011000
 	%00111100
 	%01110110
 	%11101011
 	%01011100
 	%10111111
 	%01100110
end

 	player4:
 	%00111100
 	%01010010
 	%01111110
 	%11100111
 	%10011001
 	%11011011
 	%11111111
 	%01111110
end

	if !e{0} && !o{1} then player5:
 	%11000011
 	%11010011
 	%00100100
 	%00011000
 	%00011100
 	%00100100
 	%11011011
 	%11000011
end
	

	if !e{0} && o{1} then player5:
 	%11000011
 	%10010001
 	%00000000
 	%00011000
 	%00000100
 	%00100100
 	%10011001
 	%11000011
end

	if e{0} then player5:
 	%00000110
 	%00001001
 	%01101001
 	%10011001
 	%10111001
 	%10000110
 	%10010000
 	%01100000
end
	player3x=84: player4x=player3x: player5x=player3x

	if Selection=1 then player3y=65-3+space else player3y=65
	if Selection=2 then player4y=50-3+space else player4y=50
	if !e{0} then player5y=35 else player5y=20
	if Selection=3 && !e{0} then player5y=35-3+space
	if Selection=4 && e{0} then player5y=20-3+space

	player1x=79: player2x=player1x+13 
	if Selection=0 then player1y=80-3+space else player1y=80
	player2y=player1y

	 if !joy0up && !joy0down && !joy0left && !joy0right && !joy0fire && !joy1up && !joy1down && !joy1left && !joy1right && !joy1fire && !switchselect then e{6}=0

	if e{6} then goto Nope
	if Selection=4 && joy0fire then goto Start_Game bank2
	if Selection=4 && joy1fire then goto Start_Game bank2
	if switchreset then goto Start_Game bank2

	if switchselect then e{4}=0: goto test


	if Selection>0 && joy0up then Selection=Selection-1: e{6} =1
	if Selection>0 && joy1up then Selection=Selection-1: e{6} =1
	if Selection<4 && joy0down then Selection=Selection+1: e{6} =1
	if Selection<4 && joy1down then Selection=Selection+1: e{6} =1
	if !joy0left && !joy1left then goto NOLEFT
	e{6} =1
	if Selection=0 then o{0}=!o{0} 
	if Selection=3 then o{1}=!o{1} 
	if Selection=1 && MaxLife>$10 then dec MaxLife=MaxLife-$05
	if Selection=2 && MaxKill>$10 then dec MaxKill=MaxKill-$05


NOLEFT
	if !joy0right && !joy1right && !joy0fire && !joy1fire then goto Nope
 	e{6} =1
	if Selection=0 then o{0}=!o{0} 
	if Selection=3 then o{1}=!o{1}
	if Selection=1 && MaxLife<$90 then dec MaxLife=MaxLife+$05
	if Selection=2 && MaxKill<$90 then dec MaxKill=MaxKill+$05 
Nope


	if Selection=1 then player0scorecolor=back: player1scorecolor=back
	if Selection=2 then player2scorecolor=back: player3scorecolor=back

	drawscreen
 	goto Calculate_Duration



 bank 2 
	 asm
	 include "titlescreen/asm/titlescreen.asm"
end
	return otherbank

Start_Game
	w{0}=0: Dash_Delay=0
	_NUSIZ1{3}=0: REFP0=0
	AUDV0=0: AUDV1=0: CTRLPF=$01: COLUBK=$00
	e=0: HouseHeight=0
	Life1=MaxLife: Life2=MaxLife: Kills1=$00: Kills2=$00
	playfield:
	...............
	...............
	...............
	...............
	........X......
	....XX..XX.....
	.XXXXX..XXXXX..
	.X.X.X..X.X.X..
	.XXXXX..XXXXX..
	.X.X.X..X.X.X..
	.XXXXX..XXXXX..
	.X.X.X..X.X.X..
	.XXXXX..XXXXX..
	.X.X.X..X.X.X..
	.XXXXX..XXXXX..
	.X.X.X..X.X.X..
	.XXXXX..XXXXX..
	.X.X.X..X.X.X..
	.XXXXX..XXXXX..
	.X..XX..XX..X..
	.X..XX..XX..X..
	XXXXXXXXXXXXXXX
end
	
 	player0:
 	%01011111
 	%01011001
 	%01101101
 	%01011001
 	%01101110
 	%00000000
 	%01101110
 	%10011000
 	%10111100
 	%10001000
 	%01111111
end

 	player1:
 	%01110010
 	%01101010
 	%11101010
 	%01101101
 	%10110101
 	%00000000
 	%10000000
 	%10000000
 	%10000000
 	%10000000
 	%11000000
end
	player0x=20: player1x=138
	player0y=45: player1y=player0y-2
	player2y=160: player3y=160: player4y=160: player5y=160
	player0scorecolor=$4a
	player1scorecolor=$8a
	player2scorecolor=$46
	player3scorecolor=$86
	AUDC0=15: SoundCounter=0
	
Flyers
 	_COLUP1=$0e
	COLUP0=_COLUP1
	AUDF0=SoundCounter
	AUDV0=SoundCounter
	SoundCounter=SoundCounter+1
	player0x=player0x+2: player1x=player1x-2
	ShitCounter=0
	drawscreen
	if player0x=72 then goto Stand

	goto Flyers

Stand
	player1x=player0x+16
	 _COLUP1=_COLUP1+$01
	COLUP0=_COLUP1
	if SoundCounter>15 then SoundCounter=0: ShitCounter=ShitCounter+1 else SoundCounter=SoundCounter+1
	AUDF0=SoundCounter: AUDV0=SoundCounter: AUDC0=8
	drawscreen
	if ShitCounter>6 then SoundCounter=30: goto GoUp
	goto Stand

GoUp
	player0y=player0y+2: player1y=player0y-2
	AUDV0=SoundCounter/2: AUDF0=SoundCounter/2: AUDC0=6
	if SoundCounter>0 then SoundCounter=SoundCounter-1
	if player0y>84 then goto Remover
	drawscreen
	goto GoUp
Remover
	AUDV0=0: player0x=140: player1x=140: COLUP0=$00: _COLUP1=$00
	duration=1: Reaper1_X=28: Reaper2_X=121: Reaper1_Y=23: Reaper2_Y=Reaper1_Y: Shoot1_Y=120: Shoot2_Y=120: Shoot1_X=72: Shoot2_X=72: w{0}=1
	e{3}=1: o{2}=0: o{3}=0: o{4}=0: o{5}=0: o{6}=0: o{7}=0: s{0}=0: s{1}=0: s{2}=0: s{3}=0: s{4}=0: s{5}=0: s{6}=0: s{7}=0
	asm
	lda #0
	sta Player1Counter_1
	sta Player1Counter_Jump
	sta Player2Counter_1
	sta Player2Counter_Jump
	sta Player1Counter_Sprite
	sta PowerUp_Counter
	sta Player2Counter_Sprite

end
	goto MusicSetup3 bank5

 bank 3 
GameLoop
	asm
	LDA	e
   	LSR
   	BCC	.skipL00_66
	LDA	e
   	AND	#254
	STA	e 
end
	e{1} = !e{1}
	asm
  	jmp	.NOPE_NOPE_NOPE
.skipL00_66
    	LDA	e
   	ORA	#1
	STA	e
.NOPE_NOPE_NOPE

end
	NUSIZ0=$30
	rem e{2}, e{3} = Mirrored, e{4}; e{5}= Jump, e{6}, e{7}=Dash, o{2}, s{7}=smashed, o{3}, o{4}=immortal, o{5}, o{6}=Attack, o{7}, s{0}=Shoot, s{1}, s{2}, s{3}, s{4}=ShootDIR, s{5}, s{6}=Smash
	rem w{5} (powerup_player), w{6}, w{7}  = PowerUp_Dir   
	asm
	lda	rand
	lsr
	bcc	*+4
	eor	#$B4
	sta	rand
	TAX    	

   	LDY	#$10
	CPY	player0score
	BCS	.skipelse9_1
.skipL0205_1
	LDX	#$4a
.skipelse9_1
	STX	player0scorecolor
	LDX	rand

	CPY	player1score
	BCS	.skipelse9_2
.skipL0205_2
	LDX	#$8a
.skipelse9_2
	STX	player1scorecolor
	
	SED
	LDA	MaxKill
   	SEC
	SBC	#$10
   	STA	temp4
   	CLD
	TAY
	LDX	rand
   	CPY	player2score
   	BCS	.skipL0208_1
   	jmp	.skipelse11_1
.skipL0208_1
 	LDX	#$46
.skipelse11_1
	STX	player2scorecolor

	LDX	rand

   	CPY	player3score
   	BCS	.skipL0208_2
   	jmp	.skipelse11_2
.skipL0208_2
 	LDX	#$86
.skipelse11_2
	STX	player3scorecolor
end

	missile0y=160

DrawPlayer
	asm
   	LDA	e
   	LSR
   	BCC	.Player1Things
  	LDA	o
   	LSR
   	sta	temp7
   	BCS	.skipL0212_1
   	jmp	.Player2Things
.skipL0212_1
   	lda	#>(.CPU_AI-1)
  	pha
  	lda	#<(.CPU_AI-1)
  	pha
  	lda	temp7
   	pha
   	
   	pha
  	ldx	#7
   	jmp	BS_jsr
end
Player1Things
	player0x=Reaper1_X: player0y=Reaper1_Y
	COLUP0=$46
	if Player1Counter_1>0 then Player1Counter_1= Player1Counter_1-1
	if Player1Counter_Jump>0 then Player1Counter_Jump= Player1Counter_Jump-1
	if e{2} then REFP0=8
 	if o{2} then goto Fallen_1 

	asm
	LDA	#0
	CMP	player0score
	BEQ	.condpart118_1

	LDA	MaxLife
	CMP	player0score
	BCS	.skip42OR_1
.condpart118_1
	STA	player0score
	LDA	o
	ORA	#4
	STA	o
	LDA	#120
	STA	Player1Counter_1

	LDA	w
   	AND	#32
   	BNE	.skip42OR_1
   	LDA	#0
   	CMP	PowerUp_Counter
   	BCS	.skip42OR_1
   	STA	PowerUp_Counter
	LDA	#120
	STA	player5y
.skip42OR_1
end


	asm
	lda 	#23
	CMP	Reaper1_Y 	
	BCC	.skipL0215_1
	sta 	Reaper1_Y
.skipL0215_1
end

	asm
	LDA	e
	AND	#16
	BEQ	.DODODO_1
	LDA	#0
	CMP	Player1Counter_Jump
	BCC	.DODODO_1
	LDA	#23
  	CMP	Reaper1_Y
  	BCC	.DODODO_1
end


	asm
	LDA	s
	AND	#32
	BEQ	.ComeBack_1
	LDA	Player1Counter_1
	CMP	#12
	BCC	.ComeBack_1
end

   	

	if player3y<120 then dec player2score=player2score+$01
	if player4y<120 then dec player2score=player2score+$01
 	COLUBK=$1e: HouseHeight=HouseHeight+1: goto ChangePF bank7
ComeBack_1
 	Player1Counter_1=0
	e{4}=0: Reaper1_Y=23
DODODO_1

	asm
	BIT	o
	BPL	.No_O7
   	LDA	Shoot1_X
   	CMP	#134
  	BCS	.condpart123_1
   	CMP	#23
   	BCS	.skip43OR_1
.condpart123_1
	LDA	o
	AND	#127
	AND	#223
	STA	o
	jmp	.No_O7
.skip43OR_1
end

	asm
   	LDA	s
   	AND	#2
   	BEQ	.skipL0228_1
   	LDA	Shoot1_X
   	SEC
   	SBC	#5
   	jmp	.skipelse9_11
.skipL0228_1
   	LDA	Shoot1_X
   	CLC
  	ADC	#5
.skipelse9_11
   	STA	Shoot1_X
	STA	missile0x

	LDA	s
  	AND	#4
   	BEQ	.skipL0229_1
   	LDA	Shoot1_Y
   	CLC
   	ADC	#4
   	STA	Shoot1_Y
	STA	missile0y
	jmp	.Poppp1
.skipL0229_1
	LDA	Shoot1_Y

   	STA	missile0y
.Poppp1
end

  	NUSIZ0=$20
No_O7
	asm
	LDA	e
	AND	#16
	beq	.skippp
	jmp	.JumpThings_1
end
skippp

	if Player1Counter_1>0 then goto Continue_1
	asm
	bit	INPT4
	BMI	.No_Attack_1
 	BIT	o
   	BMI	.No_Attack_1

   	LDA	e
   	AND	#4
   	BNE	.skipL0475_0
  	bit	SWCHA
   	BPL	.condpart282_0
.skipL0475_0
   	LDA	e
   	AND	#4
   	BEQ	.skipL0476_0
	bit	SWCHA
	BVS	.skipL0476_0
.condpart282_0
 	jmp	.Attack_1_Dash

.skipL0476_0

end


	goto Attack_1

Fallen_1
	asm
	LDA	e
	AND	#16
   	BEQ	.skipL0236_1
   	LDX	Reaper1_Y
	CPX	#24
	BCS	.NoMoreJump1
	LDA	e
	AND	#239
	STA	e
.NoMoreJump1
	TXA
  	SEC
   	SBC	#2
   	STA	Reaper1_Y
      	CLC
   	ADC	#7
   	STA	player0y
   	sta	temp7
   	lda	#>(.ReaperFall-1)
   	pha
   	lda	#<(.ReaperFall-1)
   	pha
   	lda	temp7
   	pha
   	
   	pha
   	ldx	#7
   	jmp	BS_jsr
.skipL0236_1
	LDA	Player1Counter_1
	CMP	#0
	BEQ	.skipL0237_1
	sta	temp7
 	lda	#>(.ReaperFallen-1)
	pha
 	lda	#<(.ReaperFallen-1)
	pha
 	lda	temp7
	pha
 	
 	pha
	ldx	#7
	jmp	BS_jsr
.skipL0237_1
	LDA	o
	AND	#251
 	ORA	#8
	STA	o
	LDA	MaxLife
 	STA	player0score

end


No_Attack_1
	if joy0down then goto Duck_1
	if joy0up then goto Jump_1
	asm
  	bit	SWCHA
  	BVC	.GoLeft_1
	BPL	.GoRight_1
end
	Player1Counter_Sprite=0: goto PlayerStand bank7

GoLeft_1
	if w{5} && PowerUp_Counter>0 && PowerUp_Type=3 then COLUP0=$0e: goto Inversed_Right_1 	
Inversed_Left_1

	asm
   	LDA	Reaper1_X
   	CMP	#21
   	BCC	.skipL0243_1
	SEC
 	SBC	#4
	STA	Reaper1_X
   	LDA	Player1Counter_Sprite
	CLC
	ADC	#2

   	CMP	#55
   	BCC	.skipL0244_1
	LDA	#0
.skipL0244_1


	STA	Player1Counter_Sprite
	LDA	e
	ORA	#4
	STA	e
.skipL0243_1
	LDA	Player1Counter_Sprite
   	lsr
   	lsr
   	lsr
   	STA	temp4

end


	goto Move_Player bank7

GoRight_1
	if w{5} && PowerUp_Counter>0 && PowerUp_Type=3 then COLUP0=$0e: goto Inversed_Left_1	
Inversed_Right_1
	asm
	LDA	Reaper1_X
   	CMP	#132
   	BCS	.skipL0247_1
   	CLC
	ADC	#4
	STA	Reaper1_X
	LDA	Player1Counter_Sprite
	CLC
   	ADC	#2
	CMP	#55
	BCC	.skipL0248_1
  	LDA	#0
.skipL0248_1

	STA	Player1Counter_Sprite

	LDA	e
	AND	#251
	STA	e
.skipL0247_1
	LDA	Player1Counter_Sprite
	lsr
	lsr
	lsr
	STA	temp4
end

	goto Move_Player bank7
Continue_1
	if o{2} then goto PlayerDone bank7
	if e{6} then goto Attack_1_Dash

	if !joy0down && o{5} then goto Attack_1

Attack_Shoot_Wait_1
	player0y=Reaper1_Y+7
	if e{5}  then goto PlayerShoot2 bank7 else goto PlayerShoot1 bank7 

JumpThings_1
	asm
	LDA	w
  	AND	#32
 	BEQ	.No_Inverse_1
	LDA	PowerUp_Counter
   	CMP	#0
	BEQ	.No_Inverse_1
	LDA	#3
   	CMP	PowerUp_Type
   	BNE	.No_Inverse_1
  	
end

	COLUP0=$0e
	asm
   	bit	SWCHA
   	BMI	.skipL0257_4
   	LDA	Reaper1_X
   	CMP	#21
   	BCC	.skipL0257_4
	SEC
   	SBC	#2
	jmp 	.skipL0258_4		   
.skipL0257_4
	bit	SWCHA
   	BVS	.skipL0258_45
      	LDA	Reaper1_X
   	CMP	#132
   	BCS	.skipL0258_45
  	CLC
   	ADC	#2
.skipL0258_4
   	STA	Reaper1_X
.skipL0258_45
end
	goto skipL0258_14	
No_Inverse_1 
	asm
   	bit	SWCHA
   	BVS	.skipL0257_1
   	LDA	Reaper1_X
   	CMP	#21
   	BCC	.skipL0257_1
	SEC
   	SBC	#2
	jmp	.skipL0258_1

.skipL0257_1		   
	bit	SWCHA
   	BMI	.skipL0258_14
      	LDA	Reaper1_X
   	CMP	#132
   	BCS	.skipL0258_14
  	CLC
   	ADC	#2
.skipL0258_1
   	STA	Reaper1_X
.skipL0258_14

end

 	if s{5} && Player1Counter_1>10 then COLUP0=$1e: AUDV1=11: AUDC1=14: AUDF1=3

	if !joy0fire then o{5} =0: goto JustFall_1
	o{5} =1

	if joy0down then goto NoSpin_1

	s{5}=0 : AUDV1=9: AUDC1=6: AUDF1=6

	asm
	LDA	Player1Counter_Sprite
   	CMP	#31
   	BCS	.skipL0372_1
   	CLC
  	ADC	#4
	jmp	.skipelse20_1
.skipL0372_1
	LDA	#0
.skipelse20_1
   	STA	Player1Counter_Sprite

	lsr
	lsr
	lsr
	STA	temp4
end

	Reaper1_Y=Reaper1_Y-4
	if e{2}   then goto E2IS1

	asm
 	LDX	temp4
  	CPX	#3
  	BNE	.temp4_2
   	LDA	Reaper1_X
   	STA	missile0x
.Sonic_3
   	LDA	Reaper1_Y
   	CLC
   	ADC	#6
	STA 	missile0y
	ADC	#1
   	STA	player0y

  	LDA	#$20
   	STA	NUSIZ0
   	sta	temp7
   	lda	#>(.Sonic_Attack1-1)
   	pha
   	lda	#<(.Sonic_Attack1-1)
   	pha
   	lda	temp7
   	pha
   	
   	pha
   	ldx	#7
   	jmp	BS_jsr
.temp4_2
	CPX	#2
	BNE	.temp4_1
  	LDA	player0x
   	CLC
   	ADC	#8
   	STA	missile0x
.Sonic_2

  	LDA	player0y
   	SEC
   	SBC	#8
   	STA	missile0y
   	sta	temp7
   	lda	#>(.Sonic_Attack2-1)
   	pha
   	lda	#<(.Sonic_Attack2-1)
   	pha
   	lda	temp7
   	pha
   	
  	pha
   	ldx	#7
   	jmp	BS_jsr
.temp4_1
	CPX	#1
	BNE	.temp4_0
	LDA	Reaper1_X

   	STA	missile0x
.Sonic_1
  	LDA	Reaper1_Y
   	SEC
  	SBC	#21
   	STA	missile0y
   	LDA	#$20
   	STA	NUSIZ0
   	sta	temp7
   	lda	#>(.Sonic_Attack3-1)
   	pha
   	lda	#<(.Sonic_Attack3-1)
   	pha
   	lda	temp7
   	pha
   	
   	pha
   	ldx	#7
   	jmp	BS_jsr
.temp4_0
   	LDA	player0x
   	SEC
   	SBC	#7
   	STA	missile0x
.Sonic_0

   	LDA	player0y
   	SEC
   	SBC	#8
   	STA	missile0y
	sta	temp7
   	lda	#>(.Sonic_Attack4-1)
   	pha
   	lda	#<(.Sonic_Attack4-1)
   	pha
   	lda	temp7
   	pha
   	
   	pha
   	ldx	#7
   	jmp	BS_jsr
end


E2IS1
	asm
 	LDX	temp4
  	CPX	#3
  	BNE	.temp4_2_2
   	LDA	Reaper1_X
	CLC	
	ADC	#3
   	STA	missile0x
	jmp	.Sonic_3

.temp4_2_2
	CPX	#2
	BNE	.temp4_1_2
  	LDA	player0x
   	SEC
   	SBC	#7
   	STA	missile0x
	jmp	.Sonic_2


.temp4_1_2
	CPX	#1
	BNE	.temp4_0_2
	LDA	Reaper1_X
	CLC
	ADC	#3
   	STA	missile0x
	jmp	.Sonic_1

.temp4_0_2
   	LDA	player0x
   	CLC
   	ADC	#8
   	STA	missile0x
	jmp .Sonic_0

end


NoSpin_1

	asm
	lda	Reaper1_Y
	SEC	
	SBC	#7
	STA	Reaper1_Y
	CLC
	ADC	#4
	STA	player0y
	SEC
	SBC	#25
	STA	missile0y
	LDA	#0
	STA	Player1Counter_Sprite
	STA	Player1Counter_Jump
end
	s{5}=1: Player1Counter_1=Player1Counter_1+4: missile0x=Reaper1_X: goto ReaperStomp bank7
JustFall_1
	s{5}=0  : Player1Counter_Sprite=0	
	asm
  	LDA	Reaper1_Y
   	CLC
  	ADC	#7
   	STA	player0y
	SEC
   	LDX	#0
   	CPX	Player1Counter_Jump
  	BCS	.skipL0270_1	
	SBC	#2
	STA	Reaper1_Y
   	sta	temp7
  	lda	#>(.Common_Jump_Up-1)
   	pha
   	lda	#<(.Common_Jump_Up-1)
   	pha
   	lda	temp7
   	pha
  	
   	pha
   	ldx	#7
   	jmp	BS_jsr
.skipL0270_1
	SBC	#12
  	STA	Reaper1_Y
   	sta	temp7
   	lda	#>(.Common_Jump_Down-1)
   	pha
   	lda	#<(.Common_Jump_Down-1)
   	pha
   	lda	temp7
   	pha
   	
   	pha
   	ldx	#7
   	jmp	BS_jsr
end





Attack_1

	asm
	lda	#$20
   	bit	SWCHA
   	BEQ	.Attack_1_Shoot
end

	o{5} =1: AUDV1=9: AUDC1=6: AUDF1=6
	asm
	ldx	#7
   	LDA	Player1Counter_1
   	CMP	#26
	BCS	.skipL0281_1
	CLC
	ADC	#4
	jmp	.skipelse14_1
.skipL0281_1
   	LDA	o
  	AND	#223
   	STA	o
	LDA	#0
.skipelse14_1
	STA	Player1Counter_1
	lsr
	lsr
	lsr	
	STA	temp4
   	CMP	#0
   	BNE	.skipL0273_1
   	LDA	Reaper1_Y
   	CLC
   	ADC	#6
.GotoAttack
   	STA	player0y
   	sta	temp7
  	lda	#>(.Attack_Player-1)
   	pha
  	lda	#<(.Attack_Player-1)
   	pha
   	lda	temp7
   	pha
   	pha
   	jmp	BS_jsr
.skipL0273_1
   	CMP	#1
   	BNE	.skipL0274_1
  	LDA	Reaper1_Y
   	CLC
   	ADC	#2
	jmp	.GotoAttack
.skipL0274_1
   	LDA	e
   	AND	#4
   	BNE	.skipL0275_1
   	LDA	player0x
   	CLC
   	ADC	#8
   	jmp	.skipelse11_11
.skipL0275_1
   	LDA	player0x
   	SEC
   	SBC	#7		      
.skipelse11_11
	STA	missile0x
end

	missile0y=player0y-10
	asm
   	sta	temp7
  	lda	#>(.Attack_Player-1)
   	pha
  	lda	#<(.Attack_Player-1)
   	pha
   	lda	temp7
   	pha
   	pha   	
   	jmp	BS_jsr
end
Attack_1_Shoot
	Player1Counter_1=25: AUDV1=9: AUDC1=15: AUDF1=2
	NUSIZ0=$20
	asm
	LDA	Reaper1_Y
	CLC
	ADC	#7
	STA	player0y
	SEC
	SBC	#17
	STA	Shoot1_Y

	LDA	o
	ORA	#128
	ORA	#32
	STA	o

  	LDA	e
  	AND	#4
   	BEQ	.skipL0294_1
   	LDA	s
   	ORA	#2
   	STA	s
  	LDA	Reaper1_X
   	SEC
   	SBC	#1
   	jmp	.skipelse12_1
.skipL0294_1
   	LDA	s
   	AND	#253
   	STA	s
  	LDA	Reaper1_X

    	CLC
   	ADC	#7
.skipelse12_1
	STA	Shoot1_X


end

	


	if e{5}  then s{2} = 1: Shoot1_Y=Shoot1_Y+3: goto PlayerShoot2 bank7 else s{2} = 0: goto PlayerShoot1 bank7 




Attack_1_Dash
	e{6} = 1: AUDV1=9: AUDC1=3: AUDF1=4
	asm
	bit	INPT4
   	BPL	.Skip_1
   	LDA	e
   	AND	#4
   	BNE	.skipL0277_1
   	bit	SWCHA
  	BPL	.Skip_1
.skipL0277_1
   	LDA	e
   	AND	#4
  	BEQ	.skipL0278_1
	bit	SWCHA
   	BVC	.Skip_1
.skipL0278_1
end



	e{6} =0: Player1Counter_Sprite=0: goto Attack_1
Skip_1
	asm
   	LDA	#132
   	CMP	Reaper1_X
   	BCC	.condpart158_1
  	LDA	Reaper1_X
   	CMP	#21
   	BCS	.skip48OR_1
.condpart158_1
   	LDA	#0
   	STA	Player1Counter_Sprite
   	sta	temp7
   	lda	#>(.PlayerStand-1)
  	pha
   	lda	#<(.PlayerStand-1)
   	pha
   	lda	temp7
   	pha
   	
   	pha
   	ldx	#7
   	jmp	BS_jsr
.skip48OR_1
end
	if e{2} then goto Dash_Left1
	asm
	LDA	Reaper1_X
   	CMP	#132
   	BCS	.ooooo1
   	CLC
   	ADC	#6
   	STA	Reaper1_X
   	LDA	Player1Counter_Sprite
  	CLC
   	ADC	#2
   	CMP	#23
   	BCC	.skipL0287_1
   	LDA	#0
.skipL0287_1
   	STA	Player1Counter_Sprite
.ooooo1
	LDA	Player1Counter_Sprite
	lsr
   	lsr
   	lsr
   	STA	temp4
end

		player0y=Reaper1_Y+7
		goto Attack_Player_Dash bank7

Dash_Left1
	asm
	LDA	Reaper1_X
   	CMP	#21
   	BCC	.ooooo2
   	SEC
   	SBC	#6
   	STA	Reaper1_X
   	LDA	Player1Counter_Sprite
  	CLC
   	ADC	#2
   	STA	Player1Counter_Sprite
   	CMP	#23
   	BCC	.skipL0287_13
   	LDA	#0
.skipL0287_13
   	STA	Player1Counter_Sprite
.ooooo2
	LDA	Player1Counter_Sprite
	lsr
   	lsr
   	lsr
   	STA	temp4
end


		player0y=Reaper1_Y+7
		goto Attack_Player_Dash bank7

Jump_1
	AUDV1=7: AUDC1=7: AUDF1=1
	Player1Counter_Jump=10: e{4}=1
	player0y=Reaper1_Y+7
	goto Common_Jump_Up bank7

Duck_1
	asm
  	LDA	e
	AND	#2
	BEQ	.skip160then_1
   	LDA	Life1
	CMP	MaxLife
	BCS	.skip160then_1	
	SED
   	CLC
   	ADC	#1
   	STA	Life1
   	CLD
	LDA	#$1e
   	STA	player0scorecolor
   	

.skip160then_1
end

	goto Player_Duck bank7

Player2Things
	
	player0x=Reaper2_X: player0y=Reaper2_Y
	COLUP0=$86
	if Player2Counter_1>0 then Player2Counter_1= Player2Counter_1-1
	if Player2Counter_Jump>0 then Player2Counter_Jump= Player2Counter_Jump-1
	if e{3} then REFP0=8
 	if s{7} then goto Fallen_2 
	asm
	LDA	#0
	CMP	player1score
	BEQ	.condpart118_2

	LDA	MaxLife
	CMP	player1score
	BCS	.skip42OR_2
.condpart118_2
	LDA	#0
	STA	player1score
	LDA	s
	ORA	#128
	STA	s
	LDA	#120
	STA	Player2Counter_1

	LDA	w
   	AND	#32
   	BEQ	.skip42OR_2
   	LDA	#0
   	CMP	PowerUp_Counter
   	BCS	.skip42OR_2
   	STA	PowerUp_Counter
	LDA	#120
	STA	player5y
.skip42OR_2
end
	asm
	lda 	#23
	CMP	Reaper2_Y 	
	BCC	.skipL0215_2
	sta 	Reaper2_Y
.skipL0215_2
end

	asm
	LDA	e
	AND	#32
	BEQ	.DODODO_2
	LDA	#0
	CMP	Player2Counter_Jump
	BCC	.DODODO_2
	LDA	#23
  	CMP	Reaper2_Y
  	BCC	.DODODO_2
end

	asm

	BIT	s
	BVC	.ComeBack_2
	LDA	Player2Counter_1
	CMP	#12
	BCC	.ComeBack_2
end
	if player3y<120 then dec player3score=player3score+$01
	if player4y<120 then dec player3score=player3score+$01

 	COLUBK=$1e: HouseHeight=HouseHeight+1: goto ChangePF bank7
ComeBack_2
 	Player2Counter_1=0
	e{5}=0: Reaper2_Y=23
DODODO_2
	asm
	LDA	s
   	LSR
	BCC	.No_S0

	LDA	Shoot2_X
   	CMP	#134
   	BCS	.condpart214_1
   	CMP	#23
   	BCS	.skip70OR_1
.condpart214_1
	LDA	s
	AND	#254
   	STA	s
	LDA	o
	AND	#191
	STA	o
	jmp	.No_S0
.skip70OR_1
end

	asm
   	LDA	s
   	AND	#8
   	BEQ	.skipL0228_2
   	LDA	Shoot2_X
   	SEC
   	SBC	#5
   	jmp	.skipelse9_22
.skipL0228_2
   	LDA	Shoot2_X
   	CLC
  	ADC	#5
.skipelse9_22
   	STA	Shoot2_X
	STA	missile0x

	LDA	s
  	AND	#16
   	BEQ	.skipL0229_2
   	LDA	Shoot2_Y
   	CLC
   	ADC	#4
   	STA	Shoot2_Y
	STA	player0y
	jmp	.Poppp2
.skipL0229_2
	LDA	Shoot2_Y
   	STA	missile0y
.Poppp2
end

	NUSIZ0=$20
No_S0
	asm
	LDA	e
	AND	#32
	beq	.skippp2
	jmp	.JumpThings_2
end
skippp2
	if Player2Counter_1>0 then goto Continue_2	
	asm
	bit	INPT5
	BMI	.No_Attack_2
   	LDA	s	
	LSR
	BCS	.No_Attack_2

   	LDA	e
   	AND	#8
   	BNE	.skipL0475_1
   	lda	#8
  	bit	SWCHA
   	BEQ	.condpart282_1
.skipL0475_1
   	LDA	e
   	AND	#8
   	BEQ	.skipL0476_1
	lda	#4
	bit	SWCHA
	BNE	.skipL0476_1
.condpart282_1
 	jmp	.Attack_2_Dash

.skipL0476_1

end

	goto Attack_2

Fallen_2
	asm
	LDA	e
   	AND	#32
   	BEQ	.skipL0344_1
   	LDX	Reaper2_Y
	CPX	#24
	BCS	.NoMoreJump2
	LDA	e
	AND	#223
	STA	e
.NoMoreJump2
	TXA
	SEC
   	SBC	#2
   	STA	Reaper2_Y
   	CLC
   	ADC	#7
   	STA	player0y
   	sta	temp7
   	lda	#>(.ReaperFall-1)
   	pha
   	lda	#<(.ReaperFall-1)
   	pha
   	lda	temp7
   	pha
   	
   	pha
   	ldx	#7
   	jmp	BS_jsr
.skipL0344_1
	LDA	Player2Counter_1
	CMP	#0
	BEQ	.skipL0237_22
	sta	temp7
 	lda	#>(.ReaperFallen-1)
	pha
 	lda	#<(.ReaperFallen-1)
	pha
 	lda	temp7
	pha
 	
 	pha
	ldx	#7
	jmp	BS_jsr
.skipL0237_22

   
end
	s{7} = 0 :  player1score = MaxLife :  o{4} = 1  
No_Attack_2
	if joy1down then goto Duck_2
	if joy1up then goto Jump_2

	asm
	lda	#4
	bit	SWCHA
   	BEQ	.GoLeft_2
   	lda	#8
   	bit	SWCHA
   	BEQ	.GoRight_2
end
	Player2Counter_Sprite=0: goto PlayerStand bank7

GoLeft_2
	if !w{5} && PowerUp_Counter>0 && PowerUp_Type=3 then COLUP0=$0e: goto Inversed_Right2 	
Inversed_Left2
	asm
   	LDA	Reaper2_X
   	CMP	#21
   	BCC	.skipL0243_2
	SEC
 	SBC	#4
	STA	Reaper2_X
   	LDA	Player2Counter_Sprite
	CLC
	ADC	#2
   	CMP	#55
   	BCC	.skipL0244_2
	LDA	#0
.skipL0244_2

	STA	Player2Counter_Sprite
	LDA	e
	ORA	#8
	STA	e
.skipL0243_2
	LDA	Player2Counter_Sprite

   	lsr
   	lsr
   	lsr
   	STA	temp4
end

	goto Move_Player bank7

GoRight_2
		if !w{5} && PowerUp_Counter>0 && PowerUp_Type=3 then COLUP0=$0e: goto Inversed_Left2	
Inversed_Right2
	asm
	LDA	Reaper2_X
   	CMP	#132
   	BCS	.skipL0247_2
   	CLC
	ADC	#4
	STA	Reaper2_X
	LDA	Player2Counter_Sprite
	CLC
   	ADC	#2

	CMP	#55
	BCC	.skipL0248_2
  	LDA	#0
.skipL0248_2


	STA	Player2Counter_Sprite
	LDA	e
	AND	#247
	STA	e
.skipL0247_2
	LDA	Player2Counter_Sprite
	lsr
	lsr
	lsr
	STA	temp4
end

	goto Move_Player bank7
Continue_2
	if s{7} then goto PlayerDone bank7
	if e{7} then goto Attack_2_Dash

	if !joy1down &&  o{6} then goto Attack_2

Attack_Shoot_Wait_2
	player0y=Reaper2_Y+7
	if e{4}  then goto PlayerShoot2 bank7 else goto PlayerShoot1 bank7 

JumpThings_2
	asm
 	LDA	w
   	AND	#32
   	BNE	.No_Inverse_2
  	LDA	PowerUp_Counter
   	CMP	#0
  	BEQ	.No_Inverse_2
   	LDA	#3
   	CMP	PowerUp_Type
   	BNE	.No_Inverse_2
end
	COLUP0=$0e
	asm
	lda	#8
	bit	SWCHA
   	BNE	.skipL0365_3
   	LDA	Reaper2_X
  	CMP	#21
   	BCC	.skipL0365_3
   	SEC
   	SBC	#2
   	jmp	.skipL0366_3
.skipL0365_3
     	lda	#4
   	bit	SWCHA
   	BNE	.skipL0366_38
   	LDA	Reaper2_X
   	CMP	#132
   	BCS	.skipL0366_38
  	CLC
   	ADC	#2
.skipL0366_3
   	STA	Reaper2_X
.skipL0366_38
end

	goto skipL0366_17
No_Inverse_2
	asm
	lda	#4
	bit	SWCHA
   	BNE	.skipL0365_1
   	LDA	Reaper2_X
  	CMP	#21
   	BCC	.skipL0365_1
   	SEC
   	SBC	#2
	jmp	.skipL0366_1
.skipL0365_1
     	lda	#8
   	bit	SWCHA
   	BNE	.skipL0366_17
   	LDA	Reaper2_X
   	CMP	#132
   	BCS	.skipL0366_17
  	CLC
   	ADC	#2
.skipL0366_1
   	STA	Reaper2_X
.skipL0366_17

end

 	if s{6} && Player2Counter_1>10 then COLUP0=$1e: AUDV1=11: AUDC1=14: AUDF1=3
	if !joy1fire then o{6} =0: goto JustFall_2
	o{6} =1

	if joy1down then goto NoSpin_2


	s{6}=0 : AUDV1=9: AUDC1=6: AUDF1=6

	asm
	LDA	Player2Counter_Sprite
   	CMP	#31
   	BCS	.skipL0372_2
   	CLC
  	ADC	#4
	jmp	.skipelse20_2
.skipL0372_2
	LDA	#0
.skipelse20_2
   	STA	Player2Counter_Sprite

	lsr
	lsr
	lsr
	STA	temp4
end


	Reaper2_Y=Reaper2_Y-4
	if e{3}   then goto  E3IS1
	asm
 	LDX	temp4
  	CPX	#3
  	BNE	.temp4_2Q
   	LDA	Reaper2_X
   	STA	missile0x
.Sonic_3Q
   	LDA	Reaper2_Y
   	CLC
   	ADC	#6
	STA 	missile0y
	ADC	#1
   	STA	player0y

  	LDA	#$20
   	STA	NUSIZ0
   	sta	temp7
   	lda	#>(.Sonic_Attack1-1)
   	pha
   	lda	#<(.Sonic_Attack1-1)
   	pha
   	lda	temp7
   	pha
   	
   	pha
   	ldx	#7
   	jmp	BS_jsr
.temp4_2Q
	CPX	#2
	BNE	.temp4_1Q
  	LDA	player0x
   	CLC
   	ADC	#8
   	STA	missile0x
.Sonic_2Q

  	LDA	player0y
   	SEC
   	SBC	#8
   	STA	missile0y
   	sta	temp7
   	lda	#>(.Sonic_Attack2-1)
   	pha
   	lda	#<(.Sonic_Attack2-1)
   	pha
   	lda	temp7
   	pha
   	
  	pha
   	ldx	#7
   	jmp	BS_jsr
.temp4_1Q
	CPX	#1
	BNE	.temp4_0Q
	LDA	Reaper2_X

   	STA	missile0x
.Sonic_1Q
  	LDA	Reaper2_Y
   	SEC
  	SBC	#21
   	STA	missile0y
   	LDA	#$20
   	STA	NUSIZ0
   	sta	temp7
   	lda	#>(.Sonic_Attack3-1)
   	pha
   	lda	#<(.Sonic_Attack3-1)
   	pha
   	lda	temp7
   	pha
   	
   	pha
   	ldx	#7
   	jmp	BS_jsr
.temp4_0Q
   	LDA	player0x
   	SEC
   	SBC	#7
   	STA	missile0x
.Sonic_0Q

   	LDA	player0y
   	SEC
   	SBC	#8
   	STA	missile0y
	sta	temp7
   	lda	#>(.Sonic_Attack4-1)
   	pha
   	lda	#<(.Sonic_Attack4-1)
   	pha
   	lda	temp7
   	pha
   	
   	pha
   	ldx	#7
   	jmp	BS_jsr
end


E3IS1
	asm
 	LDX	temp4
  	CPX	#3
  	BNE	.temp4_2_2Q
   	LDA	Reaper2_X
	CLC	
	ADC	#3
   	STA	missile0x
	jmp	.Sonic_3Q

.temp4_2_2Q
	CPX	#2
	BNE	.temp4_1_2Q
  	LDA	player0x
   	SEC
   	SBC	#7
   	STA	missile0x
	jmp	.Sonic_2Q


.temp4_1_2Q
	CPX	#1
	BNE	.temp4_0_2Q
	LDA	Reaper2_X
	CLC
	ADC	#3
   	STA	missile0x
	jmp	.Sonic_1Q

.temp4_0_2Q
   	LDA	player0x
   	CLC
   	ADC	#8
   	STA	missile0x
	jmp .Sonic_0Q

end


NoSpin_2
	asm
	lda	Reaper2_Y
	SEC	
	SBC	#7
	STA	Reaper2_Y
	CLC
	ADC	#4
	STA	player0y
	SEC
	SBC	#25
	STA	missile0y
	LDA	#0
	STA	Player2Counter_Sprite
	STA	Player2Counter_Jump
end
	s{6}=1: 	Player2Counter_1=Player2Counter_1+4: missile0x=Reaper2_X : goto  ReaperStomp bank7
JustFall_2
	s{6}=0  : Player2Counter_Sprite=0	
	asm
  	LDA	Reaper2_Y
   	CLC
  	ADC	#7
   	STA	player0y
	SEC
   	LDX	#0
   	CPX	Player2Counter_Jump
  	BCS	.skipL0270_2	
	SBC	#2
	STA	Reaper2_Y
   	sta	temp7
  	lda	#>(.Common_Jump_Up-1)
   	pha
   	lda	#<(.Common_Jump_Up-1)
   	pha
   	lda	temp7
   	pha
  	
   	pha
   	ldx	#7
   	jmp	BS_jsr
.skipL0270_2
	SBC	#12
  	STA	Reaper2_Y
   	sta	temp7
   	lda	#>(.Common_Jump_Down-1)
   	pha
   	lda	#<(.Common_Jump_Down-1)
   	pha
   	lda	temp7
   	pha
   	
   	pha
   	ldx	#7
   	jmp	BS_jsr
end



Attack_2
	asm
	lda	#2
   	bit	SWCHA
   	BEQ	.Attack_2_Shoot
end  
	o{6} =1: AUDV1=9: AUDC1=6: AUDF1=6
	asm
	ldx	#7
   	LDA	Player2Counter_1
   	CMP	#26
	BCS	.skipL0281_2
	CLC
	ADC	#4
	jmp	.skipelse14_2
.skipL0281_2
   	LDA	o
  	AND	#191
   	STA	o
	LDA	#0
.skipelse14_2
	STA	Player2Counter_1
	lsr
	lsr
	lsr	
	STA	temp4
   	CMP	#0
   	BNE	.skipL0273_2
   	LDA	Reaper2_Y
   	CLC
   	ADC	#6
.GotoAttack2
   	STA	player0y
   	sta	temp7
  	lda	#>(.Attack_Player-1)
   	pha
  	lda	#<(.Attack_Player-1)
   	pha
   	lda	temp7
   	pha
   	pha
   	jmp	BS_jsr
.skipL0273_2
   	CMP	#1
   	BNE	.skipL0274_2
  	LDA	Reaper2_Y
   	CLC
   	ADC	#2
	jmp	.GotoAttack2
.skipL0274_2
   	LDA	e
   	AND	#8
   	BNE	.skipL0275_2
   	LDA	player0x
   	CLC
   	ADC	#8
   	jmp	.skipelse22_22
.skipL0275_2
   	LDA	player0x
   	SEC
   	SBC	#7		      
.skipelse22_22
	STA	missile0x
end
	missile0y=player0y-10
	asm
   	sta	temp7
  	lda	#>(.Attack_Player-1)
   	pha
  	lda	#<(.Attack_Player-1)
   	pha
   	lda	temp7
   	pha
   	pha
   	jmp	BS_jsr
end

Attack_2_Shoot
	asm
	LDA	Reaper2_Y
	CLC
	ADC	#7
	STA	player0y
	SEC
	SBC	#17
	STA	Shoot2_Y

end
	Player2Counter_1=25: AUDV1=9: AUDC1=15: AUDF1=2
	NUSIZ0=$20: 	o{6} = 1: s{0} =1


	asm
	LDA	e
  	AND	#8
  	BEQ	.skipL0529_1
  	LDA	s
 	ORA	#8
  	STA	s
  	LDA	Reaper2_X
  	SEC
  	SBC	#1
  	jmp	.skipelse45_1
.skipL0529_1
  	LDA	s
  	AND	#247
  	STA	s
	LDA	Reaper2_X
  	CLC
 	ADC	#7
.skipelse45_1
	STA	Shoot2_X


end

	if e{4}  then s{4} = 1: Shoot2_Y=Shoot2_Y+3: goto PlayerShoot2 bank7 else s{4} = 0: goto PlayerShoot1 bank7 




Attack_2_Dash
	e{7} = 1: AUDV1=9: AUDC1=3: AUDF1=4
	asm
	bit	INPT5
   	BPL	.Skip_2
   	LDA	e
   	AND	#8
   	BNE	.skipL0277_2
	lda	#8
  	bit	SWCHA
  	BEQ	.Skip_2
.skipL0277_2
   	LDA	e
   	AND	#8
  	BEQ	.skipL0278_2
	lda	#4
  	bit	SWCHA
  	BEQ	.Skip_2
.skipL0278_2
end


	e{7} =0: Player2Counter_Sprite=0: goto Attack_2
Skip_2
	asm
   	LDA	#132
   	CMP	Reaper2_X
   	BCC	.condpart158_2
  	LDA	Reaper2_X
   	CMP	#21
   	BCS	.skip48OR_2
.condpart158_2
   	LDA	#0
   	STA	Player2Counter_Sprite
   	sta	temp7
   	lda	#>(.PlayerStand-1)
  	pha
   	lda	#<(.PlayerStand-1)
   	pha
   	lda	temp7
   	pha
   	pha
   	ldx	#7
   	jmp	BS_jsr
.skip48OR_2
end
	if e{3} then goto Dash_Left2
	asm
	LDA	Reaper2_X
   	CMP	#132
   	BCS	.skipL0287_3
   	CLC
   	ADC	#6
   	STA	Reaper2_X
   	LDA	Player2Counter_Sprite
  	CLC
   	ADC	#2
   	CMP	#23
   	BCC	.gggg1
   	LDA	#0
.gggg1 
  	STA	Player2Counter_Sprite
.skipL0287_3
	LDA	Player2Counter_Sprite
	lsr
   	lsr
   	lsr
   	STA	temp4
end
	player0y=Reaper2_Y+7
		goto Attack_Player_Dash bank7

Dash_Left2
	asm
	LDA	Reaper2_X
   	CMP	#21
   	BCC	.skipL0287_4
   	SEC
   	SBC	#6
   	STA	Reaper2_X
   	LDA	Player2Counter_Sprite
  	CLC
   	ADC	#2
   	CMP	#23
   	BCC	.gggg2
   	LDA	#0
.gggg2
   	STA	Player2Counter_Sprite
.skipL0287_4
	LDA	Player2Counter_Sprite
	lsr
   	lsr
   	lsr
   	STA	temp4
end
		player0y=Reaper2_Y+7
		goto Attack_Player_Dash bank7

Jump_2
	AUDV1=7: AUDC1=7: AUDF1=1
	Player2Counter_Jump=10: e{5}=1
	player0y=Reaper2_Y+7
	goto Common_Jump_Up bank7

Duck_2
	asm
  	LDA	e
	AND	#2
	BEQ	.skip160then_2
   	LDA	Life2
	CMP	MaxLife
	BCS	.skip160then_2	
	SED
   	CLC
   	ADC	#1
   	STA	Life2
   	CLD
	LDA	#$1e
   	STA	player1scorecolor
.skip160then_2
end

	goto Player_Duck bank7



 bank 4 

EndMusic
	duration=duration-1:if HowWhite>$00 then dec HowWhite=HowWhite-$01
	COLUBK=HowWhite
	if duration>0 then goto TextLoop bank6
	temp4=sread(Music4)
	if temp4=255 then duration=1: goto MusicSetup4
	if temp4=0 then AUDV0=0 else AUDC0=1: AUDV0=8: AUDF0=temp4

	temp4=sread(Music4)
	AUDV1=temp4
	if temp4>6 then HowWhite=$0e
	AUDF1=sread(Music4)

	AUDC1=7
	duration=5
	goto TextLoop bank6
MusicSetup4
	sdata Music4 = a
	20
	7,13
	0
	7,13
	
	20
	7,13
	0
	7,13
	
	20
	7,13
	0
	7,13
	
	20
	7,13
	0
	7,13
	
	20
	7,13
	0
	7,13
	
	20
	7,13
	0
	7,13
	
	20
	7,13
	0
	7,13
	
	20
	7,13
	0
	7,13
	
	20
	7,13
	0
	7,13
	
	19
	7,13
	0
	7,13
	
	19
	7,13
	0
	7,13
	
	19
	7,13
	0
	7,13
	
	17
	7,13
	0
	7,13
	
	17
	7,13
	0
	7,13
	
	17
	7,13
	0
	7,13
	
	19
	7,13
	0
	7,13
	
	19
	7,13
	0
	7,13
	
	19
	7,13
	0
	7,13
	
	20
	6,13
	0
	6,13
	
	20
	5,13
	0
	5,13
	
	20
	4,13
	0
	4,13
	
	19
	3,13
	0
	3,13
	
	19
	2,13
	0
	2,13
	
	19
	1,13
	0
	1,13
	


	26
	8,17
	0
	7,17
	
	26
	8,17
	0
	7,17
	
	26
	8,17
	0
	7,17
	
	26
	8,17
	0
	7,17
	
	20
	6,17
	0
	6,17
	
	20
	5,17
	0
	5,17
	
	20
	4,17
	0
	4,17
	
	19
	3,17
	0
	3,17
	
	19
	2,17
	0
	2,17
	
	19
	1,17
	0
	1,17
	


	28
	7,18
	0
	7,18
	28
	7,18
	0
	7,18
	28
	7,18
	0
	7,18
	28
	7,18
	0
	7,18
	28
	7,18
	0
	7,18
	28
	7,18
	0
	7,18
	
	20
	6,18
	0
	6,18
	20
	5,18
	0
	5,18
	20
	4,18
	0
	4,18
	
	19
	3,18
	0
	3,18
	19
	2,18
	0
	2,18
	19
	1,18
	0
	1,18
	
	20
	7,13
	0
	7,13
	
	20
	7,13
	0
	7,13
	
	20
	7,13
	0
	7,13
	
	20
	7,13
	0
	7,13
	
	20
	7,13
	0
	7,13
	
	20
	7,13
	0
	7,13
	
	20
	7,13
	0
	7,13
	
	20
	7,13
	0
	7,13
	
	20
	7,13
	0
	7,13
	
	19
	7,13
	0
	7,13
	
	19
	7,13
	0
	7,13
	
	19
	7,13
	0
	7,13
	
	12
	7,13
	0
	7,13
	
	12
	7,13
	0
	7,13
	
	12
	7,13
	0
	7,13
	
	19
	7,13
	0
	7,13
	
	19
	7,13
	0
	7,13
	
	19
	7,13
	0
	7,13
	
	20
	6,13
	0
	6,13
	
	20
	5,13
	0
	5,13
	
	20
	4,13
	0
	4,13
	
	19
	3,13
	0
	3,13
	
	19
	2,13
	0
	2,13
	
	19
	1,13
	0
	1,13
	


	26
	8,17
	0
	7,17
	
	26
	8,17
	0
	7,17
	
	26
	8,17
	0
	7,17
	
	26
	8,17
	0
	7,17
	
	20
	6,17
	0
	6,17
	
	20
	5,17
	0
	5,17
	
	20
	4,17
	0
	4,17
	
	19
	3,17
	0
	3,17
	
	19
	2,17
	0
	2,17
	
	19
	1,17
	0
	1,17
	


	28
	7,18
	0
	7,18
	28
	7,18
	0
	7,18
	28
	7,18
	0
	7,18
	28
	7,18
	0
	7,18
	28
	7,18
	0
	7,18
	28
	7,18
	0
	7,18
	
	20
	6,18
	0
	6,18
	20
	5,18
	0
	5,18
	20
	4,18
	0
	4,18
	
	19
	3,18
	0
	3,18
	19
	2,18
	0
	2,18
	19
	1,18
	0
	1,18
	255
end
	goto TextLoop bank6



 bank 5 
Nothing2
	PowerUp_Counter=160 
SomeCrazyStuff
	if e{1} then PowerUp_Counter=PowerUp_Counter-1
Its5
	
	if PowerUp_Counter=0 then player5y=160: goto No_Catch
	asm
   	LDA	#7
   	CMP	PowerUp_Type
   	BCS	.skipL0309_1
	STA	PowerUp_Type


.skipL0309_1
end


	on PowerUp_Type goto Power_0 Power_1 Power_2 NoDisappear Power_4 Power_5 Power_6 Power_7

Power_0
	COLUP5=COLUP5+1
 	player5:
 	%00011000
 	%00011000
 	%00111100
 	%00111100
 	%00111100
 	%00111100
 	%01111110
 	%01111110
 	%11111111
 	%11111111
 	%01111110
 	%01111110
 	%00111100
 	%00111100
 	%00111100
 	%00111100
 	%00011000
 	%00011000
end
	NUSIZ5=$07

 	asm  
	LDA	e
     	LSR
     	BCC	.skipL010_24
  	LDA	w
     	AND	#32
   	BNE	.DFD
.condpart1565
    	jmp	.Shiiiit
.skipL010_24
	LDA	w
     	AND	#32
     	BNE	.condpart1565
.DFD

.skip165then_1
	LDA	player0x
   	SEC
   	SBC	#6
   	STA	player5x
   	LDA	player0y
   	SEC
   	SBC	player0height
   	CLC
   	ADC	#18
   	STA	player5y
end


GotoKillthem
	asm
 	LDY	#0
	LDA	player5y
   	SEC
   	SBC	#9
   	STA	temp4
   	LDA	player1y
   	SEC
   	SBC	#6
   	STA	temp2
	CMP	temp4
   	BCS	.skipL0324_1
  	LDA	temp4
  	SEC
   	SBC	temp2
   	jmp	.skipelse17_1
.skipL0324_1
	SEC
   	SBC	temp4
.skipelse17_1
	STA	temp5
	LDA	player1x
   	SEC
 	SBC	#6
   	STA	temp2

   	CMP	player5x
   	BCC	.skipL0326_1
   	SEC
   	SBC	player5x
   	jmp	.skipelse18_1
.skipL0326_1
   	LDA	player5x
   	SEC
   	SBC	temp2
.skipelse18_1
	STA	temp4
   	CMP	#14
   	BCS	.SecondOne
  	LDA	#10
   	CMP	temp5
   	BCC	.SecondOne
	LDY	#1
end


	player1y=120
	if !w{5}  then dec player2score=player2score+$01 else dec player3score=player3score+$01 

SecondOne
	asm
 	LDA	player5y
   	SEC
   	SBC	#9
   	STA	temp4
   	LDA	player2y
   	SEC
   	SBC	#6
   	STA	temp2
	CMP	temp4
   	BCS	.skipL0324_2
  	LDA	temp4
  	SEC
   	SBC	temp2
   	jmp	.skipelse17_2
.skipL0324_2
	SEC
   	SBC	temp4
.skipelse17_2
	STA	temp5
	LDA	player2x
   	SEC
 	SBC	#6
   	STA	temp2

   	CMP	player5x
   	BCC	.skipL0326_2
   	SEC
   	SBC	player5x
   	jmp	.skipelse18_2
.skipL0326_2
   	LDA	player5x
   	SEC
   	SBC	temp2
.skipelse18_2
	STA	temp4
   	CMP	#14
   	BCS	.ThirdOne
  	LDA	#10
   	CMP	temp5
   	BCC	.ThirdOne
	LDY	#1
end
	player2y=120
	if !w{5}  then dec player2score=player2score+$01 else dec player3score=player3score+$01 

ThirdOne
	asm
   	LDA	player5y
   	SEC
   	SBC	#9
  	STA	temp4
   	LDA	player3y
   	SEC
   	SBC	#4
   	STA	temp2
   	CMP	temp4
  	BCS	.skipL0338_1
   	LDA	temp4
   	SEC
   	SBC	temp2
   	jmp	.skipelse23_11
.skipL0338_1
   	SEC
   	SBC	temp4
.skipelse23_11
	STA	temp5

   	LDA	player3x
   	SEC
   	SBC	#6
   	STA	temp2
	CMP	player5x
   	BCC	.skipL0340_1
   	SEC
  	SBC	player5x
	jmp	.skipelse24_111
.skipL0340_1
   	LDA	player5x
	SEC
  	SBC	temp2
.skipelse24_111
	STA	temp4

	CMP	#14
	BCS	.FourthOne
   	LDA	#10
   	CMP	temp5
   	BCC	.FourthOne
	LDY	#1
end
  	player3y=120
	if !w{5}  then dec player2score=player2score+$01 else dec player3score=player3score+$01 

FourthOne
	asm
   	LDA	player5y
   	SEC
   	SBC	#9
  	STA	temp4
   	LDA	player4y
   	SEC
   	SBC	#4
   	STA	temp2
   	CMP	temp4
  	BCS	.skipL0338_2
   	LDA	temp4
   	SEC
   	SBC	temp2
   	jmp	.skipelse23_22
.skipL0338_2
   	SEC
   	SBC	temp4
.skipelse23_22
	STA	temp5

   	LDA	player4x
   	SEC
   	SBC	#6
   	STA	temp2
	CMP	player5x
   	BCC	.skipL0340_2
   	SEC
  	SBC	player5x
	jmp	.skipelse24_22
.skipL0340_2
   	LDA	player5x
	SEC
  	SBC	temp2
.skipelse24_22
	STA	temp4

	CMP	#14
	BCS	.EnemyReaper
   	LDA	#10
   	CMP	temp5
   	BCC	.EnemyReaper
	LDY	#1
end

	
	player4y=120
	if !w{5}  then dec player2score=player2score+$01 else dec player3score=player3score+$01 
EnemyReaper
	asm
	LDA	w
  	AND	#32
	BNE	.EnemyReaper2
end

	if o{3} then goto No_Catch
	asm
   	LDA	Reaper2_Y
   	CMP	player5y
   	BCS	.skipL0353_1
   	LDA	player5y
   	SEC
   	SBC	Reaper2_Y
  	jmp	.skipelse29_1
.skipL0353_1
  	SEC
  	SBC	player5y
.skipelse29_1
   	STA	temp5

   	LDA	Reaper2_X
   	SEC
   	SBC	#6
   	STA	temp2

   	CMP	player5x
   	BCC	.skipL0355_1
   	SEC
   	SBC	player5x
   	jmp	.skipelse30_1
.skipL0355_1
	LDA	player5x
   	SEC
  	SBC	temp2
.skipelse30_1
   	STA	temp4
   	CMP	#16
	BCC	.Nope1_1
	jmp	.No_Catch
.Nope1_1
   	LDA	#14
   	CMP	temp5
   	BCS	.Nope2_1
	jmp	.No_Catch
.Nope2_1
	LDY	#1
end	
	if Life2>0 && !o{4} then dec Life2=Life2-$01
	goto No_Catch

EnemyReaper2
	if o{4} then goto No_Catch

	asm
   	LDA	Reaper1_Y
   	CMP	player5y
   	BCS	.skipL0353_2
   	LDA	player5y
   	SEC
   	SBC	Reaper1_Y
  	jmp	.skipelse29_2
.skipL0353_2
  	SEC
  	SBC	player5y
.skipelse29_2
   	STA	temp5

   	LDA	Reaper1_X
   	SEC
   	SBC	#6
   	STA	temp2

   	CMP	player5x
   	BCC	.skipL0355_2
   	SEC
   	SBC	player5x
   	jmp	.skipelse30_2
.skipL0355_2
	LDA	player5x
   	SEC
  	SBC	temp2
.skipelse30_2
   	STA	temp4

   	CMP	#16
	BCC	.Nope1_2
	jmp	.No_Catch
.Nope1_2
   	LDA	#14
   	CMP	temp5
   	BCS	.Nope2_2
	jmp	.No_Catch
.Nope2_2
	LDY	#1
end	
	
	if Life1>0 && !o{3} then dec Life1=Life1-$01 
	goto No_Catch
Shiiiit
	player5y=120: goto No_Catch

	
Power_1
	player5y=120
	if w{5} then goto Double_2 

	if e{0} then goto No_Catch
 	NUSIZ0=$32
	asm
   	LDA	#98
   	CMP	Reaper1_X
	BCS	.skipL0371_11
	STA	Reaper1_X
.skipL0371_11
	CMP	Shoot1_X
	BCS	.skipL0372_11
   	LDA	#160
   	STA	Shoot1_Y
   	LDA	o
   	AND	#127
   	AND	#223
   	STA	o
.skipL0372_11

end
	goto No_Catch
Double_2
	if !e{0} then goto No_Catch
 	NUSIZ0=$32

	asm
   	LDA	#98
   	CMP	Reaper2_X
	BCS	.skipL0371_22
	STA	Reaper2_X
.skipL0371_22
	CMP	Shoot2_X
	BCS	.skipL0372_22
   	LDA	#160
   	STA	Shoot2_Y
   	LDA	s
   	AND	#254
   	STA	s
   	LDA	o
   	AND	#191
   	STA	o
.skipL0372_22

end

	goto No_Catch
Power_2
	player5y=120

	if w{5} then goto Homing_2
	asm
	LDA	e
  	LSR
   	BCS	.condpart211_11
   	BIT	o
   	BMI	.skip63OR_1
.condpart211_11
   	jmp	.No_Catch
.skip63OR_1
   	LDA	Reaper2_Y
   	SEC
   	SBC	#10
   	STA	temp4
   	CMP	Shoot1_Y
   	BCC	.skipL0383_1
  	SEC
   	SBC	Shoot1_Y
	jmp	.skipelse33_1
.skipL0383_1
   	LDA	Shoot1_Y
   	SEC
   	SBC	temp4
.skipelse33_1
	STA	temp5
   	CMP	#4
   	BCS	.skipL0384_1
   	jmp	.No_Catch
.skipL0384_1
   	LDA	Shoot1_Y
   	CMP	temp4
   	BCC	.skipL0385_1
   	SEC
   	SBC	#4
   	jmp	.skipelse34_1
.skipL0385_1
   	CLC
   	ADC	#4
.skipelse34_1
	STA	Shoot1_Y
end

	goto No_Catch
Homing_2
	asm
	LDA	e
  	LSR
   	BCC	.condpart211_22
	LDA	s
   	LSR
   	BCS	.skip63OR_2
.condpart211_22
   	jmp	.No_Catch
.skip63OR_2
   	LDA	Reaper1_Y
   	SEC
   	SBC	#10
   	STA	temp4
   	CMP	Shoot2_Y
   	BCC	.skipL0383_2
  	SEC
   	SBC	Shoot2_Y
	jmp	.skipelse33_2
.skipL0383_2
   	LDA	Shoot2_Y
   	SEC
   	SBC	temp4
.skipelse33_2
	STA	temp5
   	CMP	#4
   	BCS	.skipL0384_2
   	jmp	.No_Catch
.skipL0384_2
   	LDA	Shoot2_Y
   	CMP	temp4
   	BCC	.skipL0385_2
   	SEC
   	SBC	#4
   	jmp	.skipelse34_2
.skipL0385_2
   	CLC
   	ADC	#4
.skipelse34_2
	STA	Shoot2_Y
end

	goto No_Catch

	
Power_4

	asm
	LDA	w
   	AND	#32
   	BNE	.w5is1
	LDA	o
   	AND	#32
   	BNE	.NoDisappear
 	LDA	e
   	LSR
   	BCS	.NoDisappear
	jmp	.Disappear

.w5is1
	BIT	o
   	BVS	.NoDisappear
	LDA	e
   	LSR
   	BCC	.NoDisappear
.Disappear
end	
	player0:
	%00
	%00
end
NoDisappear



	player5y=120: goto No_Catch

Power_5
	player5y=120: COLUBK=$0e
	asm
  	LDA	Life2
   	CMP	Life1
   	BCS	.skipL0398_1
	SED
   	LDA	Life1
   	SEC
   	SBC	Life2
      	jmp	.skipelse37_111
.skipL0398_1
     	SEC
   	SBC	Life1
.skipelse37_111
	lsr
   	STA	temp4
	SED
  	LDA	Life1
   	CMP	Life2
	BCC	.skipL0400_11
   	SEC
   	SBC	temp4
   	jmp	.skipelse38_11
.skipL0400_11
  	CLC
   	ADC	temp4
.skipelse38_11
  	STA	Life2
  	STA	Life1
   	LDA	Kills1
	CMP	Kills2
	BCC	.skipL0402_1
 	SEC
  	SBC	Kills2 
   	jmp	.skipelse39_11
.skipL0402_1
   	LDA	Kills2
   	SEC
   	SBC	Kills1
.skipelse39_11
	lsr
 	STA	temp4
   	LDA	Kills1
  	CMP	Kills2
  	BCC	.skipL0404_12
  	SEC
   	SBC	temp4
	jmp	.skipelse40_1
.skipL0404_12

 	CLC
   	ADC	temp4
.skipelse40_1
	STA	Kills1
	STA	Kills2
	CLD
end
	HouseHeight=0:  playfield:
	...............
	...............
	...............
	...............
	........X......
	....XX..XX.....
	.XXXXX..XXXXX..
	.X.X.X..X.X.X..
	.XXXXX..XXXXX..
	.X.X.X..X.X.X..
	.XXXXX..XXXXX..
	.X.X.X..X.X.X..
	.XXXXX..XXXXX..
	.X.X.X..X.X.X..
	.XXXXX..XXXXX..
	.X.X.X..X.X.X..
	.XXXXX..XXXXX..
	.X.X.X..X.X.X..
	.XXXXX..XXXXX..
	.X..XX..XX..X..
	.X..XX..XX..X..
	XXXXXXXXXXXXXXX
end
	asm
	LDA	w
   	AND	#247
      	AND	#239
   	STA	w
end
Power_6
	COLUP5=COLUP5+1
 	if Enemy_Sprite_Counter=0 then player5:
 	%00000000
 	%00000000
 	%00011000
 	%01111110
 	%01011010
 	%01111110
 	%11100111
 	%10011001
 	%10111101
 	%11111111
 	%01111110
 	%00011000
end
	
	asm
	LDA	Enemy_Sprite_Counter
   	CMP	#1
   	BEQ	.condpart232_1
	CMP	#3
	BNE	.gogogoo
.condpart232_1
end
 	player5:
 	%00000000
 	%00011000
 	%01111110
 	%01000010
 	%01000010
 	%01111110
 	%11100111
 	%10011001
 	%10111101
 	%11111111
 	%01111110
 	%00011000
end
gogogoo
 	if Enemy_Sprite_Counter=2 then player5:
 	%00011000
 	%01111110
 	%01000010
 	%00011000
 	%01000010
 	%01111110
 	%11100111
 	%10011001
 	%10111101
 	%11111111
 	%01111110
 	%00011000
end
	if !w{5} then goto Follow_player_2
	asm
	LDA	Reaper1_X
	CLC
	ADC	#6
	STA	temp4
	CMP	player5x
	BCS	.skipL0414_12
   	DEC	player5x
.skipL0414_12
	LDA	player5x
   	CMP	temp4
   	BCS	.skipL0413_12
	INC	player5x
.skipL0413_12
 
   	LDA	Reaper1_Y
   	SBC	player0height
   	CLC
   	ADC	#16
   	STA	temp5
	CMP	player5y
	BCS	.skipL0416_12
	DEC	player5y
.skipL0416_12
	LDA	player5y
   	CMP	temp5
	BCS	.skipL0415_12
 	INC	player5y
.skipL0415_12
end
	goto GotoKillthem

Follow_player_2
	asm
	LDA	Reaper2_X
	CLC
	ADC	#6
	STA	temp4
	CMP	player5x
	BCS	.skipL0414_123
   	DEC	player5x
.skipL0414_123
	LDA	player5x
   	CMP	temp4
   	BCS	.skipL0413_123
	INC	player5x
.skipL0413_123
 
   	LDA	Reaper2_Y
   	SBC	player0height
   	CLC
   	ADC	#16
   	STA	temp5
	CMP	player5y
	BCS	.skipL0416_123
	DEC	player5y
.skipL0416_123
	LDA	player5y
   	CMP	temp5
	BCS	.skipL0415_123
 	INC	player5y
.skipL0415_123
end
	goto GotoKillthem
Power_7

	player5y=120 
	asm
	LDA	w
  	AND	#32
   	BNE	.Player2_BOOM
end
	COLUBK=$42

	asm
	SED
	LDA	player2score
   	CLC
	ADC	#$01
   	LDX		#120
   	CPX	player1y
   	BCC	.skipL0428_1
      	STA	player2score
.skipL0428_1
   	CPX	player2y
   	BCC	.skipL0429_1
  	STA	player2score
.skipL0429_1
  	CPX	player3y
   	BCC	.skipL0430_12
	STA	player2score
.skipL0430_12
   	CPX	player4y
  	BCC	.skipL0431_1
	STA	player2score
.skipL0431_1
	CLD
end

	player1score=$00: AUDC0=2: AUDF0=9: AUDV0=9 
	goto Shitstorm
Player2_BOOM
	COLUBK=$82
	asm
	SED
	LDA	player3score
   	CLC
	ADC	#$01
   	LDX		#120
   	CPX	player1y
   	BCC	.skipL0428_12
      	STA	player3score
.skipL0428_12
   	CPX	player2y
   	BCC	.skipL0429_12
  	STA	player3score
.skipL0429_12
  	CPX	player3y
   	BCC	.skipL0430_122
	STA	player3score
.skipL0430_122
   	CPX	player4y
  	BCC	.skipL0431_12
	STA	player3score
.skipL0431_12
	CLD
end




	player0score=$00: AUDC0=2: AUDF0=9: AUDV0=9 
Shitstorm
	player1y=130:  player2y=130: player3y=130: player4y=130 

	if PowerUp_Counter=2 then HouseHeight=HouseHeight+1:  goto ChangePF bank7
No_Pretty_Fly
	asm
   	LDA	w
   	AND	#247
  	AND	#239
   	STA	w

.No_Catch
	
	CPY	#1
	BNE	.NO_SOUNDZ
	LDA	#9
	STA	AUDV1
	LDA	#3
	STA	AUDC1
	LDA	#5
	STA	AUDF1
.NO_SOUNDZ


	LDA	#4
	CLC
	ADC	player0height
	CMP	player0y
	BCC	.NotSmaller
	STA	player0y
.NotSmaller	
end
	
	missile1y=160: 	bally=160
	drawscreen
	asm
	LDA	MaxKill
   	SEC
   	SBC	#1
	CMP	Kills1
   	BCC	.condpart171_33
   	CMP	Kills2
   	BCS	.skip55OR_18
.condpart171_33
   	sta	temp7
   	lda	#>(.Ending-1)
   	pha
   	lda	#<(.Ending-1)
   	pha
   	lda	temp7
   	pha
   	
   	pha
   	ldx	#6
   	jmp	BS_jsr
.skip55OR_18

	LDA	#0
  	CMP	PowerUp_Counter
  	BCS	.skipL0649_197
  	LDA	o
  	AND	#247
	AND	#239
	STA	o
.skipL0649_197
  	LDX	#88
	LDY	#122
  	CPX	player3y
  	BCS	.skipL0650_876
  	LDA	w
  	AND	#247
  	STA	w
  	STY	player3y
.skipL0650_876
  	CPX	player4y
  	BCS	.skipL0651_876
  	LDA	w
  	AND	#239
  	STA	w
	STY	player4y
.skipL0651_876
end





MusicBox2

	duration=duration-1
	if duration >0 then goto GameLoop bank3

	asm
	ldx	#Music2
	lda	(0,x)
	inc	0,x
	bne	*+4
	inc	1,x
	STA	temp4
	CMP	#255
	BNE	.skipL0546_1

	LDA	#1
	STA	duration
	jmp	.MusicSetup3

.skipL0546_1
	LDA	temp4
	CMP	#0
	BNE	.skipL0547_1

	LDX	#0
	STX	AUDV0
	STX	AUDF0
	jmp	.Channel1_3

.skipL0547_1
	STA	AUDV0
	CMP	#8
	BEQ	.condpart417_1
.skipL0548_1
	LDA	temp4
	CMP	#2
	BNE	.skip121OR_1
.condpart417_1
	LDA	#1

	jmp	.skipelse38_1
.skip121OR_1
	LDA	#7

.skipelse38_1
	STA	AUDC0


end

	AUDF0=sread(Music2)
Channel1_3
	asm
	ldx	#Music2
	lda	(0,x)
	inc	0,x
	bne	*+4
	inc	1,x
	STA	temp5
	CMP	#0

	BNE	.skipL0551_1
	LDX	#0
	STX	AUDV1
	STX	AUDF1
	jmp	.ChannelNO_3
.skipL0551_1
	STA	AUDV1

	CMP	#8
	BEQ 	.condpart420_1
	CMP	#2
	BNE	.skip122OR_1
.condpart420_1
	LDA	#1
	jmp	.skipelse39_1
.skip122OR_1
	LDA	#7
.skipelse39_1
	STA	AUDC1


end

	AUDF1=sread(Music2)
ChannelNO_3

	duration=sread(Music2)
	goto GameLoop bank3

MusicSetup3
	sdata Music2 = a

	8,10
	7,10
	2
	2,10
	7,10
	2

	8,10
	7,10
	2
	2,10
	7,10
	2

	8,10
	7,10
	2
	2,10
	7,10
	2


	8,12
	7,11
	2
	2,12
	7,11
	2
	8,12
	7,11
	2
	2,12
	7,11
	2
	8,12
	7,11
	2
	2,12
	7,11
	2


	8,13
	7,12
	2
	2,13
	7,12
	2
	8,13
	7,12
	2
	2,13
	7,12
	2
	8,13
	7,12
	2
	2,13
	7,12
	2



	8,14
	7,14
	2
	2,14
	7,14
	2
	8,14
	7,14
	2
	2,14
	7,14
	2
	8,14
	7,14
	2
	2,14
	7,14
	2


	8,16
	7,16
	2
	2,16
	7,16
	2
	8,16
	7,16
	2
	2,16
	7,16
	2
	8,16
	7,16
	2
	2,16
	7,16
	2


	8,17
	7,17
	2
	2,17
	7,17
	2
	8,17
	7,17
	2
	2,17
	7,17
	2
	8,17
	7,17
	2
	2,17
	7,17
	2

	8,22
	7,21
	2
	2,22
	7,21
	2
	8,22
	7,21
	2
	2,22
	7,21
	2
	8,22
	7,21
	2
	2,22
	7,21
	2


	8,23
	7,22
	2
	2,23
	7,22
	2
	8,23
	7,22
	2
	2,23
	7,22
	2
	8,23
	7,22
	2
	2,23
	7,22
	2


	8,25
	7,25
	40
	7,25
	6,25
	2
	6,25
	5,25
	2
	5,25
	4,25
	2
	4,25
	2,25
	2
	2,25
	2,25
	2

	8,10
	8,10
	2
	2,10
	8,10
	2
	8,10
	8,10
	2
	2,10
	8,10
	2
	8,10
	7,10
	2
	2,10
	7,10
	2


	8,12
	7,12
	2
	2,12
	7,12
	2
	8,12
	7,12
	2
	2,12
	7,12
	2
	8,12
	7,12
	2
	2,12
	7,12
	2


	8,16
	7,16
	2
	2,16
	7,16
	2
	8,16
	7,16
	2
	2,16
	7,16
	2
	8,16
	7,16
	2
	2,16
	7,16
	2

	8,17
	7,17
	2
	2,17
	7,17
	2
	8,17
	7,17
	2
	2,17
	7,17
	2
	8,17
	7,17
	2
	2,17
	7,17
	2


	8,22
	7,21
	2
	2,22
	7,21
	2
	8,22
	7,21
	2
	2,22
	7,21
	2
	8,22
	7,21
	2
	2,22
	7,21
	2


	8,23
	7,22
	2
	2,23
	7,22
	2
	8,23
	7,22
	2
	2,23
	7,22
	2
	8,23
	7,22
	2
	2,23
	7,22
	2



	8,22
	7,21
	5
	8,23
	7,22
	5
	8,26
	7,28
	5
	8,23
	7,22
	5
	8,25
	7,24
	5
	8,26
	7,28
	5


	8,22
	7,21
	5
	8,23
	7,22
	5
	8,26
	7,25
	5

	8,19
	7,19
	5
	8,20
	7,20
	5
	8,26
	7,25
	5

	8,22
	7,21
	5
	8,23
	7,22
	5
	8,26
	7,25
	5

	8,23
	7,22
	5
	8,24
	7,24
	5
	8,26
	7,25
	5

	8,22
	7,21
	5
	8,23
	7,22
	5
	8,26
	7,25
	5

	8,18
	7,18
	20

	8,22
	7,21
	5
	8,23
	7,22
	5
	8,26
	7,28
	5
	8,23
	7,22
	5
	8,25
	7,24
	5
	8,26
	7,28
	5


	8,22
	7,21
	5
	8,23
	7,22
	5
	8,26
	7,25
	5

	8,19
	7,19
	5
	8,20
	7,20
	5
	8,26
	7,25
	5

	8,22
	7,21
	5
	8,23
	7,22
	5
	8,26
	7,25
	5

	8,23
	7,22
	5
	8,24
	7,24
	5
	8,26
	7,25
	5

	8,22
	7,21
	5
	8,23
	7,22
	5
	8,26
	7,25
	5

	8,18
	7,18
	20

	8,26
	7,25
	3
	2,26
	1,25
	2
	8,26
	7,25
	3
	2,26
	1,25
	2
	8,26
	7,25
	3
	2,26
	1,25
	2
	8,26
	7,25
	3
	2,26
	1,25
	2
	8,26
	7,25
	3
	2,26
	1,25
	2
	8,26
	7,25
	3
	2,26
	1,25
	2
	8,26
	7,25
	3
	2,26
	1,25
	2
	8,26
	7,25
	3
	2,26
	1,25
	2
	8,26
	7,25
	3
	2,26
	1,25
	2
	8,26
	7,25
	3
	2,26
	1,25
	2
	8,26
	7,25
	3
	2,26
	1,25
	2
	8,26
	7,25
	3
	2,26
	1,25
	2

	8,16
	7,16
	5
	8,17
	7,17
	5
	8,14
	7,14
	5
	8,16
	7,16
	5



	8,17
	7,17
	3
	2,17
	1,17
	2
	8,17
	7,17
	3
	2,17
	1,17
	2
	8,17
	7,17
	3
	2,17
	1,17
	2
	8,17
	7,17
	3
	2,17
	1,17
	2
	8,17
	7,17
	3
	2,17
	1,17
	2
	8,17
	7,17
	3
	2,17
	1,17
	2
	8,17
	7,17
	3
	2,17
	1,17
	2
	8,17
	7,17
	3
	2,17
	1,17
	2

	8,16
	7,16
	3
	2,16
	1,16
	2
	8,16
	7,16
	3
	2,16
	1,16
	2

	8,17
	7,17
	3
	2,17
	1,17
	2
	8,17
	7,17
	3
	2,17
	1,17
	2

	8,14
	7,14
	3
	2,14
	1,14
	2

	8,17
	7,17
	3
	2,17
	1,17
	2
	8,17
	7,17
	3
	2,17
	1,17
	2

	8,26
	7,25
	3
	2,26
	1,25
	2
	8,26
	7,25
	3
	2,26
	1,25
	2
	8,26
	7,25
	3
	2,26
	1,25
	2
	8,26
	7,25
	3
	2,26
	1,25
	2
	8,26
	7,25
	3
	2,26
	1,25
	2
	8,26
	7,25
	3
	2,26
	1,25
	2
	8,26
	7,25
	3
	2,26
	1,25
	2
	8,26
	7,25
	3
	2,26
	1,25
	2
	8,26
	7,25
	3
	2,26
	1,25
	2
	8,26
	7,25
	3
	2,26
	1,25
	2
	8,26
	7,25
	3
	2,26
	1,25
	2
	8,26
	7,25
	3
	2,26
	1,25
	2

	8,16
	7,16
	5
	8,17
	7,17
	5
	8,14
	7,14
	5
	8,16
	7,16
	5



	8,17
	7,17
	3
	2,17
	1,17
	2
	8,17
	7,17
	3
	2,17
	1,17
	2
	8,17
	7,17
	3
	2,17
	1,17
	2
	8,17
	7,17
	3
	2,17
	1,17
	2
	8,17
	7,17
	3
	2,17
	1,17
	2
	8,17
	7,17
	3
	2,17
	1,17
	2
	8,17
	7,17
	3
	2,17
	1,17
	2
	8,17
	7,17
	3
	2,17
	1,17
	2

	8,16
	7,16
	3
	2,16
	1,16
	2
	8,16
	7,16
	3
	2,16
	1,16
	2

	8,17
	7,17
	3
	2,17
	1,17
	2
	8,17
	7,17
	3
	2,17
	1,17
	2

	8,14
	7,14
	3
	2,14
	1,14
	2

	8,17
	7,17
	3
	2,17
	1,17
	2
	8,17
	7,17
	3
	2,17
	1,17
	2



	8,26
	7,25
	8
	2,26
	1,25
	2
	8,26
	7,25
	8
	2,26
	1,25
	2
	8,26
	7,25
	8
	2,26
	1,25
	2


	8,19
	7,19
	10

	8,14
	7,14
	10

	8,15
	7,15
	10

	8,19
	7,19
	10

	8,13
	7,13
	10
	8,14
	7,14
	10

	8,19
	7,19
	10

	8,11
	7,5
	10
	8,12
	7,6
	10




	8,8
	7,7
	10
	8,9
	7,8
	10

	8,26
	7,25
	8
	2,26
	1,25
	2
	8,26
	7,25
	8
	2,26
	1,25
	2
	8,26
	7,25
	8
	2,26
	1,25
	2


	8,19
	7,19
	10

	8,14
	7,14
	10

	8,15
	7,15
	10

	8,19
	7,19
	10

	8,13
	7,13
	10
	8,14
	7,14
	10

	8,19
	7,19
	10

	8,11
	7,5
	10
	8,12
	7,6
	10




	8,8
	7,7
	10
	8,9
	7,8
	10

	8,26
	7,25
	8
	2,26
	1,25
	2
	8,26
	7,25
	8
	2,26
	1,25
	2
	8,26
	7,25
	8
	2,26
	1,25
	2


	8,19
	7,19
	10

	8,14
	7,14
	10

	8,15
	7,15
	10

	8,19
	7,19
	10

	8,13
	7,13
	10
	8,14
	7,14
	10

	8,19
	7,19
	10

	8,11
	7,5
	10
	8,12
	7,6
	10




	8,8
	7,7
	10
	8,9
	7,8
	10

	8,26
	7,25
	8
	2,26
	1,25
	2
	8,26
	7,25
	8
	2,26
	1,25
	2
	8,26
	7,25
	8
	2,26
	1,25
	2


	8,19
	7,19
	10

	8,14
	7,14
	10

	8,15
	7,15
	10

	8,19
	7,19
	10

	8,13
	7,13
	10
	8,14
	7,14
	10

	8,19
	7,19
	10

	8,11
	7,5
	10
	8,12
	7,6
	10


	8,8
	7,7
	10
	8,9
	7,8
	10




	
	8,26
	7,25
	3
	2,26
	1,25
	2
	8,26
	7,25
	3
	2,26
	1,25
	2
	8,26
	7,25
	3
	2,26
	1,25
	2
	8,26
	7,25
	3
	2,26
	1,25
	2
	8,26
	7,25
	3
	2,26
	1,25
	2
	8,26
	7,25
	3
	2,26
	1,25
	2
	8,26
	7,25
	3
	2,26
	1,25
	2
	8,26
	7,25
	3
	2,26
	1,25
	2
	8,26
	7,25
	3
	2,26
	1,25
	2
	8,26
	7,25
	3
	2,26
	1,25
	2
	8,26
	7,25
	3
	2,26
	1,25
	2
	8,26
	7,25
	3
	2,26
	1,25
	2


	8,25
	7,25
	3
	2,25
	1,25
	2
	8,26
	7,25
	3
	2,26
	1,25
	2
	8,22
	7,25
	3
	2,22
	1,25
	2
	8,25
	7,25
	3
	2,25
	1,25
	2



	8,25
	7,24
	3
	2,25
	1,24
	2
	8,25
	7,24
	3
	2,25
	1,24
	2
	8,25
	7,24
	3
	2,25
	1,24
	2
	8,25
	7,24
	3
	2,25
	1,24
	2
	8,25
	7,24
	3
	2,25
	1,24
	2
	8,25
	7,24
	3
	2,25
	1,24
	2
	8,25
	7,24
	3
	2,25
	1,24
	2
	8,25
	7,24
	3
	2,25
	1,24
	2
	8,25
	7,24
	3
	2,25
	1,24
	2
	8,25
	7,24
	3
	2,25
	1,24
	2
	8,25
	7,24
	3
	2,25
	1,24
	2
	8,25
	7,24
	3
	2,25
	1,24
	2
	8,25
	7,24
	3
	2,25
	1,24
	2
	8,25
	7,24
	3
	2,25
	1,24
	2
	8,25
	7,24
	3
	2,25
	1,24
	2
	8,25
	7,24
	3
	2,25
	1,24
	2



	8,19
	7,19
	3
	2,19
	1,19
	2
	8,19
	7,19
	3
	2,19
	1,19
	2
	8,19
	7,19
	3
	2,19
	1,19
	2
	8,19
	7,19
	3
	2,19
	1,19
	2
	8,19
	7,19
	3
	2,19
	1,19
	2
	8,19
	7,19
	3
	2,19
	1,19
	2
	8,19
	7,19
	3
	2,19
	1,19
	2
	8,19
	7,19
	3
	2,19
	1,19
	2
	8,19
	7,19
	3
	2,19
	1,19
	2
	8,19
	7,19
	3
	2,19
	1,19
	2
	8,19
	7,19
	3
	2,19
	1,19
	2
	8,19
	7,19
	3
	2,19
	1,19
	2
	
	8,18
	7,19
	3
	2,18
	1,19
	2
	8,19
	7,19
	3
	2,19
	1,19
	2
	8,16
	7,19
	3
	2,16
	1,19
	2



	8,18
	7,18
	3
	2,18
	1,18
	2
	8,18
	7,18
	3
	2,18
	1,18
	2
	8,18
	7,18
	3
	2,18
	1,18
	2
	8,18
	7,18
	3
	2,18
	1,18
	2
	8,18
	7,18
	3
	2,18
	1,18
	2
	8,18
	7,18
	3
	2,18
	1,18
	2
	8,18
	7,18
	3
	2,18
	1,18
	2
	8,18
	7,18
	3
	2,18
	1,18
	2
	8,18
	7,18
	3
	2,18
	1,18
	2
	8,18
	7,18
	3
	2,18
	1,18
	2
	8,18
	7,18
	3
	2,18
	1,18
	2
	8,18
	7,18
	3
	2,18
	1,18
	2
	8,18
	7,18
	3
	2,18
	1,18
	2



	8,19
	7,18
	3
	2,19
	1,18
	2
	8,18
	7,18
	3
	2,18
	1,18
	2
	8,16
	7,18
	3
	2,16
	1,18
	2



	255
end
	goto GameLoop bank3



 bank 6 
BullShit
	asm
	LDA	#88
	CMP	Shoot1_Y
	BCC	.MovePowerUp
	CMP	Shoot2_Y
	BCC	.MovePowerUp
	LDA	Shoot2_X
  	CMP	Shoot1_X
  	BCS	.OOO15
  	LDA	Shoot1_X
  	SEC
  	SBC	Shoot2_X
  	jmp	.skipelse20_15
.OOO15
 	SEC
	SBC	Shoot1_X
.skipelse20_15
  	STA	temp4

 	LDA	Shoot2_Y
  	CMP	Shoot1_Y
  	BCS	.skipL0547_15
  	LDA	Shoot1_Y
  	SEC
  	SBC	Shoot2_Y
	jmp	.skipelse21_15
.skipL0547_15
  	SEC
  	SBC	Shoot1_Y
.skipelse21_15
	STA	temp5
  	CMP	#4
  	BCS	.skip242then_1
  	LDA	temp4
	CMP	#6
	BCS	.skip242then_1
  	LDA	#120
  	STA	Shoot1_Y
  	STA	Shoot2_Y
.skip242then_1
end
MovePowerUp
	if player5y>119 || PowerUp_Counter>0 then goto NYET

 	NUSIZ5=$00
	asm
	BIT	w
  	BVS	.condpart238_18
  	INC	player5x
  	jmp	.skipelse19_18
.condpart238_18
  	DEC	player5x
.skipelse19_18

  	BIT	w
  	BVS	.skipL0545_18
	LDA	#138
  	CMP	player5x
  	BCC	.condpart242_18
.skipL0545_18
  	BIT	w
  	BVC	.skipL0546_18
	LDA	player5x
  	CMP	#30
  	BCS	.skipL0546_18
.condpart242_18
  	LDA	#120
  	STA	player5y
  	jmp	.NYET
.skipL0546_18

  
	BIT	w
  	BPL	.skipL0547_18
  	LDA	player5y
	CLC
	ADC	#1
	STA	player5y
  	CMP	#87
  	BCC	.skipelse20_18
 	LDA	w
  	AND	#127
  	STA	w
  	jmp	.skipelse20_18
.skipL0547_18
 	LDA	player5y
	SEC
	SBC	#1
	STA	player5y
  	CMP	#51
  	BCS	.skipelse20_18
    	LDA	w
 	ORA	#128
  	STA	w
.skipelse20_18


end


NYET

	if HouseHeight=7 then player3y=0: player4y=120: COLUP3=$00: COLUP4=$00: goto CantFall
	asm
	LDY	#0
end
	if w{3} then goto FallPerson_3
	asm
 	lda	rand
  	lsr
  	bcc	*+4
  	eor	#$B4
  	sta	rand
 	AND	#3
  	STA	temp4
 	lda	rand
  	lsr
  	bcc	*+4
  	eor	#$B4
  	sta	rand
	sta 	temp1
end
	asm
  	CMP	#252
  	BCC	.skipL0623_1
  	LDA	w
  	AND	#247
  	STA	w
	LDA	#120
  	STA	player3y
.skipL0623_1
	LDA	player3y
  	CMP	#120
  	BCS	.skipL0624_1
  	jmp	.JustDrawHim3
.skipL0624_1

end
	temp5=temp4+(rand&3)
	temp6=6-HouseHeight
	asm
	LDA	temp6
	CMP	temp5
   	BCS	.skipL0450_1
	STA	temp5
.skipL0450_1
   	CMP	temp6
   	BNE	.skipL0451_1
	LDA	e
  	AND	#2
  	BEQ	.skipL0451_1	
	LDA	#0
	STA	temp5
.skipL0451_1	

	LDA	temp5
  	asl
  	asl
  	asl
	CLC
  	ADC	#15
	STA	player3y
	CMP	#23
	BCS	.skip231then_1
  	LDA	HouseHeight
  	CMP	#0
  	BNE	.skip231then_1
  	LDA	#23
  	STA	player3y
.skip231then_1

 	lda	rand
  	lsr
	bcc	*+4
 	eor	#$B4
  	sta	rand
	AND	#7
 	CMP	#0
	BNE	.skipL0456_1
	LDA	#33
	jmp	.Done3x
.skipL0456_1
  	CMP	#1
  	BNE	.skipL0457_1
 	LDA	#41
	jmp	.Done3x
.skipL0457_1
  	CMP	#2
	BNE	.skipL0458_1
	LDA	#61
	jmp	.Done3x
.skipL0458_1
	CMP	#3
  	BNE	.skipL0459_1
	LDA	#69
	jmp	.Done3x
.skipL0459_1
	CMP	#4
  	BNE	.skipL0460_1
	LDA	#97
	jmp	.Done3x
.skipL0460_1
  	CMP	#5
	BNE	.skipL0461_1
  	LDA	#105
 	jmp	.Done3x
.skipL0461_1
  	CMP	#6
  	BNE	.skipL0462_1
 	LDA	#125
	jmp	.Done3x
.skipL0462_1
 	CMP	#7
 	BNE	.skipL0463_1

 	LDA	#133
.Done3x
	STA	player3x
.skipL0463_1
end							; 


	COLUP3=$1e
	

JustDrawHim3
	player3:
 	%1011101
 	%0111110
 	%0011100
 	%0100010
 	%0111110
 	%0101010
 	%0011100
end

	asm
	LDA	Reaper1_X
  	CLC
  	ADC	#12
  	STA	temp5
  	CMP	player3x
  	BCC	.skipL0631_1
 	SEC
  	SBC	player3x
  	jmp	.skipelse52_1
.skipL0631_1
  	LDA	player3x
  	SEC
  	SBC	temp5
.skipelse52_1
  	STA	temp6
	CMP	#12
	BCC	.Not12
	LDA	player3x
  	CMP	temp5
  	BCS	.SmallerTemp5					; 
end


	player3:
 	%0111100
 	%0111111
 	%0011100
 	%0111000
 	%0111110
 	%0110100
 	%0011000
end
	goto Person4
SmallerTemp5
	player3:
 	%0011110
 	%1111110
 	%0011100
 	%0001110
 	%0111110
 	%0010110
 	%0001100
end
	goto Person4
Not12
	if Reaper1_Y>player3y then  player3:
 	%0011100
 	%1111111
 	%0011100
 	%0111110
 	%0100010
 	%0111110
 	%0001000
end
	goto Person4

FallPerson_3
	if temp4>3 then temp4=0
	on temp4 goto Fall1_0 Fall1_1 Fall1_2 Fall1_3
Fall1_0
 	player3:
 	%00011100
 	%00010000
 	%00010000
 	%00010001
 	%11111010
 	%10111100
 	%10011110
 	%00011011
 	%00110111
 	%01001101
 	%00001011
 	%00000110
end
	goto Sounder1
Fall1_1
 	player3:
 	%01001110
 	%01110101
 	%01110111
 	%01110101
 	%01101110
 	%01111000
 	%01110000
 	%01101000
 	%01000110
 	%01000000
 	%01000000
 	%01110000
end
	goto Sounder1
Fall1_2

 	player3:
 	%01110000
 	%11111000
 	%11111110
 	%10101111
 	%01101111
 	%00100111
 	%00001011
 	%00010011
 	%00000111
 	%00001101
 	%01010001
 	%00100111
end
	goto Sounder1
Fall1_3

 	player3:
 	%00000011
 	%00000010
 	%00100010
 	%00101100
 	%00111100
 	%00111010
 	%00111001
 	%01110101
 	%10001001
 	%11111010
 	%10101000
 	%01110000
end
Sounder1
	asm
 	LDA	player3y
  	CMP	#16
  	BCS	.skipL0470_1
  	LDA	w
  	AND	#247
  	STA	w
  	LDA	#120
  	STA	player3y
	LDY	#1
	jmp 	.Person4
.skipL0470_1
  	lsr
  	lsr
  	lsr
	TAX
	dec	player3y
  	LDY	#2
end 
Person4
	if w{4} then goto FallPerson_4


	if temp1<4 then player4y=120: w{4}=0
	if player4y<120 then goto JustDrawHim4
	temp5=temp4+(rand&3)
	temp6=6-HouseHeight
	asm
	LDA	temp6
	CMP	temp5
   	BCS	.skipL0450_2
	STA	temp5
.skipL0450_2
   	CMP	temp6
   	BNE	.skipL0451_2
   	LDA	e
  	AND	#2
  	BEQ	.skipL0451_2	
	LDA	#0
	STA	temp5
.skipL0451_2	

	LDA	temp5
  	asl
  	asl
  	asl
	CLC
  	ADC	#15
	STA	player4y
	CMP	#23
	BCS	.skip231then_22
  	LDA	HouseHeight
  	CMP	#0
  	BNE	.skip231then_22
  	LDA	#23
  	STA	player4y
.skip231then_22


	LDA	temp5
  	asl
  	asl
  	asl
	CLC
  	ADC	#15
	STA	player4y
	CMP	#23
	BCS	.skip231then_2
  	LDA	HouseHeight
  	CMP	#0
  	BNE	.skip231then_2
  	LDA	#23
  	STA	player4y
.skip231then_2

 	lda	rand
  	lsr
	bcc	*+4
 	eor	#$B4
  	sta	rand
	AND	#7
 	CMP	#0
	BNE	.skipL0456_2
	LDA	#33
	jmp	.Done4x
.skipL0456_2
  	CMP	#1
  	BNE	.skipL0457_2
 	LDA	#41
	jmp	.Done4x
.skipL0457_2
  	CMP	#2
	BNE	.skipL0458_2
	LDA	#61
	jmp	.Done4x
.skipL0458_2
	CMP	#3
  	BNE	.skipL0459_2
	LDA	#69
	jmp	.Done4x
.skipL0459_2
	CMP	#4
  	BNE	.skipL0460_2
	LDA	#97
	jmp	.Done4x
.skipL0460_2
  	CMP	#5
	BNE	.skipL0461_2
  	LDA	#105
 	jmp	.Done4x
.skipL0461_2
  	CMP	#6
  	BNE	.skipL0462_2
 	LDA	#125
	jmp	.Done4x
.skipL0462_2
 	CMP	#7
 	BNE	.skipL0463_2
 	LDA	#133
.Done4x
	STA	player4x
.skipL0463_2
end							; 


	COLUP4=$1e
	

JustDrawHim4
	player4:
 	%1011101
 	%0111110
 	%0011100
 	%0100010
 	%0111110
 	%0101010
 	%0011100
end
	asm
	LDA	Reaper2_X
  	CLC
  	ADC	#12
  	STA	temp5
  	CMP	player4x
 	BCC	.skipL0590_1
  	SEC
  	SBC	player4x
	jmp	.skipelse24_113
.skipL0590_1
  	LDA	player4x
  	SEC
  	SBC	temp5
.skipelse24_113
	STA	temp6
	CMP	#12
  	BCC	.temp6smallerthan12_2
  	LDA	temp5
  	CMP	player4x
  	BCS	.temp5smaller_2
end
	player4:
 	%0111100
 	%0111111
 	%0011100
 	%0111000
 	%0111110
 	%0110100
 	%0011000
end
	goto CantFall
temp5smaller_2

	player4:
 	%0011110
 	%1111110
 	%0011100
 	%0001110
 	%0111110
 	%0010110
 	%0001100
end
	goto CantFall
temp6smallerthan12_2


	player4:
 	%0011100
 	%1111111
 	%0011100
 	%0111110
 	%0100010
 	%0111110
 	%0001000
end
	goto CantFall

FallPerson_4
	if temp4>3 then temp4=0
	on temp4 goto Fall2_0 Fall2_1 Fall2_2 Fall2_3
Fall2_0
 	player4:
 	%00011100
 	%00010000
 	%00010000
 	%00010001
 	%11111010
 	%10111100
 	%10011110
 	%00011011
 	%00110111
 	%01001101
 	%00001011
 	%00000110
end
	goto Sounder2
Fall2_1
 	player4:
 	%01001110
 	%01110101
 	%01110111
 	%01110101
 	%01101110
 	%01111000
 	%01110000
 	%01101000
 	%01000110
 	%01000000
 	%01000000
 	%01110000
end
	goto Sounder2

Fall2_2
 	player4:
 	%01110000
 	%11111000
 	%11111110
 	%10101111
 	%01101111
 	%00100111
 	%00001011
 	%00010011
 	%00000111
 	%00001101
 	%01010001
 	%00100111
end
	goto Sounder2
Fall2_3
 	player4:
 	%00000011
 	%00000010
 	%00100010
 	%00101100
 	%00111100
 	%00111010
 	%00111001
 	%01110101
 	%10001001
 	%11111010
 	%10101000
 	%01110000
end
Sounder2
	asm
 	LDA	player4y
  	CMP	#16
  	BCS	.skipL0470_2
  	LDA	w
  	AND	#239
  	STA	w
  	LDA	#120
  	STA	player4y
	LDY	#1
	jmp 	.CantFall
.skipL0470_2
  	lsr
  	lsr
  	lsr

	TAX
  	LDY	#2
	dec	player4y
end 

CantFall


	asm
	CPY	#1
	BNE	.NO_SOUNDZ2
  	LDA	#6
  	STA	AUDV0
  	LDA	#2
  	STA	AUDC0
  	LDA	#10
  	STA	AUDF0
	jmp	.NO_SOUNDZ3
.NO_SOUNDZ2
	CPY	#2
	BNE	.NO_SOUNDZ3
  	STX	AUDF0
  	LDA	#9
  	STA	AUDV0
  	LDA	#10
  	STA	AUDC0
.NO_SOUNDZ3


	lda 	NUSIZ0
	cmp 	#$20
	BEQ 	.Its20_1
	lda	#4
	sta 	temp1
	jmp 	DoneThat_1
.Its20_1
	lda 	#3
	sta 	temp1
	
DoneThat_1
end 

	asm
  	LDA	PowerUp_Type
  	CMP	#1
  	BNE	.DontDoThat

 	LDA	e
  	AND	#2
  	BEQ	.DontDoThat
  	LDA	#0
  	CMP	PowerUp_Counter
  	BCS	.DontDoThat
 	LDA	e
  	LSR
  	BCS	.SecondChance
	LDA	w
  	AND	#32
  	BEQ	.DoThatTemp1Shit
.SecondChance
	LDA	e
  	LSR
  	BCC	.DontDoThat
 	LDA	w
  	AND	#32
  	BEQ	.DontDoThat
.DoThatTemp1Shit
  	LDA	temp1
  	CLC
  	ADC	#16
  	STA	temp1

.DontDoThat
end

	if e{0} then goto Player2Damages
	if !o{5} then return otherbank
DoEvilThings_1
	asm
	LDA	missile0x
	CLC
	ADC	temp1
	STA	temp4
	LDY	#0
end

	if o{4}   then goto PeopleHurt1

	asm
   	LDA	Reaper2_X
  	CLC
  	ADC	#4
  	STA	temp2
	CMP	temp4
	BCS	.skipL0514_1
  	LDA	temp4
  	SEC
  	SBC	temp2
	jmp	.skipelse25_1
.skipL0514_1
	SEC
 	SBC	temp4
.skipelse25_1
	  STA	temp5

 	LDA	Reaper2_Y
	SEC
	SBC	#9
	STA	temp2
	CMP	missile0y
	BCS	.skipL0516_1
	LDA	missile0y
	SEC
  	SBC	temp2
  	jmp	.skipelse26_1
.skipL0516_1
  	SEC
  	SBC	missile0y
.skipelse26_1
	STA	temp6

 	LDA	temp1
  	CLC
  	ADC	#3
  	STA	temp2
end



	temp3=(rand&3)
	asm
	
	LDA	temp5
 	CMP	temp2
  	BCS	.skipL0520_1
  	LDA	temp6
  	CMP	#8
  	BCS	.skipL0520_1


 	SED
  	LDA	player1score
  	SEC
  	SBC	temp3
  	STA	player1score
  	CLD
  	LDY	#1
	BIT	o
  	BPL	.skipL0520_1
  	LDA	o
  	AND	#127
  	STA	o
  	LDA	#160
  	STA	Shoot1_Y
  	SED
  	LDA	player1score
  	SEC
  	SBC	#$05
  	STA	player1score
  	CLD


.skipL0520_1
end


PeopleHurt1
	asm
  	LDA	player1x
  	CLC
  	ADC	#4
	STA	temp2
  	CMP	temp4
  	BCS	.skipL0516_11
  	LDA	temp4
  	SEC
  	SBC	temp2
	jmp	.skipelse25_11
.skipL0516_11
  	SEC
  	SBC	temp4
.skipelse25_11
	STA	temp5
	LDA	player1y
  	SEC
  	SBC	#5
  	STA	temp2
	CMP	missile0y
  	BCS	.skipL0518_11
  	LDA	missile0y
  	SEC
  	SBC	temp2
	jmp	.skipelse26_11
.skipL0518_11
    	SEC
  	SBC	missile0y
.skipelse26_11
  	STA	temp6

  	CMP	#8
  	BCS	.skipL0519_11
  	LDA	temp5
  	CMP	#8
  	BCS	.skipL0519_11
	LDY	#1
  	LDA	#120
  	STA	player1y
  	SED
  	LDA	player2score
  	CLC
  	ADC	#$01
  	STA	player2score
  	CLD
	BIT	o
  	BPL	.skipL0519_11

  	LDA	o
  	AND	#127
  	STA	o
  	LDA	#160
  	STA	Shoot1_Y
.skipL0519_11
end

	asm
  	LDA	player2x
  	CLC
  	ADC	#4
	STA	temp2
  	CMP	temp4
  	BCS	.skipL0516_22
  	LDA	temp4
  	SEC
  	SBC	temp2
	jmp	.skipelse25_22
.skipL0516_22
  	SEC
  	SBC	temp4
.skipelse25_22
	STA	temp5
	LDA	player2y
  	SEC
  	SBC	#5
  	STA	temp2
	CMP	missile0y
  	BCS	.skipL0518_22
  	LDA	missile0y
  	SEC
  	SBC	temp2
	jmp	.skipelse26_22
.skipL0518_22
    	SEC
  	SBC	missile0y
.skipelse26_22
  	STA	temp6

  	CMP	#8
  	BCS	.skipL0519_22
  	LDA	temp5
  	CMP	#8
  	BCS	.skipL0519_22
  	LDY	#1
  	LDA	#120
  	STA	player2y
  	SED
  	LDA	player2score
  	CLC
  	ADC	#$01
  	STA	player2score
  	CLD
	BIT	o
  	BPL	.skipL0519_22

  	LDA	o
  	AND	#127
  	STA	o
  	LDA	#160
  	STA	Shoot1_Y
.skipL0519_22
end

	
	if w{3} then goto LookAt4_1

	asm
  	LDA	player3x
  	CLC
  	ADC	#4
	STA	temp2
  	CMP	temp4
  	BCS	.skipL0516_33
  	LDA	temp4
  	SEC
  	SBC	temp2
	jmp	.skipelse25_33
.skipL0516_33
  	SEC
  	SBC	temp4
.skipelse25_33
	STA	temp5
	LDA	player3y
  	SEC
  	SBC	#5
  	STA	temp2
	CMP	missile0y
  	BCS	.skipL0518_33
  	LDA	missile0y
  	SEC
  	SBC	temp2
	jmp	.skipelse26_33
.skipL0518_33
    	SEC
  	SBC	missile0y
.skipelse26_33
  	STA	temp6

  	CMP	#8
  	BCS	.skipL0519_33
  	LDA	temp5
  	CMP	#4
  	BCS	.skipL0519_33
  	LDY	#1
  	LDA	#120
  	STA	player3y
  	SED
  	LDA	player2score
  	CLC
  	ADC	#$01
  	STA	player2score
  	CLD
	BIT	o
  	BPL	.skipL0519_33

  	LDA	o
  	AND	#127
  	STA	o
  	LDA	#160
  	STA	Shoot1_Y
.skipL0519_33
end
LookAt4_1
	if w{4} then goto CanReturn

	asm
  	LDA	player4x
  	CLC
  	ADC	#4
	STA	temp2
  	CMP	temp4
  	BCS	.skipL0516_44
  	LDA	temp4
  	SEC
  	SBC	temp2
	jmp	.skipelse25_44
.skipL0516_44
  	SEC
  	SBC	temp4
.skipelse25_44
	STA	temp5
	LDA	player4y
  	SEC
  	SBC	#5
  	STA	temp2
	CMP	missile0y
  	BCS	.skipL0518_44
  	LDA	missile0y
  	SEC
  	SBC	temp2
	jmp	.skipelse26_44
.skipL0518_44
    	SEC
  	SBC	missile0y
.skipelse26_44
  	STA	temp6

  	CMP	#8
  	BCS	.skipL0519_44
  	LDA	temp5
  	CMP	#4
  	BCS	.skipL0519_44
  	LDY	#1
  	LDA	#120
  	STA	player4y
  	SED
  	LDA	player2score
  	CLC
  	ADC	#$01
  	STA	player2score
  	CLD
	BIT	o
  	BPL	.skipL0519_44

  	LDA	o
  	AND	#127
  	STA	o
  	LDA	#160
  	STA	Shoot1_Y
.skipL0519_44



end

	goto CanReturn
Player2Damages

	if !o{6} then return otherbank
DoEvilThings_2

	asm
	LDA	missile0x
	CLC
	ADC	temp1
	STA	temp4
	LDY	#0
end
	if o{3}   then goto PeopleHurt2

	asm
   	LDA	Reaper1_X
  	CLC
  	ADC	#4
  	STA	temp2
	CMP	temp4
	BCS	.skipL0514_2
  	LDA	temp4
  	SEC
  	SBC	temp2
	jmp	.skipelse25_2
.skipL0514_2
	SEC
 	SBC	temp4
.skipelse25_2
	  STA	temp5

 	LDA	Reaper1_Y
	SEC
	SBC	#9
	STA	temp2
	CMP	missile0y
	BCS	.skipL0516_2
	LDA	missile0y
	SEC
  	SBC	temp2
  	jmp	.skipelse26_2
.skipL0516_2
  	SEC
  	SBC	missile0y
.skipelse26_2
	STA	temp6

 	LDA	temp1
  	CLC
  	ADC	#3
  	STA	temp2
end
	temp3=(rand&3)

	asm
	LDA	temp5
 	CMP	temp2
  	BCS	.skipL0520_2
  	LDA	temp6
  	CMP	#8
  	BCS	.skipL0520_2
 	SED
  	LDA	player0score
  	SEC
  	SBC	temp3
  	STA	player0score
  	CLD
	LDY	#1
	LDA	s
	LSR
  	BCC	.skipL0520_2
  	LDA	s
  	AND	#254
  	STA	s
  	LDA	#160
  	STA	Shoot2_Y
  	SED
  	LDA	player0score
  	SEC
  	SBC	#$05
  	STA	player0score
  	CLD


.skipL0520_2

 	LDA	temp5
  	CMP	temp2
  	BCS	.NoNoNoNOOO
 	LDA	temp6
  	CMP	#8
  	BCS	.NoNoNoNOOO
 	SED
  	LDA	player0score
  	SEC
  	SBC	temp3
  	STA	player0score
  	CLD
  	LDY	#1
  	LDA	s
  	LSR
 	BCC	.NoNoNoNOOO
  	LDA	s
  	AND	#254
 	STA	s
  	LDA	#160
  	STA	Shoot2_Y
  	SED
  	LDA	player0score
  	SEC
  	SBC	#$05
  	STA	player0score
  	CLD
.NoNoNoNOOO
end

PeopleHurt2
	asm
  	LDA	player1x
  	CLC
  	ADC	#4
	STA	temp2
  	CMP	temp4
  	BCS	.skipL0516_55
  	LDA	temp4
  	SEC
  	SBC	temp2
	jmp	.skipelse25_55
.skipL0516_55
  	SEC
  	SBC	temp4
.skipelse25_55
	STA	temp5
	LDA	player1y
  	SEC
  	SBC	#5
  	STA	temp2
	CMP	missile0y
  	BCS	.skipL0518_55
  	LDA	missile0y
  	SEC
  	SBC	temp2
	jmp	.skipelse26_55
.skipL0518_55
    	SEC
  	SBC	missile0y
.skipelse26_55
  	STA	temp6

  	CMP	#8
  	BCS	.skipL0519_55
  	LDA	temp5
  	CMP	#8
  	BCS	.skipL0519_55
	LDY	#1
  	LDA	#120
  	STA	player1y
  	SED
  	LDA	player3score
  	CLC
  	ADC	#$01
  	STA	player3score
  	CLD
	LDA	s
	LSR
  	BCC	.skipL0519_55

  	LDA	s
  	AND	#254
  	STA	s
  	LDA	#160
  	STA	Shoot2_Y
.skipL0519_55
end

	asm
  	LDA	player2x
  	CLC
  	ADC	#4
	STA	temp2
  	CMP	temp4
  	BCS	.skipL0516_66
  	LDA	temp4
  	SEC
  	SBC	temp2
	jmp	.skipelse25_66
.skipL0516_66
  	SEC
  	SBC	temp4
.skipelse25_66
	STA	temp5
	LDA	player2y
  	SEC
  	SBC	#5
  	STA	temp2
	CMP	missile0y
  	BCS	.skipL0518_66
  	LDA	missile0y
  	SEC
  	SBC	temp2
	jmp	.skipelse26_66
.skipL0518_66
    	SEC
  	SBC	missile0y
.skipelse26_66
  	STA	temp6

  	CMP	#8
  	BCS	.skipL0519_66
  	LDA	temp5
  	CMP	#8
  	BCS	.skipL0519_66
	LDY	#1
  	LDA	#120
  	STA	player2y
  	SED
  	LDA	player3score
  	CLC
  	ADC	#$01
  	STA	player3score
  	CLD
	LDA	s
	LSR
  	BCC	.skipL0519_66

  	LDA	s
  	AND	#254
  	STA	s
  	LDA	#160
  	STA	Shoot2_Y
.skipL0519_66
end

	
	if w{3} then goto LookAt4_2

	asm
  	LDA	player3x
  	CLC
  	ADC	#4
	STA	temp2
  	CMP	temp4
  	BCS	.skipL0516_77
  	LDA	temp4
  	SEC
  	SBC	temp2
	jmp	.skipelse25_77
.skipL0516_77
  	SEC
  	SBC	temp4
.skipelse25_77
	STA	temp5
	LDA	player3y
  	SEC
  	SBC	#5
  	STA	temp2
	CMP	missile0y
  	BCS	.skipL0518_77
  	LDA	missile0y
  	SEC
  	SBC	temp2
	jmp	.skipelse26_77
.skipL0518_77
    	SEC
  	SBC	missile0y
.skipelse26_77
  	STA	temp6

  	CMP	#8
  	BCS	.skipL0519_77
  	LDA	temp5
  	CMP	#4
  	BCS	.skipL0519_77
  	LDY	#1
  	LDA	#120
  	STA	player3y
  	SED
  	LDA	player3score
  	CLC
  	ADC	#$01
  	STA	player3score
  	CLD
	LDA	s
	LSR
  	BCC	.skipL0519_77

  	LDA	s
  	AND	#254
  	STA	s
  	LDA	#160
  	STA	Shoot2_Y
.skipL0519_77
end
LookAt4_2
	if w{4} then goto CanReturn

	asm
  	LDA	player4x
  	CLC
  	ADC	#4
	STA	temp2
  	CMP	temp4
  	BCS	.skipL0516_88
  	LDA	temp4
  	SEC
  	SBC	temp2
	jmp	.skipelse25_88
.skipL0516_88
  	SEC
  	SBC	temp4
.skipelse25_88
	STA	temp5
	LDA	player4y
  	SEC
  	SBC	#5
  	STA	temp2
	CMP	missile0y
  	BCS	.skipL0518_88
  	LDA	missile0y
  	SEC
  	SBC	temp2
	jmp	.skipelse26_88
.skipL0518_88
    	SEC
  	SBC	missile0y
.skipelse26_88
  	STA	temp6

  	CMP	#8
  	BCS	.skipL0519_88
  	LDA	temp5
  	CMP	#4
  	BCS	.skipL0519_88
  	LDY	#1
  	LDA	#120
  	STA	player4y
  	SED
  	LDA	player3score
  	CLC
  	ADC	#$01
  	STA	player3score
  	CLD
	LDA	s
	LSR
  	BCC	.skipL0519_88

  	LDA	s
  	AND	#254
  	STA	s
  	LDA	#160
  	STA	Shoot2_Y
.skipL0519_88
end

CanReturn
	asm
	CPY	#1
	BNE	.NO_SOUNDZ4
	LDA	#8
  	STA	AUDV1
  	LDA	#15
  	STA	AUDC1
  	LDA	#5
 	STA	AUDF1
.NO_SOUNDZ4
	LDX	#$00
	LDA	MaxLife
  	CMP	player0score
  	BCS	.skipL0633_1
  	STX	player0score
.skipL0633_1
	CMP	player1score
  	BCS	.skipL0634_1
	STX	player1score
.skipL0634_1
end


	return otherbank 



Ending
	playfield:
	...............
	...............
	...............
	...............
	...............
	...............
	...............
	...............
	...............
	...............
	...............
	...............
	...............
	...............
	...............
	...............
	...............
	...............
	...............
	...............
	...............
	...............
end
	COLUBK=$00:  player2y=120: player3y=120: player4y=120: player5y=120
	
 	player0:
 	%11111111
 	%11111110
 	%11111110
 	%01111110
 	%01011110
 	%01011110
 	%01011111
 	%01011000
 	%01000111
 	%01011111
 	%01011110
 	%10011100
 	%10111110
 	%10110010
 	%10110001
 	%01111011
 	%01110001
 	%01011110
 	%01000000
 	%01000000
 	%01000011
 	%01000110
 	%01001100
 	%01111000
end
 	player1:
 	%11111111
 	%11111110
 	%11111110
 	%01111110
 	%01011110
 	%01011110
 	%01011111
 	%01011000
 	%01000111
 	%01011111
 	%01011110
 	%10011100
 	%10111110
 	%10110010
 	%10110001
 	%01111011
 	%01110001
 	%01011110
 	%01000000
 	%01000000
 	%01000011
 	%01000110
 	%01001100
 	%01111000
end
 	NUSIZ0=$00: _NUSIZ1=$00: player0scorecolor=$00: player1scorecolor=$00: _NUSIZ1{3}=1: w{0} = 0: AUDV0=0: AUDV1=0: REFP0=0: player2scorecolor=$48: player3scorecolor=$88
	player0x=Reaper1_X: player0y=Reaper1_Y: player1x=Reaper2_X: player1y=Reaper2_Y 
CountTillTheyAreFar
	COLUP0=$46: _COLUP1=$86
	if player0x=56 && player1x=105 && player0y=45 && player1y=43  then ThunderCount=0: StormPower=$0e: Delay=48: goto CallThunder
	if player0x<56 then player0x=player0x+1
	if player0y>45 then player0y=player0y-1 
	if player0x>56 then player0x=player0x-1
	if player0y<45 then player0y=player0y+1 
	if player1x<105 then player1x=player1x+1
	if player1y>43 then player1y=player1y-1 
	if player1x>105 then player1x=player1x-1
	if player1y<43 then player1y=player1y+1 
	bally=160: missile1y=160: missile0y=160
	drawscreen

	goto CountTillTheyAreFar
CallThunder
	COLUBK=StormPower
	if StormPower>$08 then COLUP0=$00: _COLUP1=$00 else COLUP0=$46: _COLUP1=$86 
 	AUDV0=StormPower: AUDC0=8: AUDF0=20-StormPower
	if StormPower>$00 then dec StormPower=StormPower-$01 else Delay=Delay-1
	if Delay=0 then ThunderCount=ThunderCount+1: StormPower=$0e: Delay=48 
	drawscreen
	if ThunderCount>2 then Delay=48: goto ThunderGO

	goto CallThunder
ThunderGO
	if Kills1=Kills2 then goto TextDraw
	COLUBK=$0e: COLUP0=$00: _COLUP1=$00
	e{0}=!e{0}
	if e{0} then player0x=98: REFP0=8 else player0x=56: REFP0=0
	if Kills1>Kills2 then player1x=106 else player1x=64
 	player1y=80: player1:
 	%00010000
 	%00001000
 	%00001000
 	%00001000
 	%00001000
 	%10010000
 	%01001000
 	%00101000
 	%00010000
 	%00010000
 	%00010000
 	%00001000
 	%00001000
 	%00001000
 	%00000101
 	%10000110
 	%01000100
 	%00101000
 	%00101000
 	%00101000
 	%00011001
 	%00001010
 	%00001100
 	%10010100
 	%01011000
 	%01010000
 	%00110000
 	%00010000
 	%00001000
 	%00001000
 	%00000100
 	%00000101
 	%00001001
 	%00001010
 	%00001100
 	%00010000
 	%00100000
 	%00100000
 	%00010000
 	%00001000
 	%10001000
 	%10001000
 	%01010000
 	%01010000
 	%00110000
 	%00010000
 	%00001001
 	%00001010
 	%00000100
 	%00001000
 	%00010000
 	%00010000
 	%00010000
 	%01001000
 	%11001000
 	%00110000
 	%00010000
 	%00010000
 	%00001000
 	%00001000
end	
	Delay=Delay-1: AUDV0=10: AUDC0=7: AUDF0=(rand&15)+1

	drawscreen
	if Delay=0 then goto Ashes
	goto ThunderGO
Ashes
	if Kills1>Kills2 then player0x=56: player1x=105: _NUSIZ1{3}=1 else player0x=98: player1x=62: _NUSIZ1{3}=0 
	player1y=43: Delay=31
AshesLoop
	if Kills1>Kills2 then COLUP0=$46: REFP0=0: _COLUP1=$86 else COLUP0=$86: _COLUP1=$46 : REFP0=8
	temp4=Delay/8
 
 if temp4=3 then player1:
 	%00111111
 	%00101110
 	%00100001
 	%00101000
 	%00100100
 	%00100101
 	%00111111
 	%00100101
 	%00111111
 	%00101101
 	%00111110
 	%01101100
 	%01011110
 	%01111110
 	%01111111
 	%01110101
 	%01111111
 	%01011110
 	%01000000
 	%01000000
 	%01000011
 	%01000110
 	%01001100
 	%01111000
end

 	if temp4=2 then player1:
 	%01111111
 	%00111111
 	%00111110
 	%00100100
 	%00100001
 	%00101000
 	%00110010
 	%00100000
 	%00111101
 	%00101101
 	%00111110
 	%01101100
 	%01011110
 	%01111110
 	%01111111
 	%01110101
 	%01111111
 	%01011110
 	%01000000
 	%01000000
 	%01000011
 	%01000110
 	%01001100
 	%01111000
end
 if temp4=1 then player1:
 	%11111111
 	%01111111
 	%00111111
 	%00111111
 	%00101110
 	%00110000
 	%00100100
 	%00100010
 	%00100000
 	%00101000
 	%00100010
 	%01101100
 	%01011110
 	%01111110
 	%01111111
 	%01110101
 	%01111111
 	%01011110
 	%01000000
 	%01000000
 	%01000011
 	%01000110
 	%01001100
 	%01111000
end
 if temp4=0 then player1:
 	%11111111
 	%11111111
 	%01111111
 	%01111111
 	%00111111
 	%00111111
 	%00111111
 	%00110101
 	%00111111
 	%00111110
 	%00100000
 	%01100000
 	%01000000
 	%01000000
 	%01000000
 	%01000000
 	%01000000
 	%01000000
 	%01000000
 	%01000000
 	%01000011
 	%01000110
 	%01001100
 	%01111000
end
	temp5= Delay/4:AUDV0=8: AUDC0=7: AUDF0=16-temp5
	Delay=Delay-1
	if Delay=0 then goto TextDraw
	drawscreen
	goto AshesLoop
TextDraw
	e{0}=0: 	AddToColor=$00: player2y=60: AUDV0=0: e{1}=0: e{2}=0: e{3}=0: duration=1: b=0: w=0
	NUSIZ2{3}=0: NUSIZ3{3}=0: NUSIZ4{3}=0
	if Kills2>Kills1 then goto Won_2
 	if Kills2<Kills1 then goto Won_1

	player2:
 	%11010110
 	%10111010
 	%10111011
 	%10110110
 	%11011001
end
 	player3:
 	%10101001
 	%11010100
 	%11010101
 	%11000101
 	%01000101
end
	player2x=79: player3x=player2x+8
	goto TextLoop 
Won_1
 player2:
 	%11111100
 	%10011100
 	%11111100
 	%01111000
 	%00110010
 	%00110010
 	%00110110
 	%00110010
end
	goto Winners
Won_2
	if !o{0} then player2:
 	%11111100
 	%10011100
 	%11111100
 	%01111100
 	%00110111
 	%00110010
 	%00110101
 	%00110011
end
	if o{0} then player2:
 	%11111111
 	%10001011
 	%11111111
 	%01111110
 	%01000010
 	%01000110
 	%01001010
 	%01111110
end


Winners
 player3:
 	%01010010
 	%10101101
 	%10101101
 	%10001101
 	%10001010
end
 player4:
 	%10010101
 	%10010000
 	%10110101
 	%11010101
 	%10010101
end
	player2x=75: player3x=player2x+12: player4x=player2x+20
	goto MusicSetup4 bank4
TextLoop
	e{1}=!e{1}: if e{1} then e{2}=!e{2} 
	
	if Kills1=Kills2 then COLUP0=$46: REFP0=0: _COLUP1=$86: ColorForText=$10: goto NoOOO
	if Kills1>Kills2 then COLUP0=$46: REFP0=0: _COLUP1=$86: ColorForText=$40 else COLUP0=$86: _COLUP1=$46 : REFP0=8: ColorForText=$80 
NoOOO
	if !e{2} then goto NoShitzz
	if player2y>55 && !e{3} then player2y=player2y-1 
	if player2y<56 && !e{3} then e{3}=1: goto NoShitzz
	if player2y<65 && e{3} then player2y=player2y+1 
	if player2y>64 && e{3} then e{3}=0
	if Kills1=Kills2 then player2y=player2y-3: player4y=120 else player4y=player2y-3 
	player3y=player2y-3
NoShitzz
	
	if !e{0} && AddToColor>$0a then e{0} =1
	if !e{0} && AddToColor<$0e then dec AddToColor=AddToColor+$02 
	if e{0} && AddToColor<$02 then e{0} =0
	if e{0} && AddToColor>$00 then dec AddToColor=AddToColor-$02 
NoMoreChange
	temp4=ColorForText+AddToColor: COLUP2= temp4: COLUP3=temp4: COLUP4=temp4

	if switchselect then Selection=0: e{6}=1: e{4} = 1: back=$08: duration=1: goto MusicSetup1 bank1
	if !switchreset && !joy0fire && !joy1fire then goto PPPP
	Kills1=0: Kills2=0: goto Start_Game bank2

PPPP
	if HowWhite>$08 then COLUP0=$00: _COLUP1=$00: COLUP2=$00: COLUP3=$00: COLUP4=$00
	drawscreen
	goto EndMusic bank4

 bank 7 


PlayerStand
 	player0:
 	%11111100
 	%01111000
 	%01111000
 	%01111000
 	%11110010
 	%11110001
 	%10100001
 	%10111001
 	%11011001
 	%01011101
 	%01101011
 	%10111011
 	%11111101
 	%11110100
 	%11110010
 	%11110110
 	%01110010
 	%00111100
end

	goto PlayerDone 

Attack_Player

 	if temp4=0 then player0:
 	%11111111
 	%11111110
 	%11111110
 	%01111110
 	%01011110
 	%01011110
 	%01011111
 	%01011000
 	%01000111
 	%01011111
 	%01011110
 	%10011100
 	%10111110
 	%10110010
 	%10110001
 	%01111011
 	%01110001
 	%01011110
 	%01000000
 	%01000000
 	%01000011
 	%01000110
 	%01001100
 	%01111000
end

 	if temp4=1 then player0:
 	%11111100
 	%01111100
 	%00111110
 	%00111100
 	%01111000
 	%01111000
 	%11111110
 	%10000010
 	%11011110
 	%01011100
 	%01101100
 	%00111100
 	%00011100
 	%00011010
 	%01111001
 	%01111101
 	%11111001
 	%11111110
 	%11110000
 	%00000000
end

 	if temp4=2 then player0:
 	%11111100
 	%01111000
 	%01111000
 	%00110000
 	%01110000
 	%11110000
 	%11111000
 	%11111000
 	%01000111
 	%01111100
 	%00111100
 	%01011000
 	%11111100
 	%11111010
 	%11111001
 	%11111011
 	%01111001
 	%00011110
end
	goto PlayerDone 

Move_Player
	if temp4=0 then player0:
 	%10111000
 	%11111100
 	%11111000
 	%01110100
 	%11110010
 	%10100010
 	%10110010
 	%10111001
 	%11010101
 	%11011011
 	%01111001
 	%00111000
 	%11111110
 	%11111010
 	%11111001
 	%01111011
 	%00111001
 	%00011110
end

	if temp4=1 then player0:
 	%11111000
 	%11100100
 	%01110010
 	%11100001
 	%11100110
 	%11011000
 	%10100000
 	%10110000
 	%10111000
 	%11011000
 	%11111100
 	%01111110
 	%11111010
 	%11111001
 	%11111011
 	%01111001
 	%00011110
 	%00000000
end

	if temp4=2 then player0:
 	%10111111
 	%11011110
 	%00111110
 	%00011010
 	%00111110
 	%01101110
 	%00110110
 	%00110110
 	%00010110
 	%01010100
 	%11111100
 	%11111000
 	%11111110
 	%11111101
 	%11111010
 	%11110001
 	%01110110
 	%00111100
end

	if temp4=3 then player0:
 	%11111000
 	%11111100
 	%01111100
 	%11111000
 	%11110100
 	%10100100
 	%10111100
 	%10110000
 	%10111100
 	%11011110
 	%01111001
 	%00111010
 	%01111001
 	%01111011
 	%11111001
 	%11111110
 	%11111000
 	%11100000
end

	if temp4=4 then player0:
 	%11111111
 	%01111111
 	%01111110
 	%01110110
 	%10010110
 	%10011010
 	%00011010
 	%00010110
 	%10111100
 	%11111000
 	%11111000
 	%11111100
 	%11110010
 	%11110001
 	%01111011
 	%01111001
 	%00111111
 	%00011100
end

	if temp4=5 then player0:
 	%11111100
 	%01111110
 	%01111111
 	%01011111
 	%01101110
 	%00110110
 	%00010110
 	%00110110
 	%01111100
 	%01111100
 	%11111000
 	%11110110
 	%11110011
 	%11111001
 	%11111111
 	%11111111
 	%00111100
 	%00000000
end
	goto PlayerDone 

Player_Duck
	 player0:
 	%00000000
 	%11011111
 	%10011111
 	%01001111
 	%01010110
 	%01010100
 	%01111100
 	%11011110
 	%11011101
 	%01011111
 	%01011101
 	%00111111
 	%00100000
 	%00100000
 	%00100000
 	%00100001
 	%01100010
 	%00111100
end
	goto PlayerDone 


Attack_Player_Dash
 	if temp4=0 then player0:
 	%11110000
 	%11110000
 	%11111100
 	%01111110
 	%00111110
 	%00111110
 	%01111100
 	%01111100
 	%01111000
 	%10110000
 	%10111000
 	%10001100
 	%01111100
 	%01111000
 	%10111100
 	%10111110
 	%10111101
 	%01111111
 	%01111101
 	%01011110
 	%01000000
 	%01000000
 	%01000001
 	%01100010
 	%11111100
end
 	if temp4=1 then player0:
 	%00111111
 	%00111110
 	%00011111
 	%00011111
 	%00110111
 	%00110110
 	%00110110
 	%00110100
 	%01100100
 	%01000100
 	%01001000
 	%01001100
 	%01001100
 	%01101000
 	%00101110
 	%01011101
 	%11011111
 	%11011101
 	%11111110
 	%01100000
 	%00100000
 	%01000000
 	%01000000
 	%11100001
 	%01111110
end
 	if temp4=2 then player0:
 	%11111000
 	%11111100
 	%11111100
 	%11111100
 	%01111100
 	%01111100
 	%11111000
 	%11111000
 	%11111000
 	%11110000
 	%10111000
 	%10111100
 	%11001100
 	%11011000
 	%11111100
 	%11111100
 	%11111110
 	%11111101
 	%11111111
 	%11111101
 	%10011111
 	%10000001
 	%01001110
 	%01111000
 	%11100000
end
	goto PlayerDone 

PlayerShoot1
 	player0:
 	%11111100
 	%01111000
 	%01111000
 	%11111000
 	%11111000
 	%10111000
 	%10111000
 	%10111011
 	%11101111
 	%10011111
 	%10110001
 	%01111000
 	%11111000
 	%11110100
 	%11100100
 	%11101100
 	%11100100
 	%10111000
 	%10000000
 	%10000000
 	%10000000
 	%10000000
 	%10000010
 	%11000100
 	%11111000
end
	goto PlayerDone 

PlayerShoot2
 	player0:
 	%11111100
 	%01111000
 	%01111000
 	%11111000
 	%11111000
 	%10111000
 	%10111000
 	%10111000
 	%11101101
 	%10011111
 	%10110111
 	%01111011
 	%11111011
 	%11111010
 	%11100100
 	%11010100
 	%11001000
 	%10110000
 	%10000000
 	%10000000
 	%10000000
 	%10000000
 	%10000010
 	%11000100
 	%11111000
end
	goto PlayerDone 
Common_Jump_Up
 	player0:
 	%00010000
 	%00101100
 	%00111110
 	%00111110
 	%01111111
 	%00011111
 	%00001111
 	%00011110
 	%00011101
 	%00111101
 	%01111101
 	%01111111
 	%00111110
 	%00111010
 	%01011010
 	%11110110
 	%11110100
 	%11101000
 	%11101100
 	%01011010
	%01110010
 	%10101100
 	%10011000
 	%01000010
 	%00111100
end
	goto PlayerDone 

Common_Jump_Down
 player0:
 	%00111000
 	%01111111
 	%11111111
 	%01111111
 	%10011111
 	%10011111
 	%01111111
 	%01100011
 	%00111101
 	%01011110
 	%01011110
 	%01010010
 	%01110101
 	%00111011
 	%00010111
 	%00010110
 	%00010110
 	%00011100
 	%00111100
 	%00111100
 	%00000010
 	%00000010
 	%10000010
 	%01000011
 	%00111111
end
	goto PlayerDone 

ReaperStomp
 	player0:
 	%11111100
 	%11000010
 	%10011001
 	%10011101
 	%10111110
 	%10111110
 	%10111110
 	%10111110
 	%10111110
 	%11101100
 	%10010100
 	%10111010
 	%11111110
 	%10011100
 	%10100010
 	%10110110
 	%10100010
 	%10111110
 	%10111110
 	%10011100
 	%10011100
 	%00001000
end
	goto PlayerDone 

ChangePF
	asm
	LDA	#7
  	CMP	HouseHeight
  	BCS	.skipL0768_99
  	STA	HouseHeight
.skipL0768_99
  	LDA	w
  	ORA	#8
 	ORA	#16
 	STA	w
end
	on HouseHeight goto House0 House1 House2 House3 House4 House5 House6 House7 Gotos
House0
	playfield:
	...............
	...............
	...............
	...............
	........X......
	....XX..XX.....
	.XXXXX..XXXXX..
	.X.X.X..X.X.X..
	.XXXXX..XXXXX..
	.X.X.X..X.X.X..
	.XXXXX..XXXXX..
	.X.X.X..X.X.X..
	.XXXXX..XXXXX..
	.X.X.X..X.X.X..
	.XXXXX..XXXXX..
	.X.X.X..X.X.X..
	.XXXXX..XXXXX..
	.X.X.X..X.X.X..
	.XXXXX..XXXXX..
	.X..XX..XX..X..
	.X..XX..XX..X..
	XXXXXXXXXXXXXXX
end
	goto Gotos

House1
	playfield:
	...............
	...............
	...............
	...............
	...............
	...............
	........X......
	....XX..XX.....
	.XXXXX..XXXXX..
	.X.X.X..X.X.X..
	.XXXXX..XXXXX..
	.X.X.X..X.X.X..
	.XXXXX..XXXXX..
	.X.X.X..X.X.X..
	.XXXXX..XXXXX..
	.X.X.X..X.X.X..
	.XXXXX..XXXXX..
	.X.X.X..X.X.X..
	.XXXXX..XXXXX..
	.X.X.X..X.X.X..
	.XXXXX..XXXXX..
	XXXXXXXXXXXXXXX
end
	goto Gotos
House2
	playfield:
	...............
	...............
	...............
	...............
	...............
	...............
	...............
	...............
	........X......
	....XX..XX.....
	.XXXXX..XXXXX..
	.X.X.X..X.X.X..
	.XXXXX..XXXXX..
	.X.X.X..X.X.X..
	.XXXXX..XXXXX..
	.X.X.X..X.X.X..
	.XXXXX..XXXXX..
	.X.X.X..X.X.X..
	.XXXXX..XXXXX..
	.X.X.X..X.X.X..
	.XXXXX..XXXXX..
	XXXXXXXXXXXXXXX
end
	goto Gotos
House3
	playfield:
	...............
	...............
	...............
	...............
	...............
	...............
	...............
	...............
	...............
	...............
	........X......
	....XX..XX.....
	.XXXXX..XXXXX..
	.X.X.X..X.X.X..
	.XXXXX..XXXXX..
	.X.X.X..X.X.X..
	.XXXXX..XXXXX..
	.X.X.X..X.X.X..
	.XXXXX..XXXXX..
	.X.X.X..X.X.X..
	.XXXXX..XXXXX..
	XXXXXXXXXXXXXXX
end
	goto Gotos

House4
	playfield:
	...............
	...............
	...............
	...............
	...............
	...............
	...............
	...............
	...............
	...............
	...............
	...............
	........X......
	....XX..XX.....
	.XXXXX..XXXXX..
	.X.X.X..X.X.X..
	.XXXXX..XXXXX..
	.X.X.X..X.X.X..
	.XXXXX..XXXXX..
	.X.X.X..X.X.X..
	.XXXXX..XXXXX..
	XXXXXXXXXXXXXXX
end
	goto Gotos

House5
	playfield:
	...............
	...............
	...............
	...............
	...............
	...............
	...............
	...............
	...............
	...............
	...............
	...............
	...............
	...............
	........X......
	....XX..XX.....
	.XXXXX..XXXXX..
	.X.X.X..X.X.X..
	.XXXXX..XXXXX..
	.X.X.X..X.X.X..
	.XXXXX..XXXXX..
	XXXXXXXXXXXXXXX
end
	goto Gotos


House6
	playfield:
	...............
	...............
	...............
	...............
	...............
	...............
	...............
	...............
	...............
	...............
	...............
	...............
	...............
	...............
	...............
	...............
	........X......
	....XX..XX.....
	.XXXXX..XXXXX..
	.X.X.X..X.X.X..
	.XXXXX..XXXXX..
	XXXXXXXXXXXXXXX
end
	goto Gotos

House7
	playfield:
	...............
	...............
	...............
	...............
	...............
	...............
	...............
	...............
	...............
	...............
	...............
	...............
	...............
	...............
	...............
	...............
	...............
	...............
	........X......
	....XX..XX.....
	.XXXXX..XXXXX..
	XXXXXXXXXXXXXXX
end
Gotos
	if PowerUp_Counter>0 && PowerUp_Type=7 then goto No_Pretty_Fly bank5

	if s{5} then s{5} =0: goto ComeBack_1 bank3
	if s{6} && !o{0} then s{6} =0: goto ComeBack_2 bank3
	goto ComeBack_CPU 


Sonic_Attack1
 	player0:
 	%01100000
 	%01111100
 	%01111110
 	%00111110
 	%01111100
 	%11111000
 	%11110000
 	%11100000
 	%11110000
 	%01010000
 	%11010000
 	%11011000
 	%11010100
 	%11011100
 	%01010100
 	%10111000
 	%10100000
 	%01100000
 	%01000000
 	%01000000
 	%01000000
 	%01000000
 	%01000001
 	%01100010
 	%11111100
end
	goto PlayerDone 

Sonic_Attack2
  	player0:
 	%00000000
 	%00110000
 	%01111000
 	%01111100
 	%01111110
 	%00111110
 	%01111100
 	%11111000
 	%11110000
 	%11110000
 	%11011111
 	%01110000
 	%11110000
 	%11111000
 	%11110100
 	%01111100
 	%01110100
 	%01111000
end
	goto PlayerDone 

Sonic_Attack3
	 player0:
 	%00111100
 	%01011000
 	%10001000
 	%10001000
 	%10001000
 	%00001000
 	%00001000
 	%00010000
 	%00110000
 	%01101000
 	%01011100
 	%01011110
 	%00111110
 	%01011100
 	%11011000
 	%11010000
 	%11010000
 	%11010000
 	%01110000
 	%11110000
 	%11111000
 	%11110100
 	%01111100
 	%01110100
 	%01111000
end
	goto PlayerDone 

Sonic_Attack4

 	player0:
 	%00000000
 	%00011000
 	%00111110
 	%01111110
 	%00111111
 	%00011111
 	%00011110
 	%00111110
 	%00111100
 	%00111100
 	%11100100
 	%00011100
 	%00111100
 	%00111110
 	%00111101
 	%00011111
 	%00011101
 	%00011110
end
 	goto PlayerDone 

ReaperFall

	player0:
 	%00111111
 	%01110101
 	%11110111
 	%11111111
 	%11110011
 	%11111101
 	%11011001
 	%10111101
 	%00111101
 	%00010011
 	%00111111
 	%00111111
 	%00111111
 	%10111101
 	%11111001
 	%10111011
 	%01000111
 	%00111000
end
 	goto PlayerDone 

ReaperFallen
 	player0:
 	%01110101
 	%11111101
 	%11111101
 	%11110001
 	%11001101
 	%11111111
 	%11110110
 	%11111010
 	%11111010
 	%11101010
	%10101010
 	%01110010
 	%00000010
 	%00000010
 	%10000010
 	%10000010
 	%01000110
 	%00111111
end
 	goto PlayerDone 

CPU_AI
	asm 
	LDA	#133
	CMP	Reaper2_X
 	BCC	.ZZZ_1
  	LDA	#24
	CMP	Reaper2_X
  	BCC	.skipL0700_1
.ZZZ_1
	STA	Reaper2_X
.skipL0700_1
end
	player0x=Reaper2_X: player0y=Reaper2_Y
	COLUP0=$86
	if Player2Counter_1>0 then Player2Counter_1= Player2Counter_1-1
	if Player2Counter_Jump>0 then Player2Counter_Jump= Player2Counter_Jump-1
	if e{3} then REFP0=8

	asm
	BIT	s
  	BPL	.No_fall_CPU
end
Fallen_CPU
	asm
	LDA	e
   	AND	#32
   	BEQ	.skipL0344_1CPU
   	LDX	Reaper2_Y
	CPX	#24
	BCS	.NoMoreJump2CPU
	LDA	e
	AND	#223
	STA	e
.NoMoreJump2CPU
	TXA
	SEC
   	SBC	#2
   	STA	Reaper2_Y
   	CLC
   	ADC	#7
   	jmp	.ReaperFall
.skipL0344_1CPU

  	LDA	Player2Counter_1
  	CMP	#0
	BEQ	.condpart292_99
	jmp	.ReaperFallen
.condpart292_99
  	LDA	s
  	AND	#127
  	STA	s
  	LDA	MaxLife
  	STA	player1score
  	LDA	o
	ORA	#16
  	STA	o
end
 

	
No_fall_CPU

	asm
 	LDA	#1
 	CMP	Dash_Delay
  	BCS	.skipL0741_41
  	DEC	Dash_Delay
  	jmp	.Attack_CPU_Dash
.skipL0741_41
  	LDA	#0
 	STA	Dash_Delay
  	CMP	Player2Counter_1
  	BCC	.condpart290_1
  	CMP	Player2Counter_Jump
  	BCS	.skip74OR_1
.condpart290_1
  	jmp	.NoTurnCPU
.skip74OR_1
	LDA	e
 	LDX	Reaper1_X
  	CPX	Reaper2_X
  	BCS	.skipL0710_1
 	ORA	#8
	jmp	.skipelse23_177
.skipL0710_1
  	AND	#247
.skipelse23_177
 	STA	e

.NoTurnCPU
	
	LDA	#0
	CMP	player1score
	BEQ	.condpart118_2CPU

	LDA	MaxLife
	CMP	player1score
	BCS	.skip42OR_2CPU
.condpart118_2CPU
	STA	player1score
	LDA	s
	ORA	#128
	STA	s
	LDA	#120
	STA	Player2Counter_1
	LDA	w
   	AND	#32
   	BEQ	.skip42OR_2CPU
   	LDA	#0
   	CMP	PowerUp_Counter
   	BCS	.skip42OR_2CPU
   	STA	PowerUp_Counter
	LDA	#120
	STA	player5y
.skip42OR_2CPU
end
	asm
	lda 	#23
	CMP	Reaper2_Y 	
	BCC	.skipL0215_2CPU
	sta 	Reaper2_Y
.skipL0215_2CPU
end

	asm
	LDA	e
	AND	#32
	BEQ	.DODODO_CPU
	LDA	#0
	CMP	Player2Counter_Jump
	BCC	.DODODO_CPU
	LDA	#23
  	CMP	Reaper2_Y
  	BCC	.DODODO_CPU
end

	asm

	BIT	s
	BVC	.ComeBack_CPU
	LDA	Player2Counter_1
	CMP	#12
	BCC	.ComeBack_CPU
end
	if player3y<120 then dec player3score=player3score+$01
	if player4y<120 then dec player3score=player3score+$01

 	COLUBK=$1e: HouseHeight=HouseHeight+1: goto ChangePF 
ComeBack_CPU
 	Player2Counter_1=0
	e{5}=0: Reaper2_Y=23
DODODO_CPU
	asm
	LDA	s
   	LSR
	BCC	.No_S0CPU

	LDA	#134
   	CMP	Shoot2_X
   	BCC	.condpart214_1CPU
   	LDA	Shoot2_X
   	CMP	#23
   	BCS	.skip70OR_1CPU
.condpart214_1CPU
	LDA	s
	AND	#254
   	STA	s
	LDA	o
	AND	#191
	STA	o
	jmp	.No_S0CPU
.skip70OR_1CPU
end

	asm
   	LDA	s
   	AND	#8
   	BEQ	.skipL0228_2CPU
   	LDA	Shoot2_X
   	SEC
   	SBC	#5
   	jmp	.skipelse9_22CPU
.skipL0228_2CPU
   	LDA	Shoot2_X
   	CLC
  	ADC	#5
   	STA	Shoot2_X
.skipelse9_22CPU
   	STA	Shoot2_X
	STA	missile0x

	LDA	s
  	AND	#16
   	BEQ	.skipL0229_2CPU
   	LDA	Shoot2_Y
   	CLC
   	ADC	#4
   	STA	Shoot2_Y
.skipL0229_2CPU
	LDA	Shoot2_Y
   	STA	missile0y
end

	NUSIZ0=$20
No_S0CPU
	asm
	LDA	e
	AND	#32
	beq	.skippp2CPU
	jmp	.JumpThings_CPU
end
skippp2CPU
	if Player2Counter_1>0 then goto Continue_CPU
	asm
	LDA	Reaper2_X
 	CMP	Reaper1_X
 	BCS	.skipL0725_166
 	LDA	Reaper1_X
  	SEC
  	SBC	Reaper2_X
  	jmp	.skipelse24_166
.skipL0725_166
  	SEC
 	SBC	Reaper1_X
.skipelse24_166
  	STA	temp5


	LDA	w
  	AND	#32
  	BNE	.QQQQ
  	LDA	PowerUp_Counter
  	CMP	#0
  	BEQ	.QQQQ

	LDA	PowerUp_Type
  	CMP	#6
  	BEQ	.Flee_Skull
	CMP	#0
  	BEQ	.Flee_Skull
end
QQQQ
	asm
	LDA	#10
  	CMP	Life2
 	BCC	.Health_OK
	LDA	temp5
  	CMP	#25
  	BCS	.No_Flee

end

Flee
	asm
	LDA	e
	LDX	Reaper1_X
  	CPX	Reaper2_X
  	BCS	.skipL0730_1
 	AND	#247
  	jmp	.skipelse25_188
.skipL0730_1
  	ORA	#8		      
.skipelse25_188
	STA	e
end
Flee_Continue
	asm
	
  	LDX	Reaper2_X
  	CPX	#40
  	BCS	.skipL0731_1
  	AND	#247
	jmp	.skipL0732_1
.skipL0731_1
 	CPX	#120
  	BCC	.skipL0733_1
  	ORA	#8
.skipL0732_1
	STA	e
.skipL0733_1
end
	goto Attack_CPU_Dash
No_Flee
	asm
  	LDA	e
	AND	#2
	BEQ	.skip160then_2CPU
   	LDA	Life2
	CMP	MaxLife
	BCS	.skip160then_2CPU
	SED
   	CLC
   	ADC	#1
   	STA	Life2
   	CLD
	LDA	#$1e
   	STA	player1scorecolor
.skip160then_2CPU
end

	goto Player_Duck 

Flee_Skull
	asm
     	LDA	Reaper2_X
  	CMP	player5x
 	BCS	.skipL0722_1
  	LDA	player5x
  	SEC
  	SBC	Reaper2_X
  	jmp	.skipelse20_14
.skipL0722_1
	SEC
 	SBC	player5x
.skipelse20_14
	STA	temp5
 	CMP	#25
	BCC	.Health_OKK	
	LDA	e
	LDX	player5x
 	CPX	Reaper2_X
  	BCS	.skipL0724_1
  	AND	#247
  	jmp	.skipelse21_1
 	ORA	#8
.skipelse21_1
	STA	e
.skipL0724_1
end

	goto Flee_Continue


Health_OKK

	asm
  	LDA	PowerUp_Type
  	CMP	#0
  	BEQ	.szalonna
end
Health_OK
	asm
	LDA	#119
  	CMP	player5y
  	BCC	.NoPowerUp
  	LDA	#0
  	CMP	PowerUp_Counter
  	BCC	.NoPowerUp
 
 	LDA	player5x
	STA	temp2
  	CMP	Reaper2_X
 	BCC	.skipL0729_1
  	SEC
  	SBC	Reaper2_X
	jmp	.skipelse22_178
.skipL0729_1
 	LDA	Reaper2_X
 	SEC
  	SBC	player5x
.skipelse22_178
  	STA	temp6
  	CMP	#22
  	BCS	.NoPowerUp
end


	goto Jump_CPU 
NoPowerUp
	asm
	LDA	#0
  	CMP	PowerUp_Counter
  	BCS	.GEGE
  	LDA	PowerUp_Type
  	CMP	#4
  	BNE	.GEGE
  	LDA	w
  	AND	#32
  	BNE	.GEGE
  	LDA	o
  	AND	#32
  	BEQ	.szalonna
.GEGE

	LDA	Reaper1_X
	STA	temp2
	lda	rand
	lsr
  	bcc	*+4
 	eor	#$B4
  	sta	rand
	CMP	#235
	BCS	.Go_Random2
.skippme
end


	if Life1>0 && !o{3} then goto Not_Dead

szalonna
	asm
	LDA	#88
  	CMP	player1y
  	BCC	.TryPerson2
	LDA	player1x
	STA	temp2
  	CMP	Reaper2_X
  	BCC	.skipL0734_199
   	SEC
  	SBC	Reaper2_X
 	STA	temp5
  	LDA	e
  	AND	#247
  	jmp	.skipelse20_189
.skipL0734_199
	LDA	Reaper2_X
  	SEC
  	SBC	player1x
 	STA	temp5
	LDA	e
  	ORA	#8
.skipelse20_189
  	STA	e
end

	goto Not_Dead
TryPerson2
	asm
	LDA	#88
  	CMP	player2y
  	BCC	.Go_Random

	LDA	player2x
	STA	temp2
  	CMP	Reaper2_X
  	BCC	.skipL0738_1
  	SEC
  	SBC	Reaper2_X
  	STA	temp5
  	LDA	e
  	AND	#247
 	jmp	.skipelse21_21
.skipL0738_1
	LDA	Reaper2_X
  	SEC
 	SBC	player2x
  	STA	temp5
  	LDA	e
 	ORA	#8
.skipelse21_21
  	STA	e
end

	goto Not_Dead

Go_Random
	asm
	lda	rand
	lsr
  	bcc	*+4
  	eor	#$B4
  	sta	rand
  	CMP	#150
  	BCS	.Go_Random2
	LDA	#88
  	CMP	player3y
 	BCS	.Jump_CPU
 	CMP	player4y
  	BCS	.Jump_CPU
	

.Go_Random2
	LDA	#24
  	PHA
  	lda	rand
 	lsr
  	bcc	*+4
  	eor	#$B4
  	sta	rand
  	AND	#127
  	TSX
  	INX
  	TXS
  	CLC
  	ADC	$00,x
  	CMP	#134
  	BCC	.skipL0741_1
	LDA	#134
.skipL0741_1
  	STA	temp4
	STA	temp2


 	LDA	Reaper2_X
 	CMP	temp4
  	BCS	.skipL0742_16
  	LDA	temp4
  	SEC
  	SBC	Reaper2_X
  	STA	temp5
  	LDA	e
  	AND	#247
  	jmp	.skipelse20_16
.skipL0742_16
  	SEC
  	SBC	temp4
  	STA	temp5
  	LDA	e
  	ORA	#8
.skipelse20_16
  	STA	e
end


Not_Dead
	asm
	LDA	#50
  	CMP	temp5
  	BCS	.skip282then_22
  	LDA	#88
 	CMP	Shoot2_Y
  	BCS	.Attack_CPU_Dash
 	LDA	Kills1
  	CMP	Kills2
 	BCS	.Attack_CPU_Dash
  	jmp	.Attack_CPU_Shoot
.skip282then_22
	LDA	e
  	AND	#16
  	BEQ	.skip284then_22
  	LDA	temp5
  	CMP	#35
	BCS	.skip284then_22
end 
Jump_CPU
	AUDV1=7: AUDC1=7: AUDF1=1
	Player2Counter_Jump=10: e{5}=1
	player0y=Reaper2_Y+7
	goto Common_Jump_Up
	asm
.skip284then_22
	LDA	temp5
  	CMP	#15
 	BCS	.Attack_CPU_Dash
	LDA	e
 	AND	#127
 	STA	e
	LDA	#0
 	STA	Player2Counter_Sprite
 	STA	Player2Counter_1
end
	goto Attack_CPU



Attack_CPU_Dash

	asm
 	LDA	e
  	ORA	#128
  	STA	e
 	LDA	#9
  	STA	AUDV1
  	LDA	#3
  	STA	AUDC1
  	LDX	#4
  	STX	AUDF1
 	LDA	Dash_Delay
 	CMP	#0
  	BNE	.skipL0783_122
  	STX	Dash_Delay 
.skipL0783_122

	LDX	Reaper2_X
  	LDA	e
  	AND	#8
  	BNE	.skip281then_1
	CPX	#132
  	BCC	.skip281then_1
 	LDA	e
 	ORA	#8
.JumpHere
  	AND	#127
  	STA	e
 	LDA	#0
 	STA	Player2Counter_Sprite
	STA	Dash_Delay
  	jmp	.PlayerStand
.skip281then_1
	LDA	e
	AND	#8
	BEQ	.skipL0742_1
 	CPX	#21
	BCS	.skipL0742_1
  	LDA	e
 	AND	#247
	jmp	.JumpHere

.skipL0742_1
  	LDA	e
  	AND	#8
  	BNE	.Dash_LeftCPU

	LDA	Reaper2_X
   	CMP	#132
   	BCS	.skipL0287_3CPU
   	CLC
   	ADC	#6
   	STA	Reaper2_X
   	LDA	Player2Counter_Sprite
  	CLC
   	ADC	#2
   	STA	Player2Counter_Sprite
   	CMP	#23
   	BCC	.skipL0287_3CPU
   	LDA	#0
   	STA	Player2Counter_Sprite
.skipL0287_3CPU
	LDA	Player2Counter_Sprite
	lsr
   	lsr
   	lsr
   	STA	temp4
end
		player0y=Reaper2_Y+7
		goto Attack_Player_Dash 

Dash_LeftCPU
	asm
	LDA	Reaper2_X
   	CMP	#21
   	BCC	.skipL0287_4CPU
   	SEC
   	SBC	#6
   	STA	Reaper2_X
   	LDA	Player2Counter_Sprite
  	CLC
   	ADC	#2
   	STA	Player2Counter_Sprite
   	CMP	#23
   	BCC	.skipL0287_4CPU
   	LDA	#0
   	STA	Player2Counter_Sprite
.skipL0287_4CPU
	LDA	Player2Counter_Sprite
	lsr
   	lsr
   	lsr
   	STA	temp4
end
		player0y=Reaper2_Y+7
		goto Attack_Player_Dash 

Attack_CPU_Shoot
	asm
	LDA	Reaper2_Y
	CLC
	ADC	#7
	STA	player0y
	SEC
	SBC	#17
	STA	Shoot2_Y

end
	Player2Counter_1=25: AUDV1=9: AUDC1=15: AUDF1=2
	NUSIZ0=$20: 	o{6} = 1: s{0} =1


	asm
	LDA	e
  	AND	#8
  	BEQ	.skipL0529_1CPU
  	LDA	s
 	ORA	#8
  	STA	s
  	LDA	Reaper2_X
  	SEC
  	SBC	#1
  	jmp	.skipelse45_1CPU
.skipL0529_1CPU
  	LDA	s
  	AND	#247
  	STA	s
	LDA	Reaper2_X
  	CLC
 	ADC	#7
.skipelse45_1CPU
	STA	Shoot2_X

  	LDA	e
 	AND	#16
  	BEQ	.skipL0790_88
  	LDA	s
  	ORA	#16
  	STA	s
  	LDA	Shoot2_Y
  	CLC
  	ADC	#3
  	STA	Shoot2_Y
  	jmp	.PlayerShoot2

.skipL0790_88
  	LDA	s
  	AND	#239
  	STA	s
  	jmp	.PlayerShoot1
end


Continue_CPU
	if s{7} then goto PlayerDone
	if e{7} then goto Attack_CPU_Dash

	asm
	BIT	o
   	BVC	.Attack_Shoot_Wait_CPU
   	LDA	s
   	LSR
   	BCS	.Attack_Shoot_Wait_CPU
end

Attack_CPU
	o{6} =1: AUDV1=9: AUDC1=6: AUDF1=6
	asm
   	LDA	Player2Counter_1
   	CMP	#26
	BCS	.skipL0281_2CPU
	CLC
	ADC	#3
	jmp	.skipelse14_2CPU
.skipL0281_2CPU
   	LDA	o
  	AND	#191
   	STA	o
	LDA	#0
.skipelse14_2CPU
	STA	Player2Counter_1
	lsr
	lsr
	lsr	
	STA	temp4
   	CMP	#0
   	BNE	.skipL0273_2CPU
   	LDA	Reaper2_Y
   	CLC
   	ADC	#6
   	STA	player0y
   	jmp	.Attack_Player
.skipL0273_2CPU
   	CMP	#1
   	BNE	.skipL0274_2CPU
  	LDA	Reaper2_Y
   	CLC
   	ADC	#2
   	STA	player0y
   	jmp	.Attack_Player
.skipL0274_2CPU
   	LDA	e
   	AND	#8
   	BNE	.skipL0275_2CPU
   	LDA	player0x
   	CLC
   	ADC	#8
   	jmp	.skipelse22_22CPU
.skipL0275_2CPU
   	LDA	player0x
   	SEC
   	SBC	#7		      
.skipelse22_22CPU
	STA	missile0x
end
	missile0y=player0y-10
	goto Attack_Player

Attack_Shoot_Wait_CPU
	player0y=Reaper2_Y+7
	asm
	LDA	e
  	AND	#16
  	BEQ	.skipL0798_77
  	jmp	.PlayerShoot2
.skipL0798_77
	jmp	.PlayerShoot1
end

JumpThings_CPU

	asm

	lda	rand
 	lsr
  	bcc	*+4
 	eor	#$B4
 	sta	rand
  	STA	temp1
	TAX

 	LDA	w
   	AND	#32
   	BNE	.No_Inverse_CPU
  	LDA	PowerUp_Counter
   	CMP	#0
  	BEQ	.No_Inverse_CPU
   	LDA	#3
   	CMP	PowerUp_Type
   	BNE	.No_Inverse_CPU
end
	COLUP0=$0e

	asm
	CPX	#160
  	BCC	.No_Inverse_CPU

	LDA	Reaper2_X
 	CMP	temp2
 	BCS	.skipL0772_1
  	CLC
  	ADC	#2
  	STA	Reaper2_X
  	LDA	temp2
	SEC
	SBC	Reaper2_X
 	jmp	.skipelse22_12
.skipL0772_1
  	SEC
  	SBC	#2
  	STA	Reaper2_X
	SEC
  	SBC	temp2
.skipelse22_12
	STA	temp5


end

	goto Inversed_CPU
No_Inverse_CPU	
	asm
	LDA	Reaper2_X
 	CMP	temp2
 	BCS	.skipL0772_12
  	SEC
  	SBC	#2
  	STA	Reaper2_X
  	LDA	temp2
	SEC
	SBC	Reaper2_X
 	jmp	.skipelse22_2
.skipL0772_12
  	CLC
  	ADC	#2
  	STA	Reaper2_X
	SEC
  	SBC	temp2
.skipelse22_2
	STA	temp5
end
Inversed_CPU

 	if s{6} && Player2Counter_1>10 then COLUP0=$1e: AUDV1=11: AUDC1=14: AUDF1=3

	asm
	LDA	o
 	LDY	#0
 	CPY	Player2Counter_Jump
  	BCS	.skipL0815_78
  	
  	AND	#191
  	STA	o
  	jmp	.JustFall_CPU
.skipL0815_78
 	ORA	#64
  	STA	o

	LDA	Life1
  	CMP	#0
  	BEQ	.NoSpin_CPU
  	LDA	o
 	AND	#8
  	BNE	.NoSpin_CPU

	LDA	#55
  	CMP	temp5
  	BCS	.Spin_CPU
  	CPX	#240
  	BCC	.Spin_CPU
	LDA	HouseHeight
  	CMP	#7
	BCC	.NoSpin_CPU
end

	goto Spin_CPU	
NoSpin_CPU

	asm
	LDA	#88
  	CMP	player3y
  	BCS	.GGG
 	CMP	player4y
  	BCC	.Spin_CPU
.GGG
	lda	Reaper2_Y
	SEC	
	SBC	#7
	STA	Reaper2_Y
	CLC
	ADC	#4
	STA	player0y
	SEC
	SBC	#25
	STA	missile0y
	LDA	#0
	STA	Player2Counter_Sprite
	STA	Player2Counter_Jump
end
	s{6}=1: 	Player2Counter_1=Player2Counter_1+4: missile0x=Reaper2_X : goto  ReaperStomp
JustFall_CPU
	s{6}=0  : Player2Counter_Sprite=0	
	asm
  	LDA	Reaper2_Y
   	CLC
  	ADC	#7
   	STA	player0y
	SEC
   	LDX	#0
   	CPX	Player2Counter_Jump
  	BCS	.skipL0270_2CPU	
	SBC	#2
	STA	Reaper2_Y
 
   	jmp	.Common_Jump_Up
.skipL0270_2CPU
	SBC	#12
  	STA	Reaper2_Y

   	jmp	.Common_Jump_Down
end


Spin_CPU

	s{6}=0 : AUDV1=9: AUDC1=6: AUDF1=6
	asm
	LDA	Player2Counter_Sprite
   	CMP	#31
   	BCS	.skipL0372_2CPU
   	CLC
  	ADC	#4
   	STA	Player2Counter_Sprite
	jmp	.skipelse20_2CPU
.skipL0372_2CPU
	LDA	#0
   	STA	Player2Counter_Sprite
.skipelse20_2CPU
	lsr
	lsr
	lsr
	STA	temp4
end


	Reaper2_Y=Reaper2_Y-4
	asm

	LDA	e
 	AND	#8
	BNE	.E3IS1CPU

 	LDX	temp4
  	CPX	#3
  	BNE	.temp4_2QCPU
   	LDA	Reaper2_X
   	STA	missile0x
.Sonic_3QCPU
   	LDA	Reaper2_Y
   	CLC
   	ADC	#6
	STA 	missile0y
	ADC	#1
   	STA	player0y

  	LDA	#$20
   	STA	NUSIZ0

   	jmp	.Sonic_Attack1
.temp4_2QCPU
	CPX	#2
	BNE	.temp4_1QCPU
  	LDA	player0x
   	CLC
   	ADC	#8
   	STA	missile0x
.Sonic_2QCPU

  	LDA	player0y
   	SEC
   	SBC	#8
   	STA	missile0y
   	jmp	.Sonic_Attack2
.temp4_1QCPU
	CPX	#1
	BNE	.temp4_0QCPU
	LDA	Reaper2_X

   	STA	missile0x
.Sonic_1QCPU
  	LDA	Reaper2_Y
   	SEC
  	SBC	#21
   	STA	missile0y
   	LDA	#$20
   	STA	NUSIZ0

   	jmp	.Sonic_Attack3
.temp4_0QCPU
   	LDA	player0x
   	SEC
   	SBC	#7
   	STA	missile0x
.Sonic_0QCPU

   	LDA	player0y
   	SEC
   	SBC	#8
   	STA	missile0y

   	jmp	.Sonic_Attack4
end


E3IS1CPU
	asm
 	LDX	temp4
  	CPX	#3
  	BNE	.temp4_2_2QCPU
   	LDA	Reaper2_X
	CLC	
	ADC	#3
   	STA	missile0x
	jmp	.Sonic_3QCPU

.temp4_2_2QCPU
	CPX	#2
	BNE	.temp4_1_2QCPU
  	LDA	player0x
   	SEC
   	SBC	#7
   	STA	missile0x
	jmp	.Sonic_2QCPU


.temp4_1_2QCPU
	CPX	#1
	BNE	.temp4_0_2QCPU
	LDA	Reaper2_X
	CLC
	ADC	#3
   	STA	missile0x
	jmp	.Sonic_1QCPU

.temp4_0_2QCPU
   	LDA	player0x
   	CLC
   	ADC	#8
   	STA	missile0x
	jmp .Sonic_0QCPU

end


PlayerDone
	

	asm
	LDA	o
  	AND	#24
  	BEQ	.NPCs


   	lda	rand
   	lsr
   	bcc	*+4
  	eor	#$B4
   	sta	rand
	TAX

   	LDA	e
   	LSR
   	BCS	.skipL0403_1
	LDA	o
	AND	#8
	BEQ	.skipL0403_1

	jmp	.condpart211_1
.skipL0403_1
  	LDA	e
	LSR
	BCC	.skipL0404_1
   	LDA	o
   	AND	#16
   	BEQ	.skipL0404_1
.condpart211_1
	STX	COLUP0
.skipL0404_1

	LDA	o
   	AND	#32
   	BNE	.condpart215_1
	CPX	#254
	BNE	.skip57OR_1
.condpart215_1
  	LDA	o
   	AND	#247
   	STA	o
	jmp 	.Sounds
.skip57OR_1

	BIT	o
   	BVS	.condpart217_1
   	CPX	#255
   	BNE	.skip58OR_1
.condpart217_1
   	LDA	o
  	AND	#239
   	STA	o
   	LDA	#11
.Sounds
   	STA	AUDV1
   	LDA	#15
   	STA	AUDC1
   	LDA	#10
   	STA	AUDF1
.skip58OR_1
end

NPCs

	asm
	LDA	Enemy_Sprite_Counter
   	CMP	#31
   	BCS	.skipL0409_1
 	CLC
	ADC	#4
	jmp	.skipelse22_1
.skipL0409_1
	LDA	#0
.skipelse22_1
	STA	Enemy_Sprite_Counter
   	lsr
   	lsr
   	lsr
   	STA	temp4

	LDA	#3
   	CMP	temp4
   	BCS	.uij
	STA	temp4
.uij
	lda	rand
  	lsr
  	bcc	*+4
  	eor	#$B4
 	sta	rand
	sta 	temp1
	TAY
end
Person1
	if PowerUp_Counter=0 && player5y<88 then goto Person3
	if e{0} then goto Person2

	asm
	LDA	player1y
  	CMP	#120
  	BCC	.JustMovePerson1
	CPY	#250
  	BCS	.skipL0825_ZZ
  	jmp	.Person2
.skipL0825_ZZ


   	LDA	e
   	LSR
   	BCC	.skipL0414_1
	LDX	#140
 	LDA	w
	ORA	#2
	jmp	.skipelse23_1
.skipL0414_1
	LDX	#26
	LDA	w
	AND	#253
.skipelse23_1
	STX 	player1x
	STA	w
end
	player1y=15: _COLUP1=$1e
	
JustMovePerson1

	asm

	LDA	w
   	AND	#2
   	BNE	.skipL0416_1
   	LDA	player1x
   	CLC
   	ADC	#2
   	STA	player1x
  	LDA	_NUSIZ1
   	AND	#247
   	jmp	.skipelse24_1
.skipL0416_1
 	LDA	player1x
   	SEC
   	SBC	#2
   	STA	player1x
   	LDA	_NUSIZ1
   	ORA	#8
.skipelse24_1
  	STA	_NUSIZ1
end
	temp2=player0x+8
	asm
	LDA	player1x
   	CMP	temp2
   	BCS	.skipL0416_11
   	LDA	temp2
   	SEC
	SBC	player1x
   	jmp	.skipelse24_11
.skipL0416_11
   	SEC
   	SBC	temp2
.skipelse24_11
	STA	temp5
	

end

	if temp5  <  8  && e{1}  &&  player0y <  40 then w{1} = !w{1}


	asm
 	LDA	w
 	LDX	player1x
  	AND	#2
   	BNE	.skipL0418_1
   	CPX	#140
   	BCS	.condpart222_1
.skipL0418_1	

	CPX	#28
	BCS	.skipL0419_1
.condpart222_1
	LDA	#120
   	STA	player1y
   	LDA	#$00
   	STA	_COLUP1
.skipL0419_1
end
	on temp4 goto Person1_0 Person1_1 Person1_2 Person1_3
Person1_0
	player1:
	%01000100
 	%01101010
 	%00011000
 	%00111000
 	%00111110
 	%00111000
 	%00111000
 	%00011100
 	%00111000
 	%00111110
 	%00110100
 	%00011000
end
	goto Person3

Person1_1
 	player1:
 	%00111100
 	%00101000
 	%00111000
 	%00111100
 	%00111000
 	%00011100
 	%00011100
 	%00111000
 	%00111110
 	%00110100
 	%00011000
 	%00000000
end
	goto Person3

Person1_2
 	player1:
 	%00011100
 	%00011000
 	%00111000
 	%00111100
 	%00111010
 	%00111100
	%00011100
 	%00001110
 	%00011100
 	%00011111
 	%00011010
 	%00001100
end
	goto Person3
Person1_3
 	player1:
 	%00110000
 	%00101100
 	%00111000
 	%00111000
 	%00111100
 	%00111000
 	%00110100
 	%00111000
 	%01110000
 	%01111100
 	%01101000
 	%00110000
end
	goto Person3

Person2

	asm
	LDA	player2y
  	CMP	#120
  	BCC	.JustMovePerson2

  	CPY	#4
 	BCC	.skipL0843_ZZ
  	jmp	.Person3
.skipL0843_ZZ

   	LDA	e
   	LSR
   	BCC	.skipL0414_2
	LDX	#140
 	LDA	w
	ORA	#4
	jmp	.skipelse23_2
.skipL0414_2
	LDX	#26
	LDA	w
	AND	#251
.skipelse23_2
	STX 	player2x
	STA	w
end
	player2y=15: COLUP2=$1e
	
JustMovePerson2
	asm
 	LDA	w
   	AND	#4
   	BNE	.skipL0430_1
   	LDA	player2x
   	CLC
   	ADC	#3
   	STA	player2x
   	LDA	NUSIZ2
   	AND	#247
	jmp	.skipelse27_1
.skipL0430_1
 	LDA	player2x
   	SEC
   	SBC	#3
   	STA	player2x
	LDA	NUSIZ2
	ORA	#8
.skipelse27_1
	STA	NUSIZ2
end
	temp2=player0x+8
	asm
	LDA	player2x
   	CMP	temp2
   	BCS	.skipL0416_2
   	LDA	temp2
   	SEC
	SBC	player2x
   	jmp	.skipelse24_2
.skipL0416_2
   	SEC
   	SBC	temp2
.skipelse24_2
	STA	temp5
end	
	if temp5 < 8 && e{1} && player0y< 40 then w{2}=!w{2}

	asm
 	LDA	w
	LDX	player2x
  	AND	#4
   	BNE	.skipL0418_2
   
   	CPX	#140
   	BCS	.condpart222_2
.skipL0418_2	

	CPX	#28
	BCS	.skipL0419_2
.condpart222_2
	LDA	#120
   	STA	player2y
   	LDA	#$00
   	STA	COLUP2
.skipL0419_2
end
	on temp4 goto Person2_0 Person2_1 Person2_2 Person2_3
Person2_0
	player2:
	%01000100
 	%01101010
 	%00011000
 	%00111000
 	%00111110
 	%00111000
 	%00111000
 	%00011100
 	%00111000
 	%00111110
 	%00110100
 	%00011000
end
	goto Person3	
Person2_1
 	player2:
 	%00111100
 	%00101000
 	%00111000
 	%00111100
 	%00111000
 	%00011100
 	%00011100
 	%00111000
 	%00111110
 	%00110100
 	%00011000
 	%00000000
end
	goto Person3
Person2_2
 	player2:
 	%00011100
 	%00011000
 	%00111000
 	%00111100
 	%00111010
 	%00111100
	%00011100
 	%00001110
 	%00011100
 	%00011111
 	%00011010
 	%00001100
end
	goto Person3
Person2_3
 	player2:
 	%00110000
 	%00101100
 	%00111000
 	%00111000
 	%00111100
 	%00111000
 	%00110100
 	%00111000
 	%01110000
 	%01111100
 	%01101000
 	%00110000
end

Person3
	asm
  	LDA	player0y
   	SEC
   	SBC	player0height
	CMP	#4
   	BCC	.skipL0444_1
 	LDA	player0y
   	CMP	#30
   	BCS	.skipL0444_1

   	LDA	player0height
   	CLC
  	ADC	#4
   	STA	player0y
.skipL0444_1
   	lda	#2
   	bit	SWCHB
   	BNE	.skipL0445_1
   	LDA	e
   	ORA	#64
	ORA	#16
   	STA	e
   	LDA	#1
   	STA	duration
   	LDA	#0
   	STA	REFP0
	STA	_NUSIZ1
   	STA	NUSIZ2
	STA	NUSIZ3
	STA	NUSIZ4
	STA	NUSIZ5
	STA	Selection
  	sta	temp7
   	lda	#>(.MusicSetup1-1)
   	pha
   	lda	#<(.MusicSetup1-1)
   	pha
   	lda	temp7
   	pha
  	
   	pha
   	ldx	#1
   	jmp	BS_jsr
.skipL0445_1
end
	if PowerUp_Counter>0 then goto SomeCrazyStuff bank5

	asm
	LDA	#90
	CMP	player5y
     	BCS	.condpart229_17
	CMP	player1y
     	BCS	.condpart229_17
	CMP	player2y
     	BCS	.condpart229_17

	CPY	#248
  	BCC	.condpart229_17
  	LDA	e
  	AND	#2
  	BNE	.skip70OR_17
.condpart229_17

  	jmp	.Nothing
.skip70OR_17
  	LDA	player1x
  	CMP	player0x
  	BCS	.skipL0520_17
  	LDA	w
  	AND	#191
  	LDX	#26
	jmp	.skipelse20_17
.skipL0520_17
  	LDA	w
  	ORA	#64
  	LDX	#138
.skipelse20_17
  	STA	w
	STX	player5x

	LDA	#86
	PHA
	lda	rand
	lsr
  	bcc	*+4
  	eor	#$B4
  	sta	rand
	AND	#31
  	TAY
  	PLA
  	TSX
 	STY	$00,x
  	SEC
 	SBC	$00,x
  	STA	player5y
 	CMP	#70
  	BCC	.skipL0522_17
  	LDA	w
  	AND	#127
	jmp	.skipelse21_17
.skipL0522_17
 	LDA	w
  	ORA	#128
.skipelse21_17
	STA	w
end

	PowerUp_Type=COLUP5/32
	asm
	LDA 	#7
	CMP	PowerUp_Type
	BCS	.rfv
	STA	PowerUp_Type
.rfv
end
	if !o{1} then goto Othersprites

	player5:
	%11000011
 	%10010001
 	%00000000
 	%00011000
 	%00000100
 	%00100100
 	%10011001
 	%11000011
end
	goto Nothing 
Othersprites
	on PowerUp_Type goto P0 P1 P2 P3 P4 P5 P6 P7
P0
 	player5:
 	%11011011
 	%10111101
 	%01010010
 	%11011111
 	%11111011
 	%01001010
 	%10111101
 	%11011011
end
	goto Nothing 
P1
 	player5:
 	%11000011
 	%11111001
 	%01000101
 	%00110010
 	%00001101
 	%01001000
 	%10110001
 	%11000011
end
	goto Nothing 
P2
 	player5:
 	%11000011
 	%10100001
 	%01001000
 	%10010010
 	%10010010
 	%01001000
 	%10100001
 	%11000011
end
	goto Nothing 
P3
 	player5:
 	%11010011
 	%10111101
 	%00000010
 	%00100010
 	%01000100
 	%01000000
 	%10111101
 	%11001011
end
	goto Nothing 
P4
 	player5:
 	%11000011
 	%10011001
 	%00100100
 	%11011011
 	%11111011
 	%00101100
 	%10011001
 	%11000011
end
	goto Nothing 
P5
 	player5:
 	%11000011
 	%10111101
 	%00011000
	%11100111
 	%01011010
 	%01011010
 	%10100101
 	%11000011
end
	goto Nothing 
P6
 	player5:
 	%11000011
 	%10100101
 	%00111100
 	%01011010
 	%01011010
 	%00111100
 	%10011001
 	%11000011
end
	goto Nothing 
P7
 	player5:
 	%11000011
 	%10011001
 	%00100100
 	%11011011
 	%01111110
 	%00111100
 	%10011001
 	%11000011
end
Nothing
	COLUP5=COLUP5+1

	temp4=player0height/2
	temp2=player0y-temp4

	asm
	LDA	player5y
  	SEC
  	SBC	#4
  	STA	temp3

   	CMP	temp2
   	BCS	.skipL0306_1
   	LDA	temp2
	SEC
   	SBC	temp3
   	jmp	.skipelse14_11
.skipL0306_1
      	SEC
   	SBC	temp2
.skipelse14_11
  	STA	temp5

   	LDA	player0x
   	CMP	player5x
   	BCS	.skipL0307_1
	LDA	player5x
   	SEC
   	SBC	player0x
	jmp	.skipelse15_1
.skipL0307_1
 	SEC
	SBC	player5x
.skipelse15_1
	STA	temp4


   	CMP	#10
   	BCS	.condpart156_1

  	LDA	#8
	CMP	temp5
	BCS	.skip51OR_1
.condpart156_1
	sta	temp7
  	lda	#>(.No_Catch-1)
  	pha
  	lda	#<(.No_Catch-1)
	jmp	.Spellbreaker

.skip51OR_1

	LDA	e
   	LSR
   	BCC	.skipL030_7
   	LDA	w
   	ORA	#32
   	jmp	.skipelse_11
.skipL030_7
  	LDA	w
  	AND	#223
.skipelse_11
	STA	w
end
	AUDV0=10: AUDC0=15: AUDF0=3 
	asm
	LDA	PowerUp_Type
   	CMP	#5
   	BEQ	.condpart159_1
	CMP	#7
	BNE	.skip52OR_1
.condpart159_1
   	LDA	#5
   	STA	PowerUp_Counter
	sta	temp7
  	lda	#>(.Its5-1)
  	pha
  	lda	#<(.Its5-1)
	jmp	.Spellbreaker
.skip52OR_1
	sta	temp7
  	lda	#>(.Nothing2-1)
  	pha
  	lda	#<(.Nothing2-1)
.Spellbreaker
	pha
  	lda	temp7
  	pha
  	
  	pha
  	ldx	#5
  	jmp	BS_jsr

end
 bank 8 
	inline playerscores_multi4Reaper.asm
	asm
Playfield

 .byte $d6, $0c, $0c, $0c, $0c, $0c, $0c, $0c, $0c, $0c, $0c, $0c, $0c, $0c, $0c, $0c, $0c, $0c, $0c, $0c, $0c, $0c, $0c
end
	vblank
 	asm
 	lda #$00
 	sta $1F 
 	sta $1E
 	sta ENAM1
  	sta ENABL 


end
	if w{0} then goto BullShit bank6 else return

	
