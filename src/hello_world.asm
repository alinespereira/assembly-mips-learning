.data
	msg: .asciiz "Hello, World!"
	char: .byte 'A'
	integer: .word 32


.text
	la $a0, msg 	# load_address: Carrega o endereço de msg no registrador $a0
	li $v0, 4   	# load_immediate: carrega o valor 4 em $v0 (instrução para imprimir char ou string)
	syscall
	
	la $a0, char
	li $v0, 4
	syscall
	
	lw $a0, integer	# load_word
	li $v0, 1
	syscall
	
	li $v0, 10	# encerrar programa
	syscall