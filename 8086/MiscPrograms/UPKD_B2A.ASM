;	Unpacked BCD to ASCII

.model small

.stack 1000h

.data
    num db 9, 8
    res db ?    ; VALUE STORED '89' i.e. 3839

.code
convert proc stdcall

  here:
    mov ax, 0
    mov ax,word ptr[num+si]
    add ax, 30h
    and ax, 00ffh
    mov byte ptr[res+si], al
    inc si
    loop here

  mov ax, word ptr[res]
  ret
convert endp

 start:
  mov ax, @data ;setting up ds segment
  mov ds, ax    ;setting up es segment
  mov es, ax
  mov cx, 2
  mov si, 0
  call convert
  int 21h
  .exit 0

end start
