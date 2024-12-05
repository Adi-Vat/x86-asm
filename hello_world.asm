bits 64
default rel

section .data
    format db "%c", 0
    num db 48

section .text
    global main

    extern printf
    extern ExitProcess

main:
    push rbp
    mov rbp, rsp
    sub rsp, 32

    lea rcx, [format]
    movzx rdx, byte [num]
    add rdx, 17
    call printf 

    xor rax, rax
    call ExitProcess