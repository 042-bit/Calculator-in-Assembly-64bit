[BITS 64]

section .data

msg_liczba db "[blad] : nie podano liczb",10
msg_len_liczba equ $ - msg_liczba

liczba db "Podaj liczbe która chcesz policzyc [pierwsza liczba]  :  ", 6
liczba_len equ $ - liczba 

liczbae db "Podaj znak operacji która chcesz wykonac  :  ", 6
liczbae_len equ $ - liczbae

liczbaf db "Podaj liczbe która chcesz policzyc [druga liczba]  :  ", 6
liczbaf_len equ $ - liczbaf


divide_by_zero db "[Error] Nie wolno dzielic przez 0", 10
divide_by_zero_len equ $ - divide_by_zero


section .text

;arg 1 
mov rax, 1
mov rdi, 1
mov rsi, liczba
mov rdx, liczba_len
syscall

mov rax, 0
mov rdi, 0
mov rsi, arg1
mov rdx, 64
syscall

mov [fd_1], rax

;arg2 
mov rax, 1
mov rdi, 1
mov rsi, liczbae
mov rdx, liczbae_len
syscall

mov rax, 0
mov rdi, 0
mov rsi, arg2
mov rdx, 64
syscall

mov [fd_2], rax

;arg 3 
mov rax, 1
mov rdi, 1
mov rsi, liczbaf
mov rdx, liczbaf_len
syscall

mov rax, 0
mov rdi, 0
mov rsi, arg3
mov rdx, 64
syscall

mov [fd_3], rax

xor r11, r11
xor rcx, rcx
xor r12, r12
xor r9, r9

jmp .swap_arg_one

.swap_arg_one:

	cmp byte [arg1 + rcx], 30h
	je .add0
	cmp byte [arg1 + rcx], 31h
	je .add1
	cmp byte [arg1 + rcx], 32h
	je .add2
	cmp byte [arg1 + rcx], 33h
	je .add3
	cmp byte [arg1 + rcx], 34h
	je .add4
	cmp byte [arg1 + rcx], 35h
	je .add5
	cmp byte [arg1 + rcx], 36h
	je .add6
	cmp byte [arg1 + rcx], 37h
	je .add7
	cmp byte [arg1 + rcx], 38h
	je .add8
	cmp byte [arg1 + rcx], 39h
	je .add9
	cmp [fd_1], rcx
	je .swap_arg_three
	

.add0sd:

    mov al, 0x00
    mov byte [arg1_buff + rcx], al
	add rcx, 1 
	jmp .swap_arg_one

.add1sd:

    mov byte al, 0x01
    mov byte [arg1_buff + rcx], al
	add rcx, 1 
    jmp .swap_arg_one

.add2sd:

    mov byte al, 0x02
    mov byte[arg1_buff + rcx], al
	add rcx, 1 
    jmp .swap_arg_one

.add3sd:

    mov byte al, 0x03
    mov byte[arg1_buff + rcx], al
	add rcx, 1 
    jmp .swap_arg_one

.add4sd:

    mov byte al, 0x04
    mov byte [arg1_buff + rcx], al
	add rcx, 1 
	jmp .swap_arg_one

.add5sd:

    mov byte al, 0x05
    mov byte [arg1_buff + rcx], al
	add rcx, 1 
    jmp .swap_arg_one

.add6sd:

    mov byte al, 0x06
    mov byte [arg1_buff + rcx], al
	add rcx, 1 
    jmp .swap_arg_one

.add7sd:

    mov byte al, 0x07
    mov byte [arg1_buff + rcx], al
	add rcx, 1 
    jmp .swap_arg_one

.add8sd:

    mov byte al, 0x08
    mov byte [arg1_buff + rcx], al
	add rcx, 1 
    jmp .swap_arg_one

.add9sd:
	
	mov byte al, 0x09
    mov byte [arg1_buff + rcx], al
	
	add rcx, 1 
	jmp .swap_arg_one

