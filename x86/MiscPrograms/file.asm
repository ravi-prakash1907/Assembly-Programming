; file handling

section .data
  file db 'myfile.txt'
  len equ $-file

  msg db 'Hello World!!'      ; msg is of length 13
  len1 equ $-msg

  alert db 'File created and written, successfuly!!',0xa
  len2 equ $-alert


section .bss
  fin resb 1
  fout resb 1
  info resb 13

section .text
  global _start

_start:
  ; CREATING & WRITING a file
  ; ==========================
  mov eax, 8    ; SYS_CREAT()  8
  mov ebx, file
  mov ecx, 0777
  int 80h

  mov [fout], ax

  mov edx, len1
  mov ecx, msg
  mov ebx, [fout]
  mov eax, 4    ; writes the file
  int 80h

  mov eax, 6    ; closing file (6  SYS_CLOSE())
  mov ebx, [fout]
  int 80h

  mov eax, 4
  mov ebx, 1
  mov ecx, alert
  mov edx, len2
  int 80h

  ; READING from the text file
  ;===========================

  mov eax, 5      ; sys_open()   5
  mov ebx, file
  mov ecx, 0      ; opening file in READ_ONLY i.e. 0 mode
  mov edx, 0777
  int 80h

  mov [fin], eax

  mov eax, 3
  mov ebx, [fin]
  mov ecx, info
  mov edx, 13
  int 80h

  mov eax, 6
  mov ebx, [fin]

  mov eax, 4
  mov ebx, 1
  mov ecx, info
  mov edx, 13
  int 80h

  mov eax, 1
  int 80h
