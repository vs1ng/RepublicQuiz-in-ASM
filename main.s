section .bss
    name resb 12
    ansq1 resb 5
    ansq2 resb 5
    ansq3 resb 3
    ansq4 resb 5
    ansq5 resb 5
    ansq6 resb 5
    ansq7 resb 5
    ansq8 resb 5
    ansq9 resb 5
    ansq10 resb 5
    ansq11 resb 5
    ansq12 resb 5
    ansq13 resb 5    

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
    q4 db "[?] Who was the first Prime Minister of India? (1=Nehru, 2=Gandhi) ",0
    q4l equ $-q4
    q5 db "[?] In which year was the Constitution adopted? ",0
    q5l equ $-q5
    q6 db "[?] How many states are in India? ",0
    q6l equ $-q6
    q7 db "[?] What is the capital of India? (1=Delhi, 2=Mumbai) ",0
    q7l equ $-q7
    q8 db "[?] Who wrote the national anthem? (1=Tagore, 2=Iqbal) ",0
    q8l equ $-q8
    q9 db "[?] What year did Goa join India? ",0
    q9l equ $-q9
    q10 db "[?] How many union territories are there? ",0
    q10l equ $-q10
    q11 db "[?] What is India's national bird? (1=Peacock, 2=Eagle) ",0
    q11l equ $-q11
    q12 db "[?] Which river is considered most sacred? (1=Ganga, 2=Yamuna) ",0
    q12l equ $-q12
    q13 db "[?] What year was the first general election? ",0
    q13l equ $-q13
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
    je q4
    jne wrongq1
    jmp goodbye

q4:
    mov eax,4
    mov ebx,1
    mov ecx,q4
    mov edx,q4l
    int 0x80
    mov eax,3
    xor ebx,0
    mov ecx,ansq4
    mov edx,5
    int 0x80
    xor eax,eax
    xor ebx,ebx
    xor ecx,ecx
    jmp converta4

converta4:
    mov al, [ansq4+ecx]
    cmp al,10
    je donea4
    sub al,'0'
    imul ebx,ebx,10
    add ebx,eax
    inc ecx
    jmp converta4

donea4:
    cmp ebx,1
    je q5
    jne wrongq1
    jmp goodbye

q5:
    mov eax,4
    mov ebx,1
    mov ecx,q5
    mov edx,q5l
    int 0x80
    mov eax,3
    xor ebx,0
    mov ecx,ansq5
    mov edx,5
    int 0x80
    xor eax,eax
    xor ebx,ebx
    xor ecx,ecx
    jmp converta5

converta5:
    mov al, [ansq5+ecx]
    cmp al,10
    je donea5
    sub al,'0'
    imul ebx,ebx,10
    add ebx,eax
    inc ecx
    jmp converta5

donea5:
    cmp ebx,1950
    je q6
    jne wrongq1
    jmp goodbye

q6:
    mov eax,4
    mov ebx,1
    mov ecx,q6
    mov edx,q6l
    int 0x80
    mov eax,3
    xor ebx,0
    mov ecx,ansq6
    mov edx,5
    int 0x80
    xor eax,eax
    xor ebx,ebx
    xor ecx,ecx
    jmp converta6

converta6:
    mov al, [ansq6+ecx]
    cmp al,10
    je donea6
    sub al,'0'
    imul ebx,ebx,10
    add ebx,eax
    inc ecx
    jmp converta6

donea6:
    cmp ebx,28
    je q7
    jne wrongq1
    jmp goodbye

q7:
    mov eax,4
    mov ebx,1
    mov ecx,q7
    mov edx,q7l
    int 0x80
    mov eax,3
    xor ebx,0
    mov ecx,ansq7
    mov edx,5
    int 0x80
    xor eax,eax
    xor ebx,ebx
    xor ecx,ecx
    jmp converta7

converta7:
    mov al, [ansq7+ecx]
    cmp al,10
    je donea7
    sub al,'0'
    imul ebx,ebx,10
    add ebx,eax
    inc ecx
    jmp converta7

