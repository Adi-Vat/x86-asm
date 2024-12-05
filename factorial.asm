bits 64
default rel

section .data
    fmt db "%d", 0xd, 0xa, 0
    value db 6

section .text
global main
extern printf
extern ExitProcess

main:
    push rbp ; push stack base pointer onto stack
    mov rbp, rsp ; reduce stack size to 0 (move base pointer to top pointer)
    sub rsp, 32 ; increase stack size by 32

    mov rsi, 1 ; factorial result stored here (result)
    mov rbx, 1 ; counter (x)

.forloop:
    inc rbx ;increment (x)
    imul rsi, rbx ; multiply counter by current result

    cmp rbx, [value] ; compare counter
    jl .forloop ; jump to .forloop if (x) < 5

.endloop:
    lea rcx, byte [fmt] ; load integer format
    mov rdx, rsi ; load (result) into print arg
    call printf
    
    xor rdx, rdx ;clear rdx
    xor rsi, rsi ;clear rsi
    xor rax, rax ;clear rax
    call ExitProcess
