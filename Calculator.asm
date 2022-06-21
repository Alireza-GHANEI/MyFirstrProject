%include "asm_io.inc"

segment .data

msg1 db "Enter your first digit :"
msg2 db "Enter your second digit :"
msg3 db "Enter the desired operation to calculate (+ , - , * , /)"
msg4 db "Error , Unknown operation !!"


segment .text

global asm_main
asm_main:
enter 0,0
pusha



call read_int
mov ebx, eax

call read_char
mov ecx, eax


call read_int
mov edx, eax

cmp ecx,43
je addition 

cmp ecx, 45
je subtraction

cmp ecx,42
je multiplication

cmp ecx, 47
je division

jmp end

division:
    mov ecx,edx
    mov edx,0
    mov eax,ebx
    div ecx
    call print_int
    jmp end

multiplication:
    mov eax,ebx
    mov ecx, edx
    mul ecx
    call print_int
    
    jmp end

subtraction:
    sub ebx, edx
    mov eax, ebx
    call print_int
    jmp end

addition:
    add ebx,edx
    mov eax,ebx
    call print_int


end:
call print_nl

popa
leave
ret