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

	jal set_screen_BLUE
	li $t5, 0x0096d9e9
	sw $t5, 0($t0)
	j END

set_screen_BLUE:
	li $t0, FRAME_BASE
	li $t1, 0xff0000
	addi $t2, $t0, 65024
	j setPixel_SCREEN
	
setPixel_SCREEN:

    sw $t1, 0($t0) # set $t2 to white
    addi $t0, $t0, 512 # increment $t0 to next row
    ble $t0, $t2, setPixel_SCREEN
    jr $ra

    
END: 
	li $v0, 10 # terminate the program gracefully
	syscall
