; Use of Arrays

; This programm adds 4 numbers (1 + 3 + 4 + 1)

segment .data
  arr:
        db 1
        db 3
        db 4
        db 1
  sum db 0

  msg db '1 + 3 + 4 + 1  = '
  len equ $-msg

segment .text
  global _start

_start:
  mov eax, 4
  mov ebx, 1
  mov ecx, msg
  mov edx, len
  int 80h

  mov eax, 4  ; total num to be added
  mov ebx, 0
  mov ecx, arr ;  points the array

  top:
  add ebx, [ecx]
  add ecx, 1
  dec eax
  jnz top

  add ebx, '0'
  mov [sum], ebx

  mov eax, 4
  mov ebx, 1
  mov ecx, sum
  mov edx, 1
  int 80h

  mov eax, 1
  int 80h

  ; ======================================

; Declearation:
  ; Using commas =>   NUM	dw 1, 2, 3
  ;
  ; Inintal vals:     NUM:
  ;                         DW   1
  ;                         DW   2
  ;                         DW   3
  ;
  ; Using 'TIMES' directive =>   NUM TIMES 3 dw 0     (for initializing wih same/duplicate values (here '0'))
