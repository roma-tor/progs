section .data
	array_ dd 34, -7, 67, 98, 9
	scale equ 4
	size equ ($ - array_) / scale
	fmt db "%d ", 10, 0
SECTION .text
	extern printf
	global main
main:
	push rbp
	mov rbp, rsp
	mov rcx, 0
	mov rbx, 2
	xor r14,  r14 ; not useful by os
	
convertor:
	cmp rcx, size
	je print
	movsx rax, dword[array_ + rcx * 4]
	imul rbx
	mov dword[array_ + rcx * scale], eax
	inc rcx
	jmp convertor
	
print:
	cmp r14, size
	je end
	mov rdi, fmt
	movsx rsi, dword[array_ + r14 * scale]
	xor rax, rax
	call printf
	inc r14
	jmp print
end:
	leave
	ret
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