.swap_arg_three: 

    cmp byte [arg3 + r9], 30h
	je .add02
	cmp byte [arg3 + r9], 31h
	je .add12
	cmp byte [arg3 + r9], 32h
	je .add22
	cmp byte [arg3 + r9], 33h
	je .add32
	cmp byte [arg3 + r9], 34h
	je .add42
	cmp byte [arg3 + r9], 35h
	je .add52
	cmp byte [arg3 + r9], 36h
	je .add62
	cmp byte [arg3 + r9], 37h
	je .add72
	cmp byte [arg3 + r9], 38h
	je .add82
	cmp byte [arg3 + r9], 39h
	je .add92
	cmp [fd_3], r9
	je .op

.add02:

    mov al, 0x00
    mov byte [arg3_buff + r9], al
	add r9, 1 
	jmp .swap_arg_three

.add12:

    mov byte al, 0x01
    mov byte [arg3_buff + r9], al
	add r9, 1 
    jmp .swap_arg_three

.add22:

    mov byte al, 0x02
    mov byte[arg3_buff + r9], al
	add r9, 1 
    jmp .swap_arg_three

.add32:

    mov byte al, 0x03
    mov byte[arg3_buff + r9], al
	add r9, 1 
    jmp .swap_arg_three

.add42:

    mov byte al, 0x04
    mov byte [arg3_buff + r9], al
	add r9, 1 
	jmp .swap_arg_three

.add52:

    mov byte al, 0x05
    mov byte [arg3_buff + r9], al
	add r9, 1 
    jmp .swap_arg_three

.add62:

    mov byte al, 0x06
    mov byte [arg3_buff + r9], al
	add r9, 1 
    jmp .swap_arg_three

.add72:

    mov byte al, 0x07
    mov byte [arg3_buff + r9], al
	add r9, 1 
    jmp .swap_arg_three

.add82:

    mov byte al, 0x08
    mov byte [arg3_buff + r9], al
	add r9, 1 
    jmp .swap_arg_three

.add92:
	
	mov byte al, 0x09
    mov byte [arg3_buff + r9], al
	
	add r9, 1 
	jmp .swap_arg_three


jmp .op


.op: 

    cmp byte [arg2], 2Ah
	je .mult
	cmp byte [arg2], 2Bh
	je .addt
	cmp byte [arg2], 2Dh
	je .subt
	cmp byte [arg2], 2Fh
	je .divt


.addt:

    push rax 
    xor rax, rax
    mov rax, [arg1_buff]
    add rax, [arg3_buff]

    mov [suma], rax

    mov [suma_b], rax

    jmp .check

.error:

    mov rax, 60
    xor rdi,rdi
    syscall


.mult: 

    mov rax, [arg1_buff]
    imul rax, [arg3_buff]

    mov [suma], rax

    mov [suma_b], rax

    jmp .check

.subt:

    push rax 
    xor rax, rax
    mov rax, [arg1_buff]
    sub rax, [arg3_buff]

    mov [suma], rax

    mov [suma_b], rax

    jmp .check


.divt:

    xor rdx, rdx
    mov qword rax, [arg1_buff]
    cmp rax, 0 
    je .error_divide_by_zero
    mov qword rcx, [arg3_buff]
    cmp rcx, 0 
    je .error_divide_by_zero

    div rcx

    mov [suma], rax

    mov [suma_b], rax

    jmp .check


.error_divide_by_zero:

    mov rax, 1
    mov rdi, 1
    mov rsi, divide_by_zero
    mov rdx, divide_by_zero_len
    syscall

    mov rax, 60
    xor rdi, rdi
    syscall

.check:

    mov rax, [suma_b]
    cmp rax, 16  

    jbe .con

    mov rax, [suma_b]
    cmp rax, 100

    JBE .con2

    mov rax, [suma_b]

    cmp rax, 1000
    
    JBE .con6


.con:

    cmp byte [suma], 0x00
    je .add0c

    cmp byte [suma], 0x01
    je .add1c

    cmp byte [suma], 0x02
    je .add2c

    cmp byte [suma], 0x03
    je .add3c 

    cmp byte [suma], 0x04
    je .add4c

    cmp byte [suma], 0x05
    je .add5c

    cmp byte [suma], 0x06
    je .add6c

    cmp byte [suma], 0x07
    je .add7c

    cmp byte [suma], 0x08
    je .add8c

    cmp byte [suma], 0x09
    je .add9c

    cmp byte [suma], 0xA
    je .add10c

    cmp byte [suma], 0xB
    je .add11c

    cmp byte [suma], 0xC
    je .add12c

    cmp byte [suma], 0xD
    je .add13c

    cmp byte [suma], 0xE
    je .add14c

    cmp byte [suma], 0xF
    je .add15c

    cmp byte [suma], 0x10
    je .add16c

