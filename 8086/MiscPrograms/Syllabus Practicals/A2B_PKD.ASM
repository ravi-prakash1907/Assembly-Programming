;	ASCII to Packed BCD

.model small

.stack 1000h

.data
    num db '1234'
    res db 5 dup('$')

.code

  main proc stdcall
    mov bx, 0

    here:
      mov ax, 0
      shl bx, 4
      mov al, byte ptr[num+si]      ; works from lhs, so 7 goes first
      and al, 0fh
      or bx, ax
      inc si
      loop here

    mov word ptr[res], bx
    ret
  main endp

start:

  mov ax, @data ;setting up ds segment
  mov ds, ax    ;setting up es segment
  mov es, ax
  mov cx, 4
  mov si, 0
  call main

  mov ah, 09h
  mov dx, offset res
  int 21h
  .exit 0

end start
