; This program implements some oftenly used varables
; We'll perform some arithmatic operations here

section .data
  num db 9
  addition db 0xa,'9 + 3 = 12',0xa
  lenAdd equ $-addition

section .text
  global _start

_start:
  ; ADD
  mov edx, lenAdd
  mov ecx, addition
  mov ebx, 1
  mov eax, 4
  int 0x80

  mov eax, 1
  int 0x80



; EXAMPLES OF SOME VARIABLES

; choice		DB	'y'
; number		DW	12345
; neg_number	DW	-12345
; big_number	DQ	123456789
; real_number1	DD	1.234
; real_number2	DQ	123.456
