; This program shows the implementations of few most frequently registers

section .text
  global _start

_start:

  ; Prints msg 'Hello World'
  mov edx, len
  mov ecx, msg
  mov ebx, 1    ; file descriptor (stdout)
  mov eax, 4    ; system call number (sys_write)
  int 0x80      ; kernal call (interrupt)

  ; Prints 2 '!' at the end of the msg
  mov edx, 2
  mov ecx, s2
  mov ebx, 1    ; file descriptor (stdout)
  mov eax, 4    ; system call number (sys_write)
  int 0x80      ; kernal call (interrupt)

  ; Prints a new line (kinda \n),  using 0xa
  mov edx, tempLen
  mov ecx, newLine
  mov ebx, 1    ; file descriptor (stdout)
  mov eax, 4    ; system call number (sys_write)
  int 0x80      ; kernal call (interrupt)

  mov eax, 1
  int 0x80

section .data
  msg db 'Hello World'
  len equ $ - msg         ; gets the length of the message

  s2 times 2 db '!'   ; adds 2 '!' at the end of the msg

  newLine db '', 0xa
  tempLen equ $ - newLine
