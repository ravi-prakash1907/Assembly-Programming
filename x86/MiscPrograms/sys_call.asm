; implementing some important system calls

section .data
  prompt db 'Enter your name: '
  lenPrompt equ $-prompt

  sayHi db 'Hi '
  lenHi equ $-sayHi

section .bss
  name resw 3     ; reserves room for 3 words


section .text
  global _start

_start:
  mov edx, lenPrompt
  mov ecx, prompt
  mov ebx, 1
  mov eax, 4
  int 0x80

  mov eax, 3    ; read sys call number
  mov ebx, 2
  mov ecx, name
  mov edx, 20
  int 80h  

  mov edx, lenHi
  mov ecx, sayHi
  mov ebx, 1
  mov eax, 4
  int 0x80

  mov edx, 20
  mov ecx, name
  mov ebx, 1
  mov eax, 4
  int 80h

  mov eax, 1
  mov ebx, 0
  int 0x80
