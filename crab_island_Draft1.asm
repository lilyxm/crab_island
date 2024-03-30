# Bitmap display starter code
#
# Bitmap Display Configuration:
# - Unit width in pixels: 4
# - Unit height in pixels: 4
# - Display width in pixels: 256
# - Display height in pixels: 256
# - Base Address for Display: 0x10008000 ($gp)
#
.eqv FRAME_BASE 0x10008000
#.eqv MS_PER_FRAME 33
.eqv FRAME_HEIGHT 512
.eqv FRAME_WIDTH 512

.eqv MAX_ADDRESS 65532

.eqv RED 0x00ee1420
.eqv BLACK 0x00000001
.eqv BACKGROUND_BLUE 0x0096d9e9
.eqv GRAVITY 1
.eqv BOTTOM_GREATER_THAN 60928 #LAST ROW INDEX - HEIGHT


.text
main:
	li $t9, FRAME_BASE  # $t9 stores graph top left corner address
	
	#initial drawings
	jal set_screen_BLUE
	jal loadCrabColours
	j GAME_LOOP
	
	j END


GAME_LOOP:
	#check collision with bottom
	li $t0, BOTTOM_GREATER_THAN
	li $t1, FRAME_BASE
	add $t0, $t1, $t0
	bge $t9, $t0, END
	#erase crab
	jal eraseCrab
	
	#move crab by gravitiy
	li $t0, GRAVITY
	li $t1, FRAME_WIDTH
	mult $t0, $t1
	mflo $t1
	add $t9, $t9,$t1 #lower crab
	
	jal loadCrabColours
	
	j GAME_LOOP

set_screen_BLUE:
	li $t0, FRAME_BASE
	li $t1, BACKGROUND_BLUE
	addi $t2, $t0, 65536
	j setPixel_SCREEN
	
setPixel_SCREEN:

    sw $t1, 0($t0) # set $t2 to white
    addi $t0, $t0, 4 # increment $t2 to next index
    bne $t0, $t2, setPixel_SCREEN
    jr $ra 
	

loadCrabColours:	
	li $t1, BLACK 
	li $t0, RED
	j Draw_Crab

eraseCrab:
	li $t0, BACKGROUND_BLUE
	li $t1, BACKGROUND_BLUE
	j Draw_Crab

Draw_Crab:	
	sw $t0, 0($t9)
	sw $t0, 52($t9)

	sw $t0, 512($t9)
	sw $t0, 516($t9)
	sw $t0, 560($t9)
	sw $t0, 564($t9)

	sw $t0, 1024($t9)
	sw $t0, 1028($t9)
	sw $t1, 1044($t9)
	sw $t1, 1056($t9)
	sw $t0, 1072($t9)
	sw $t0, 1076($t9)

	sw $t0, 1544($t9)
	sw $t0, 1552($t9)
	sw $t0, 1556($t9)
	sw $t0, 1560($t9)
	sw $t0, 1564($t9)
	sw $t0, 1568($t9)
	sw $t0, 1572($t9)
	sw $t0, 1580($t9)

	sw $t0, 2060($t9)
	sw $t0, 2064($t9)
	sw $t0, 2068($t9)
	sw $t0, 2072($t9)
	sw $t0, 2076($t9)
	sw $t0, 2080($t9)
	sw $t0, 2084($t9)
	sw $t0, 2088($t9)

	sw $t0, 2564($t9)
	sw $t0, 2572($t9)
	sw $t0, 2576($t9)
	sw $t0, 2580($t9)
	sw $t0, 2584($t9)
	sw $t0, 2588($t9)
	sw $t0, 2592($t9)
	sw $t0, 2596($t9)
	sw $t0, 2600($t9)
	sw $t0, 2608($t9)

	sw $t0, 3080($t9)
	sw $t0, 3084($t9)
	sw $t0, 3088($t9)
	sw $t0, 3092($t9)
	sw $t0, 3096($t9)
	sw $t0, 3100($t9)
	sw $t0, 3104($t9)
	sw $t0, 3108($t9)
	sw $t0, 3112($t9)
	sw $t0, 3116($t9)

	sw $t0, 3588($t9)
	sw $t0, 3632($t9)

    	jr $ra








END:
	li $v0, 10 # terminate the program gracefully
	syscall

