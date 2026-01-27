section .bss
    name resb 12
    ansq1 resb 5
    ansq2 resb 5
    ansq3 resb 3    

section .data
    msg db "[!] Welcome to this Quizzer!", 0Ah
    msgl equ $-msg
    msg2 db "[~] Hello, ",0
    msg2l equ $-msg2
    q1 db "[?] What year did India gain indpendence? "
    q1l equ $-q1
    disclaim db "It's alright, we shall start again :)",0Ah
    disclaiml equ $-disclaim
    q3 db "[?] How many spokes are in the wheel in our flag? ",0
    q3l equ $-q3
    ext db "All correct, Well done!",0Ah
    extl equ $-ext 

section .text
global _start

goodbye:
    mov eax,1
    mov ebx,1
    int 0x80

q2:
    mov eax,4
    mov ebx,1
    
    mov byte [q1],0x0A
    mov byte [q1+1],0

    mov byte [q1],'['
    mov byte [q1+1],'?'
    mov byte [q1+2],']'
    mov byte [q1+3],' '
    mov byte [q1+4],'W'
    mov byte [q1+5],'h'
    mov byte [q1+6],'a'
    mov byte [q1+7],'t'
    mov byte [q1+8],' '
    mov byte [q1+9],'y'
    mov byte [q1+10],'e'
    mov byte [q1+11],'a'
    mov byte [q1+12],'r'
    mov byte [q1+13],' '
    mov byte [q1+14],'w'
    mov byte [q1+15],'a'
    mov byte [q1+16],'s'
    mov byte [q1+17],' '
    mov byte [q1+18],'r'
    mov byte [q1+19],'e'
    mov byte [q1+20],'p'
    mov byte [q1+21],'u'
    mov byte [q1+22],'b'
    mov byte [q1+23],'l'
    mov byte [q1+24],'i'
    mov byte [q1+25],'c'
    mov byte [q1+26],' '
    mov byte [q1+27],'d'
    mov byte [q1+28],'a'
    mov byte [q1+29],'y'
    mov byte [q1+30],'?'  
    mov byte [q1+31],' '
    mov byte [q1+32],0
    mov ecx,q1
    mov edx,33
    int 0x80

    mov eax,3
    xor ebx,ebx
    mov ecx,ansq2
    mov edx,5
    int 0x80

    xor eax,eax
    xor ebx,ebx
    xor ecx,ecx
        
    jmp converta2

qq3:
    mov eax,4
    mov ebx,1
    mov ecx,q3
    mov edx,q3l
    int 0x80

    mov eax,3
    xor ebx,0
    mov ecx,ansq3
    mov edx,3
    int 0x80

    xor eax,eax
    xor ebx,ebx
    xor ecx,ecx

    jmp converta3

donea3:
    cmp ebx,24 
    je final_thanks
    jne wrongq1
    jmp goodbye

final_thanks:
    mov eax,4
    mov ebx,1
    mov ecx,ext
    mov edx,extl
    int 0x80

    jmp goodbye    

converta3:
    mov al, [ansq3+ecx]
    cmp al,10
    je donea3
    sub al,'0'
    imul ebx,ebx,10
    add ebx,eax
    inc ecx
    jmp converta3

rightq2:
    mov eax,4
    mov ebx,1
    mov ecx,msg2
    mov edx,11
    int 0x80
    
    jmp qq3

donea2:
    cmp ebx,1950
    je rightq2
    jne wrongq1
    jmp goodbye

converta2:
    mov al, [ansq2+ecx]
    cmp al,10
    je donea2
    sub al,'0'
    imul ebx,ebx,10
    add ebx,eax
    inc ecx
    jmp converta2

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

    mov ecx,msg2
    mov edx,11
    int 0x80

    jmp q2

ifanswaswrong:
    mov eax,4
    mov ebx,1
    mov ecx,disclaim
    mov edx,disclaiml
    int 0x80

    jmp goodbye    

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

    jmp ifanswaswrong

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
    mov edx,5
    int 0x80            ; <answer for first ques>

    xor ebx,ebx
    xor eax,eax
    xor ecx,ecx
    jmp converta1  

donea1:
    cmp ebx,1947
    je rightq1
    jne wrongq1
    jmp goodbye

converta1:
    mov al, [ansq1+ecx]
    cmp al,10
    je donea1
    sub al,'0'
    imul ebx,ebx,10
    add ebx,eax
    inc ecx
    jmp converta1
