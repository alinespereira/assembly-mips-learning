.data
	inputmsg: .asciiz "Qual é seu nome?\n"
	outputmsg: .asciiz "Olá, "
	name: .space 30
.text
	
	li $v0, 4
	la $a0, inputmsg
	syscall
	
	li $v0, 8	# instrução para ler string
	la $a0, name	# endereço que receberá a string
	la $a1, 30	# tamanho a ser lido
	syscall
	
	li $v0, 4
	la $a0, outputmsg
	syscall
	
	li $v0, 4
	la $a0, name
	syscall	