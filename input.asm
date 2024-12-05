bits 64
default rel

section .data
    prompt db "Input: ", 0
    fmt db "%s", 0

section .bss
    inp resb 32

section .text

global main
extern ExitProcess
extern printf
extern scanf

main:
    push rbp
    mov rbp, rsp
    sub rsp, 32

    mov rcx, prompt
    call printf
    
    lea rcx, [fmt]
    mov rdx, inp
    call scanf
    
    lea rcx, [fmt]
    lea rdx, [inp]
    call printf

    xor rax, rax
    call ExitProcess