.con2:
    
    ret

.con6:
    
    ret

.add0c:

    mov byte al, 30h
    mov byte [equals_2], al

    mov byte al, 0Ah
    mov byte [equals_2 + 1], al
    jmp .equals

.add1c:
    
    mov byte al, 31h
    mov byte [equals_2], al

    mov byte al, 0Ah
    mov byte [equals_2 + 1], al
    jmp .equals

.add2c:

    mov byte al, 32h
    mov byte [equals_2], al

    mov byte al, 0Ah
    mov byte [equals_2 + 1], al
    jmp .equals

.add3c:
    
    mov byte al, 33h
    mov byte [equals_2], al

    mov byte al, 0Ah
    mov byte [equals_2 + 1], al
    jmp .equals

.add4c:
    
    mov byte al, 34h
    mov byte [equals_2], al

    mov byte al, 0Ah
    mov byte [equals_2 + 1], al
    jmp .equals

.add5c:
    
    mov byte al, 35h
    mov byte [equals_2], al

    mov byte al, 0Ah
    mov byte [equals_2 + 1], al
    jmp .equals

.add6c:
    
    mov byte al, 36h
    mov byte [equals_2], al

    mov byte al, 0Ah
    mov byte [equals_2 + 1], al
    jmp .equals

.add7c:
    
    mov byte al, 37h
    mov byte [equals_2], al

    mov byte al, 0Ah
    mov byte [equals_2 + 1], al
    jmp .equals

.add8c:
    
    mov byte al, 38h
    mov byte [equals_2], al

    mov byte al, 0Ah
    mov byte [equals_2 + 1], al
    jmp .equals

.add9c:

    mov byte al, 39h
    mov byte [equals_2], al

    mov byte al, 0Ah
    mov byte [equals_2 + 1], al
    jmp .equals

.add10c:

    mov byte al, 31h
    mov byte [equals_2], al

    mov byte al, 30h
    mov byte [equals_2 + 1], al

    mov byte al, 0Ah
    mov byte [equals_2 + 2], al
    jmp .equals

.add11c:

    mov byte al, 31h
    mov byte [equals_2], al

    mov byte al, 31h
    mov byte [equals_2 + 1], al

    mov byte al, 0Ah
    mov byte [equals_2 + 2], al
    jmp .equals

.add12c:

    mov byte al, 31h
    mov byte [equals_2], al

    mov byte al, 32h
    mov byte [equals_2 + 1], al

    mov byte al, 0Ah
    mov byte [equals_2 + 2], al
    jmp .equals

.add13c:

    mov byte al, 31h
    mov byte [equals_2], al

    mov byte al, 33h
    mov byte [equals_2 + 1], al

    mov byte al, 0Ah
    mov byte [equals_2 + 2], al
    jmp .equals

.add14c:

    mov byte al, 31h
    mov byte [equals_2], al

    mov byte al, 34h
    mov byte [equals_2 + 1], al

    mov byte al, 0Ah
    mov byte [equals_2 + 2], al
    jmp .equals

.add15c:

    mov byte al, 31h
    mov byte [equals_2], al

    mov byte al, 35h
    mov byte [equals_2 + 1], al

    mov byte al, 0Ah
    mov byte [equals_2 + 2], al
    jmp .equals

.add16c:

    mov byte al, 31h
    mov byte [equals_2], al

    mov byte al, 36h
    mov byte [equals_2 + 1], al

    mov byte al, 0Ah
    mov byte [equals_2 + 2], al
    jmp .equals

.equals:

    mov rax, 1 
    mov rdi, 1 
    mov rsi, equals_2
    mov rdx, 16
    syscall

    mov rax, 60 
    xor rdi, rdi 
    syscall

section .bss

arg1 resb 128
arg1_buff resb 128
arg3_buff resb 128
arg2 resb 128
arg3 resb 128
suma resb 128 
suma_b resb 128 

equals_two resb 16
equals_2 resb 16
fd_1 resb 16
fd_2 resb 16
fd_3 resb 16