donea7:
    cmp ebx,1
    je q8
    jne wrongq1
    jmp goodbye

q8:
    mov eax,4
    mov ebx,1
    mov ecx,q8
    mov edx,q8l
    int 0x80
    mov eax,3
    xor ebx,0
    mov ecx,ansq8
    mov edx,5
    int 0x80
    xor eax,eax
    xor ebx,ebx
    xor ecx,ecx
    jmp converta8

converta8:
    mov al, [ansq8+ecx]
    cmp al,10
    je donea8
    sub al,'0'
    imul ebx,ebx,10
    add ebx,eax
    inc ecx
    jmp converta8

donea8:
    cmp ebx,1
    je q9
    jne wrongq1
    jmp goodbye

q9:
    mov eax,4
    mov ebx,1
    mov ecx,q9
    mov edx,q9l
    int 0x80
    mov eax,3
    xor ebx,0
    mov ecx,ansq9
    mov edx,5
    int 0x80
    xor eax,eax
    xor ebx,ebx
    xor ecx,ecx
    jmp converta9

converta9:
    mov al, [ansq9+ecx]
    cmp al,10
    je donea9
    sub al,'0'
    imul ebx,ebx,10
    add ebx,eax
    inc ecx
    jmp converta9

donea9:
    cmp ebx,1961
    je q10
    jne wrongq1
    jmp goodbye

q10:
    mov eax,4
    mov ebx,1
    mov ecx,q10
    mov edx,q10l
    int 0x80
    mov eax,3
    xor ebx,0
    mov ecx,ansq10
    mov edx,5
    int 0x80
    xor eax,eax
    xor ebx,ebx
    xor ecx,ecx
    jmp converta10

converta10:
    mov al, [ansq10+ecx]
    cmp al,10
    je donea10
    sub al,'0'
    imul ebx,ebx,10
    add ebx,eax
    inc ecx
    jmp converta10

donea10:
    cmp ebx,8
    je q11
    jne wrongq1
    jmp goodbye

q11:
    mov eax,4
    mov ebx,1
    mov ecx,q11
    mov edx,q11l
    int 0x80
    mov eax,3
    xor ebx,0
    mov ecx,ansq11
    mov edx,5
    int 0x80
    xor eax,eax
    xor ebx,ebx
    xor ecx,ecx
    jmp converta11

converta11:
    mov al, [ansq11+ecx]
    cmp al,10
    je donea11
    sub al,'0'
    imul ebx,ebx,10
    add ebx,eax
    inc ecx
    jmp converta11

donea11:
    cmp ebx,1
    je q12
    jne wrongq1
    jmp goodbye

q12:
    mov eax,4
    mov ebx,1
    mov ecx,q12
    mov edx,q12l
    int 0x80
    mov eax,3
    xor ebx,0
    mov ecx,ansq12
    mov edx,5
    int 0x80
    xor eax,eax
    xor ebx,ebx
    xor ecx,ecx
    jmp converta12

converta12:
    mov al, [ansq12+ecx]
    cmp al,10
    je donea12
    sub al,'0'
    imul ebx,ebx,10
    add ebx,eax
    inc ecx
    jmp converta12

donea12:
    cmp ebx,1
    je q13
    jne wrongq1
    jmp goodbye

q13:
    mov eax,4
    mov ebx,1
    mov ecx,q13
    mov edx,q13l
    int 0x80
    mov eax,3
    xor ebx,0
    mov ecx,ansq13
    mov edx,5
    int 0x80
    xor eax,eax
    xor ebx,ebx
    xor ecx,ecx
    jmp converta13

converta13:
    mov al, [ansq13+ecx]
    cmp al,10
    je donea13
    sub al,'0'
    imul ebx,ebx,10
    add ebx,eax
    inc ecx
    jmp converta13

donea13:
    cmp ebx,1951
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
