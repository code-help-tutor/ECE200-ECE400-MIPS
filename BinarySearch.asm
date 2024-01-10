WeChat: cstutorcs
QQ: 749389476
Email: tutorcs@163.com
## ECE200 Project 1 Binary Search ##
	.data 
length: .word 10					#length of array
nums: 	.word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10		#elements of array
target: .word 11					#target to search
string: .asciiz	"Target not found"			#the output string
	.text
	lui 	$s0, 	0x1001				#first get access to the address of length of array
	lw	$s1,	0($s0)				#load address of length of array into s1
	sll	$t0,	$s1,	2			#t0 has the length of the array
	add	$t0,	$t0,	$s0			#t0 now is the address of the target
	lw	$s2,	4($t0)				#s2 is the value of target
	addi	$s6,	$zero,	0			#let Low = 0
	addi	$s7,	$s1,	-1			#let High = n-1
	
loop: 	sub	$t1,	$s7,	$s6			#let high - low
	bltz 	$t1,	nfound				#branch to not found if high - low < 0
	nop	
	srl	$s3,	$t1,	1			#(high-low)/2
	add	$s3,	$s3,	$s6			#s3 = (high-low)/2+low = (high+low)/2 middle index
	sll	$t1,	$s3,	2			#t1 has the length of first number to middle number
	add	$t2,	$s0,	$t1			#t2 is the address of the middle number
	lw	$s4,	4($t2)				#s4 has the value of middle number
	sub	$t3,	$s2,	$s4			#t3 = s2 - s4, which is target - middle value
	beq	$t3,	$zero	result			#if target value is equal to middle value, found target
	nop	
	bltz	$t3,	updateH				#if target value is less than middle value, update the higher boundary
	nop
	bgtz	$t3,	updateL				#if target value is greater than middle value, update the lower boundary
	nop
	
nfound: addi	$v0,	$zero,	4			#print char
	addi	$t0,	$t0,	8
	or 	$a0,	$t0,	$zero
	syscall
	addi	$v0,	$zero,	10
	syscall	
	
updateH:addi	$s7,	$s3,	-1		#set H' = (H-L)/2 - 1
	j	loop					#jump back to loop
	nop
	
updateL:addi	$s6,	$s3,	1		#set L' = (H-L)/2 + 1
	j	loop					#jump back to loop
	nop
									
result: addi	$v0,	$zero,	1			#print	array index
	or 	$a0,	$s3,	$zero
	syscall 
	addi	$v0,	$zero,	10
	syscall
							



	
	
	
	

