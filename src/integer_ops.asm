.data
	msg: .asciiz "Forneça um número: "

.text
	li $t0, 25
	li $t1, 75
	add $s0, $t0, $t1
	addi $s1, $s0, 36
	
	sub $s2, $t1, $t0
	subi $s3, $s1, 200
	
	li $t2, 4
	mul $s4, $t1, $t2
	mul $s5, $t0, 3
	
	sll $t3, $t0, 6
	
	li $t4, 3
	div $t3, $t4	# divisão inteira - resultado em lo & resto em hi
	mflo $t6	# move do registrador lo para $t6
	mfhi $t7	# move do registrador hi para $t7
	
	li $v0, 4
	la $a0, msg
	syscall 
	
	li $v0, 5	# lê inteiro
	syscall 	# valor lido é armazenado em $v0
	
	move $a0, $v0
	li $v0, 1
	syscall