section .data
    hello db 'Hello, World!', 0xA  ; 字符串，以换行符结尾
    hello_len equ $ - hello        ; 计算字符串长度

section .text
    global _start

_start:
    ; 写入字符串到标准输出
    mov rax, 1                     ; 系统调用号 (sys_write)
    mov rdi, 1                     ; 文件描述符 (stdout)
    mov rsi, hello                 ; 字符串地址
    mov rdx, hello_len             ; 字符串长度
    syscall

    ; 退出程序
    mov rax, 60                    ; 系统调用号 (sys_exit)
    xor rdi, rdi                   ; 返回码 0
    syscall
