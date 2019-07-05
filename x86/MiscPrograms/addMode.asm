; Usage of different types of addressig modes

; Addressing is how the data is recieved
;   Register addressing
;   Immediate addressing
;   Memory addressing


section .data
  name db 'Zara Ali', 0xa, 0xa
  len equ $-name

  str1 db 0xa,'Real name: '
  l1 equ $-str1
  str2 db 'Changing to: '
  l2 equ $-str2

section .text
  global _start

_start:

  mov edx, l1
  mov ecx, str1
  mov ebx, 1
  mov eax, 4
  int 80h

  mov edx, len
  mov ecx, name
  mov ebx, 1
  mov eax, 4
  int 80h

  mov [name], dword 'Nuha'  ; dword has a size 2-byte

  mov edx, l2
  mov ecx, str2
  mov ebx, 1
  mov eax, 4
  int 80h

  mov edx, len    ; here modified words is as long as the earlie one was, so 'len' is used again
  mov ecx, name
  mov ebx, 1
  mov eax, 4
  int 80h

  mov eax, 1
  int 0x80

;   USE OF SOME OTHER ADDRESSING MODES  (from tutorialspoint):-

; ADD	BYTE_VALUE, DL	; Adds the register in the memory location
; MOV	BX, WORD_VALUE	; Operand from the memory is added to register

; BYTE_TABLE DB  14, 15, 22, 45      ; Tables of bytes
; WORD_TABLE DW  134, 345, 564, 123  ; Tables of words
  ; MOV CL, BYTE_TABLE[2]	; Gets the 3rd element of the BYTE_TABLE
  ; MOV CL, BYTE_TABLE + 2	; Gets the 3rd element of the BYTE_TABLE
  ; MOV CX, WORD_TABLE[3]	; Gets the 4th element of the WORD_TABLE
  ; MOV CX, WORD_TABLE + 3	; Gets the 4th element of the WORD_TABLE

; MY_TABLE TIMES 10 DW 0  ; Allocates 10 words (2 bytes) each initialized to 0
; MOV EBX, [MY_TABLE]     ; Effective Address of MY_TABLE in EBX
; MOV [EBX], 110          ; MY_TABLE[0] = 110
; ADD EBX, 2              ; EBX = EBX +2
; MOV [EBX], 123          ; MY_TABLE[1] = 123
