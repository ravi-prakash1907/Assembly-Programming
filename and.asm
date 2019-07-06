; Logical statements
; AND, OR, XOR, TEST, NOT

; this programm tells whether entered num is even or odd

segment .data
  msg db 'Enter a num. : '
  len1 equ $-msg
  evenMsg db 'Even!! ',0xa
  len2 equ $-evenMsg
  oddMsg db 'Odd!! ',0xa
  len3 equ $-oddMsg

segment .bss
  num resb 2

segment .text
  global _start

_start:
  mov eax, 4
  mov ebx, 1
  mov ecx, msg
  mov edx, len1
  int 80h

  mov eax, 3
  mov ebx, 0
  mov ecx, num
  mov edx, 2
  int 80h

  mov eax, [num]
  sub eax, '0'
  and eax, 1          ; using TEST for AND will do same task without changing value of 'al'
  jz even

  odd:
  mov eax, 4
  mov ebx, 1
  mov ecx, oddMsg
  mov edx, len3
  int 80h
  jmp end

  even:
  mov eax, 4
  mov ebx, 1
  mov ecx, evenMsg
  mov edx, len2
  int 80h

  end:
  mov eax, 1
  int 80h


; some other operations
; OR                    ;     similarly      XOR    is implemented (replace OR by XOR)
  ; mov al, 5  ; al is 8-bit (1-byte) resister
  ; OR  al, 3
  ; add al, byte '0'  ; converting decimal to ascii
  ; mov [result], al  ; .....write code to display result as o/p     (5 OR 3 = 7   i.e.    101 OR 010 = 111)
;
; NOT
  ; mov al, 5  ; i.e.  al = 101
  ; NOT  al    ; i.e.  al = 010   (2)
  ; add al, byte '0'  ; converting decimal to ascii
  ; mov [result], al  ; .....write code to display result as o/p 2
