section .bss
    name resw 4
    rus resw 10

section .data
    msg dw "[~] What is your name?",0Ah
    msgl equ $-msg
    msg1 dw "[!] Hello " 
    msg1l equ $-msg1

section .text
global _start

exit:
    mov eax,1
    mov ebx,1
    int 0x80

_start:
    mov eax,4
    mov ebx,1
    mov ecx,msg
    mov edx,msgl
    int 0x80

    mov eax,3
    xor ebx,ebx
    mov ecx,name
    mov edx,10
    int 0x80

    mov eax,4
    mov ebx,1
    mov ecx,msg1
    mov edx,msg1l
    int 0x80

    mov eax,4
    mov ebx,1
    mov ecx,name
    mov edx,10
    int 0x80    
 
    mov eax,4
    mov ebx,1
    mov ecx,rus
    mov edx,4
    int 0x80
    
    jmp exit
