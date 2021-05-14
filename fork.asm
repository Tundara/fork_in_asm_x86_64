BITS 64

global _start

section .rodata
    string_fork db "Hello i am a child process !",10,0
    string_fork_len equ $-string_fork

section .text

_start:
    mov rax, 57
    syscall
    cmp rax, 0
    jne _exit
    je _child_process

_child_process:
    mov rax, 1
    mov rdi, 1
    mov rsi, string_fork
    mov rdx, string_fork_len
    syscall
    jmp _exit

_exit:
    mov rax, 60
    mov rdi, 0
    syscall