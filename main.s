section .bss
    name resb 12
    ansq1 resb 4

section .data
    msg db "[!] Welcome to this Quizzer!", 0Ah
    msgl equ $-msg
    msg2 db "[~] Hello, ",0
    msg2l equ $-msg2
    q1 db "[?] What year did India gain indpendence? "
    q1l equ $-q1

section .text
global _start
goodbye:
    mov eax,1
    mov ebx,1
    int 0x80

rightq1:
    mov eax,4
    mov ebx,1
    mov byte [msg2],0x0A
    mov byte [msg2+1],0
    
    mov byte [msg2],'['
    mov byte [msg2+1],'!'
    mov byte [msg2+2],']'
    mov byte [msg2+3],' '
    mov byte [msg2+4],'R'
    mov byte [msg2+5],'i'
    mov byte [msg2+6],'g'
    mov byte [msg2+7],'h'
    mov byte [msg2+8],'t'
    mov byte [msg2+9],'!'
    mov byte [msg2+10],0Ah

wrongq1:
    mov eax,4
    mov ebx,1
    mov byte [msg2],0x0A
    mov byte [msg2+1],0
    
    mov byte [msg2],'['
    mov byte [msg2+1],'!'
    mov byte [msg2+2],']'
    mov byte [msg2+3],' '
    mov byte [msg2+4],'W'
    mov byte [msg2+5],'r'
    mov byte [msg2+6],'o'
    mov byte [msg2+7],'n'
    mov byte [msg2+8],'g'
    mov byte [msg2+9],'!'
    mov byte [msg2+10],0Ah

    mov ecx,msg2
    mov edx,11
    int 0x80

    jmp goodbye

_start:
    mov eax,4
    mov ebx,1
    mov ecx,msg
    mov edx,msgl
    int 0x80            ; [!] Welcome to this Quizzer!

    mov eax,4
    mov ebx,1

    mov byte [msg], 0x0A
    mov byte [msg+1],0

    mov byte [msg],'['
    mov byte [msg+1],'!'
    mov byte [msg+2],']'
    mov byte [msg+3],' '
    mov byte [msg+4],'N'
    mov byte [msg+5],'a'
    mov byte [msg+6],'m'
    mov byte [msg+7],'e'
    mov byte [msg+8],'?'
    mov byte [msg+9],' '
    mov byte [msg+10],0Ah
    mov ecx,msg
    mov edx,10
    int 0x80            ; [!] Name?
    
    mov eax,3
    xor ebx,ebx
    mov ecx,name
    mov edx,12
    int 0x80            ; <entering the name>

    mov eax,4
    mov ebx,1
    mov ecx,msg2
    mov edx,msg2l
    int 0x80            ; [~] Hello,

    mov eax,4
    mov ebx,1
    mov ecx,name
    mov edx,12
    int 0x80            ; <name>
 
    
    mov eax,4
    mov ebx,1
    mov ecx,q1
    mov edx,q1l
    int 0x80            ; printing the first ques

    mov eax,3
    xor ebx,ebx
    mov ecx,ansq1
    mov edx,4
    int 0x80            ; <answer for first ques>

    xor eax,eax
    xor ebx,ebx
    mov eax, [ansq1]
    mov ebx,1947
    cmp eax,ebx
    jne rightq1
    je wrongq1
