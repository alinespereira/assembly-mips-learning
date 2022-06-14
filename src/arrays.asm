.data
	msg: .asciiz "Digite o tamanho do array: "

.text

.main:
	la $a0, msg
	jal printString
	
	jal readInteger
	
	move $s0, $v0		# number of integers to allocate
	li $s1, 4		# number of bytes per integer
	mul $s2, $s0, $s1	# total size to be allocated
	move $a0, $s2
	li $v0, 9		# allocate $a0 bytes; address allocated will be at $v0
	syscall
	
	move $s3, $v0
	
	li $t0, 0
	move $t1, $s3
	readData:
		beq $t0, $s2, dataRead
		jal readInteger
		sw $v0, 0($t1)
		add $t0, $t0, $s1	# "index"
		add $t1, $t1, $s1	# memory address
		j readData
	dataRead:
	
	li $t0, 0
	move $t1, $s3
	printData:
		beq $t0, $s2, dataPrinted
		lw $a0, 0($t1)
		li $v0, 1
		syscall
		add $t0, $t0, $s1	# "index"
		add $t1, $t1, $s1	# memory address
		j printData
	dataPrinted:
	
	
	jal exit
	
printString:
	li $v0, 4
	syscall
	jr $ra
	
readInteger:
	li $v0, 5
	syscall
	jr $ra
	
exit:
	li $v0, 10
	syscall
