; Conditional statements

SYS_WRITE   equ 4
SYS_READ    equ 3
STDOUT      equ 1
STDIN       equ 0
SYS_EXIT    equ 1

segment .data
  msg1 db 'Enter 3 numbers : ',0xa, 0xd
  len1 equ $-msg1

  msg2 db 'Largest number : '
  len2 equ $- msg2

segment .bss
  num1 resb 4
  num2 resb 4
  num3 resb 4
  largest resb 4

segment .text
  global _start

_start:
  mov eax, SYS_WRITE
  mov ebx, STDOUT
  mov ecx, msg1
  mov edx, len1
  int 80h

  mov eax, SYS_READ
  mov ebx, STDIN
  mov ecx, num1
  mov edx, 4
  int 80h

  mov eax, SYS_READ
  mov ebx, STDIN
  mov ecx, num2
  mov edx, 4
  int 80h

  mov eax, SYS_READ
  mov ebx, STDIN
  mov ecx, num3
  mov edx, 4
  int 80h

    mov ecx, [num1]
    cmp ecx, [num2]         ; comparing num1 and num2
    jg checkThirdNum
    mov ecx, [num2]

     checkThirdNum:
        cmp ecx, [num3]
        jg RES
        mov ecx, [num3]

     RES:

  mov [largest], ecx

  mov eax, SYS_WRITE
  mov ebx, STDOUT
  mov ecx, msg2
  mov edx, len2
  int 80h

  mov eax, SYS_WRITE
  mov ebx, STDOUT
  mov ecx, largest
  mov edx, 4
  int 80h

  mov   eax, SYS_EXIT
  int   80h
