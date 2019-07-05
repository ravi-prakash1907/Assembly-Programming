; LOOP to print first 9 natural num

;==============================================
;L1:
;<LOOP-BODY>
;DEC	CL
;JNZ	L1
;
;simpally... (syntax)
;
;    LOOP    <label>
;==============================================



segment .data
  msg db 'First 9 natural numbers: ',0xa
  len equ $-msg

  newLine db '',0xa
  len2 equ $-newLine


section	.bss
  num resb 1


segment .text
  global _start

_start:
  mov eax, 4
  mov ebx, 1
  mov ecx, msg
  mov edx, len
  int 80h

  mov ecx, 10
  mov eax, '1'

  L1:
    mov [num], eax
    mov eax, 4
    mov ebx, 1
    push ecx

    mov ecx, num
    mov edx, 1
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, newLine
    mov edx, len2
    int 80h

    mov eax, [num]
    sub eax, '0'
    inc eax
    add eax, '0'
    pop ecx
    loop L1

  END:
    mov eax, 1
    int 80h
