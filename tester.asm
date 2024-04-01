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
.eqv PIXEL_SIZE 4 # 4x4 

.eqv CRAB_WIDTH 14
.eqv CRAB_HEIGHT 8
.eqv URCHIN_WIDTH 11
.eqv URCHIN_HEIGHT 7

.text
main: 

	li $t9, FRAME_BASE
	li $t5, 0x0096d9e9
	sw $t5, 0($t9)
	
	#lw $t1, 0($t9)
###### CHECK KEY_PRESSED #######################
CHECK_KEY_PRESSED:
	li $t1, 0xFFFF0000  
	lw $t2, 0($t1) 
	bne $t2, 1, if_NOT_pressed
	lw $t0, 4($t1) # this assumes $t1 s set to 0xfff0000 from before
	
	### check wasd keys
	beq $t0, 100, if_d_pressed

if_d_pressed:
	jal move_RIGHT
	j end_if_keypressed_happened

end_if_keypressed_happened:
	j END
if_NOT_pressed:

GAME_LOOP:

	j CHECK_KEY_PRESSED

move_RIGHT:
	li $t0, 5
	li $t1, 4 ## each push of the button should increase by thins amount
	mult $t0, $t1
	mflo $t1
	add $t8, $t9, $t0 #save last position
	add $t9, $t9, $t1 #move right
	j DRAW

DRAW:
	sw $t5, 0($t9)
	jr $ra
END: 
	li $v0, 10 # terminate the program gracefully
	syscall
