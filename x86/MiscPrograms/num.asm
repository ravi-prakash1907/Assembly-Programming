; This function adds two 5-Digit numbers

; Use of Numbers
; ACSII & BCD
    ; ASCII:  AAA, AAS, AAM, AAD
    ; BCD:    AAM, AAD, DAA, DAS
    ; *AAD:   ASCII Adjust Before Devision  (After)


segment .data
  num1 db '12345'
  num2 db '23456'
  sum  db '     '

  msg db 'Sum (12345 + 23456): '
  len equ $-msg
  msg2 db ' ',0xa, 0xd
  len2 equ $-msg2


segment .text
  global _start

_start:
  mov esi, 4  ; beg index of digit eg. '5' of '12345'
  mov ecx, 5  ; size of numbers i.e. 5
  clc

  xor ah, ah

  addition:
  mov al, [num1 + esi]
  adc al, [num2 + esi]
  aaa
  pushf
  or al, '0'
  popf

  mov [sum + esi], al
  dec esi
  loop addition

  mov eax, 4
  mov ebx, 1
  mov ecx, msg
  mov edx, len
  int 80h

  mov eax, 4
  mov ebx, 1
  mov ecx, sum
  mov edx, 5
  int 80h

  mov eax, 4
  mov ebx, 1
  mov ecx, msg2
  mov edx, len2
  int 80h

  mov eax, 1
  int 80h
