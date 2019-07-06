; Macros: seq of insreuctoins assigned a name

; Syntax:
  ; %macro macro_name  number_of_params
  ; <macro body>
  ; %endmacro       ; called as =>   <macro_name> <params>

; ==================================
%macro disp 2     ; a macro to display output that takes 2 i/p (msg & len)
  mov eax, 4
  mov ebx, 1
  mov ecx, %1
  mov edx, %2
  int 0x80
%endmacro

;  Procedure

exit:
  mov eax, 1
  int 80h
  ret
; ==================================

section .data
  msg1 db 'Hello World!!',0xa
  len1 equ $-msg1
  msg2 db 'This is a macro!',0xa
  len2 equ $-msg2


section .text
  global _start

_start:
  disp msg1, len1   ; invoking macro
  disp msg2, len2   ; invoking macro

  CALL exit
