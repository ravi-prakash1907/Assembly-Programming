; Recursion: Factorial of 3

section .data
  msg db '3! = '
  len equ $fact -msg

section .bss
  fact resb 1

section .text
  global _start

_start:
  mov bx, 3
  CALL fun_fact

  add ax, '0'
  mov [fact], ax

  mov eax, 4
  mov ebx, 1
  mov ecx, msg
  mov edx, len
  int 80h

  mov eax, 4
  mov ebx, 1
  mov ecx, fact
  mov edx, 1

  mov eax, 1
  int 80h

  fun_fact:
    cmp bl, 1
    jg thatFun
    mov ax, 1
    ret

  thatFun:
    dec bl
    CALL fun_fact
    inc bl
    mul bl      ; ax = al*bl
    ret
