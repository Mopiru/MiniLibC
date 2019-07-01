section .text

    global strlen
    global rindex
    global strchr
    global memset
    global memcpy
    global memmove
    global strcmp
    global strncmp


strlen:

    push rbp
    mov rbp, rsp
    mov rax, 0

    start_strlen:

    cmp byte[rdi], 0
    je end_strlen
    add rax, 1
    add rdi, 1
    jmp start_strlen

    end_strlen:

    leave
    ret

strchr:

    push rbp
    mov rbp, rsp

    start_strchr:
    cmp byte[rdi], sil
    je end_find_strchr
    cmp byte[rdi], 0
    je end_strchr
    add rdi, 1
    jmp start_strchr

    end_find_strchr:
    mov rax, rdi
    jmp end_strchr

    end_strchr:
    leave
    ret

rindex:

    push rbp
    mov rbp, rsp

    start_rindex:
    cmp byte[rdi], sil
    je find_rindex
    
    cmp byte[rdi], 0
    je end_rindex

    add rdi, 1
    jmp start_rindex

    find_rindex:
    mov rax, rdi
    add rdi, 1
    jmp start_rindex

    end_rindex:
    leave
    ret

memset:

    push rbp
    mov rbp, rsp

    mov r8, rdi
    mov rax, 0

    start_memset:

    cmp rax, rdx
    je end_memset
    mov byte[rdi], sil
    add rdi, 1
    add rax, 1
    jmp start_memset

    end_memset:
    mov rax, r8
    leave
    ret

memcpy:

    push rbp
    mov rbp, rsp

    mov r8, rdi
    mov rax, 0

    start_memcpy:

    cmp rax, rdx
    je end_memcpy
    mov r9b, byte[rsi]
    mov byte[rdi], r9b
    add rdi, 1
    add rsi, 1
    add rax, 1
    jmp start_memcpy

    end_memcpy:
    mov rax, r8
    leave
    ret

strcmp:

    push rbp
    mov rbp, rsp

    mov rax, 0

    start_strcmp:

    mov r8b, byte[rdi]
    mov r9b, byte[rsi]

    cmp r8b, 0
    je equal_strcmp
    cmp r9b, 0
    je equal_strcmp

    cmp r8b, r9b
    jl less_strcmp

    cmp r8b, r9b
    jg great_strcmp

    add rdi, 1
    add rsi, 1
    jmp start_strcmp

    equal_strcmp:
    mov rax, 0
    jmp end_strcmp

    less_strcmp:
    mov rax, -1
    jmp end_strcmp

    great_strcmp:
    mov rax, 1
    jmp end_strcmp

    end_strcmp:
    leave
    ret

strncmp:

     push rbp
     mov rbp, rsp

     mov rax, 0

     start_strncmp:

     mov r8b, byte[rdi]
     mov r9b, byte[rsi]

     cmp r8b, 0
     je equal_strncmp
     cmp r9b, 0
     je equal_strncmp
     cmp rax, rdx
     je equal_strncmp

     cmp r8b, r9b
     jl less_strncmp

     cmp r8b, r9b
     jg great_strncmp

     add rdi, 1
     add rsi, 1
     add rax, 1
     jmp start_strncmp

     equal_strncmp:
     mov rax, 0
     jmp end_strncmp

     less_strncmp:
     mov rax, -1
     jmp end_strncmp

     great_strncmp:
     mov rax, 1
     jmp end_strncmp

     end_strncmp:
     leave
     ret

memmove:

     push rbp
     mov rbp, rsp

     mov r8, rdi
     mov rax, 0

     start_memmove:

     cmp rax, rdx
     je end_memmove
     mov r9b, byte[rsi]
     mov byte[rdi], r9b
     add rdi, 1
     add rsi, 1
     add rax, 1
     jmp start_memmove

     end_memmove:
     mov rax, r8
     leave
     ret
