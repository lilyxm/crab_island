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
	addi $t7, $t9, 65024
	addi $t8, $t9, 65532
	sw $t5, ($t7)
	sw $t5, ($t8)
END: 
	li $v0, 10 # terminate the program gracefully
	syscall
