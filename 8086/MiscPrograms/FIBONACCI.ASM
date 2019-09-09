;Fibonacci Series

.model small

.stack 1000h

.data
  msg1 db 'Enter number of terms of Fibonacci Series to print(max 7): $'
  msg2 db 0ah,'Your terms:   $'
  comma db ', $'

  crammed db 30h, 31h
  num db 2 dup('$')
  terms db ?
  num1 db 2 dup('$')
  num2 db 2 dup('$')
  temp db ?

.code

printComma proc stdcall
  mov ah, 09h
  mov dx, offset comma
  int 21h
  ret
printComma endp

disp2 proc stdcall
  mov si, 0
  disp:
    mov ah, 09h
    mov bl, byte ptr[crammed+si]
    mov byte ptr[num], bl
    mov dx, offset num
    int 21h
    cmp cl, 02h
    jae c
    d:
      inc si
      loop disp
      ret
    c:
      call printComma
      jmp d
disp2 endp

start:
  mov ax, @data
  mov ds, ax
  mov es, ax

  ;take number of terms
  mov ah, 09h
  mov dx, offset msg1
  int 21h

    ;input terms
      mov ah, 01h
      int 21h
      ;decimal conversion
      and al, 0fh
      mov byte ptr[terms], al
      int 21h

  ;show terms
    mov ah, 09h
    mov dx, offset msg2
    int 21h

    mov al, byte ptr[terms]
    cmp al, 02h
    jle showLess

    mov cl, 02h
    call disp2

    mov al, byte ptr[terms]
    sub al, 02h
    mov si, 0
    mov cl, al
    mov dx, 0
    mov bx, 0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;Series with more then 2 terms
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    mov byte ptr[num1], 30h
    mov byte ptr[num2], 31h

    here:
      mov bl, byte ptr[num2]
      mov byte ptr[temp], bl

      and bl, 0fh
      mov dl, byte ptr[num1]
      and dl, 0fh
      add bl, dl
      or bl, 30h
      mov byte ptr[num2], bl

      call printComma
      mov ah, 09h
      mov dx, offset num2
      int 21h

      mov dl, byte ptr[temp]
      mov byte ptr[num1], dl
      inc si
      loop here
      jmp last

    showLess:
      mov cl, al
      call disp2
      jmp last
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

last:
  .exit 0
end start
