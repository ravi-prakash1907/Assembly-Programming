.model small

.data
info db 'Hello World!!',0ah,'$'  ;0ah is hex code for eol

.stack 1000h

.code
  disp proc stdcall
    arg @@info:WORD

    mov ah, 09h
    mov dx, [@@info] ;can be 'word ptr [info]'
                     ;displays header
    int 21h
    ret
  disp endp

  main proc stdcall
    mov cx, 10h
      here:
        lea ax, info
        push ax
        call disp
        mov ax, 0
        loop here
      ret
  main endp

  start:
    mov ax, @data
    mov ds, ax
    mov es, ax
    call main
    .exit
  end start
