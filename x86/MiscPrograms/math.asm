; implementing arithmthic operations
; INC, DEC, ADD, SUB, MUL/IMUL (integerMUL), DIV/IDIV

SYS_EXIT  equ 1
SYS_READ  equ 3
SYS_WRITE equ 4
STDIN     equ 0
STDOUT    equ 1

segment .data
  count dw 0
  val db 1
  msg1 db 0xa,'Enter num1 : '
  len1 equ $-msg1
  msg2 db 'Enter num2 : '
  len2 equ $-msg2

  res1 db 0xa,'Multiplication result is : '
  resMLen equ $-res1

  res2 db 0xa,'Division result is : '
  resDLen equ $-res2

  newln db ' ',0xa,0xd
  l equ $-newln

segment .bss
  num1 resb 2
  num2 resb 2
  mulR resb 1
  devR resb 1

segment .text
  global _start

_start:
  mov edx, len1
  mov ecx, msg1
  mov ebx, STDOUT
  mov eax, SYS_WRITE
  int 80h
    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, num1
    mov edx, 2
    int 80h

  mov edx, len2
  mov ecx, msg2
  mov ebx, STDOUT
  mov eax, SYS_WRITE
  int 80h
    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, num2
    mov edx, 2
    int 80h

  mov eax, SYS_WRITE
  mov ebx, STDOUT
  mov ecx, res1
  mov edx, resMLen
  int 80h

      mov eax, [num1]
      sub eax, '0'    ; ASCII to decimal conversion
      mov ebx, [num2]
      sub ebx, '0'

      mul ebx ; eax X 32-bit source(ebx) = [EDX][EAX]

      ; add eax, ebx
      add eax, '0'  ; decimal to ASCII conversion

      mov [mulR], eax

  mov eax, SYS_WRITE
  mov ebx, STDOUT
  mov ecx, mulR
  mov edx, 1
  int 80h

  mov eax, SYS_WRITE
  mov ebx, STDOUT
  mov ecx, res2
  mov edx, resDLen
  int 80h

      mov al, [num1]
      sub al, '0'    ; ASCII to decimal conversion
      mov bl, [num2]
      sub bl, '0'

      div bl

      add al, '0'  ; decimal to ASCII conversion

      mov [devR], al

  mov eax, SYS_WRITE
  mov ebx, STDOUT
  mov ecx, devR
  mov edx, 1
  int 80h

  mov eax, SYS_READ
  mov ebx, STDIN
  mov ecx, newln
  mov edx, l
  int 80h

exit:
  mov eax, SYS_EXIT
  xor ebx, ebx
  int 0x80



;======================================
