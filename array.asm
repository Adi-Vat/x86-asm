bits 64
default rel

section .data
    row db 3,2,1
    rowLen db 3
    fmt db "%d",0
    cma db ", ",0

section .text
global main
extern printf
extern ExitProcess

main:
    push rbp
    mov rbp, rsp
    sub rsp, 32

    mov r12, row ; counter
    movzx r13, byte [rowLen]
    add r13, r12

.arrayloop:
    lea rcx, [fmt]
    movzx rdx, byte [r12]
    call printf
    inc r12
    cmp r12, r13
    jge .exit
    lea rcx, [cma]
    xor rdx, rdx
    call printf
    jmp .arrayloop


.exit:
    xor rax, rax
    call ExitProcess