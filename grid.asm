bits 64
default rel

section .data
    grid times 225 db '.'
    gridWidth db 15
    gridLen dw 225  
    fmt db " %c ",0
    nl db 0xd,0xa


section .text
global main
extern printf
extern ExitProcess

main:
    push rbp
    mov rbp, rsp
    sub rsp, 32


showgrid:
    mov r12, grid ; store the address of the grid array in r12
    mov r13, 0 ; store the column counter as 0
.loop:
    lea rcx, [fmt]
    movzx r14, byte [gridWidth] ; store the intended width of the grid array

    movzx rdx, byte [r12] ; store the array value at the current index in rdx

    call printf
    inc r12 ; increment the index of the array
    inc r13 ; increment the column counter
    
    cmp r13, r14 ; compare the column counter with the width
    jl .loop ; loop if it's less than the width

    lea rcx, [nl]
    call printf

    mov r13, 0 ; set column counter to 0
    mov r8, grid ; store grid address in r8
    movzx r9, word [gridLen] ; store grid length in r9
    add r8, r9 ; add length to address to get the last item
    cmp r12, r8 ; compare final item and current item
    jl .loop ; loop if it hasn't reached the final item yet
    
.exitloop:
    xor rax, rax
    call ExitProcess

