bits 64
default rel

section .data
    fmt db "%d", 0
    num db 227

section .text
global main
extern printf
extern ExitProcess    

main:
    push rbp
    mov rbp, rsp
    sub rsp, 64
    movzx rbx, byte [num]
    mov r12, 4 ;store stack top ptr  

.d2b:
    ; take number
    ; divide by 2
    ; push remainder to stack, increment stack ptr
    ; set number to quotient
    ; repeat until quotient is 0
    ; pop and display everything from the stack until stack ptr = 0

    mov r8, 2 ; store divisor
    xor rdx, rdx ; clear dividend
    mov rax, rbx ; store dividend in rax
    idiv r8 ; divide rax by divisor
    mov [rbp + r12], rdx ; push remainder onto stack
    mov rbx, rax ; move result into non-volatile register
    add r12, 4 ; move stack ptr up
    test rbx, rbx ; check if result is 0
    jnz .d2b ; jump if not zero
    sub r12, 4

.print:
    mov rdx, [rbp + r12] ; pop data onto rdx
    lea rcx, [fmt] ; load the double format
    call printf
    sub r12, 4 ; move stack ptr down
    test r12, r12 ; check if the top stack ptr = 0
    jnz .print

.exit:
    xor rax, rax
    call ExitProcess