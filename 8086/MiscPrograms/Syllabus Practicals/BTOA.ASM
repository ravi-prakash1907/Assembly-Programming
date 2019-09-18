; bin to ascii

    cout macro data
      mov ah, 09h
      mov dx, offset data
      int 21h
    endm

.model small
.stack 1000h
.data
    bin db '00111001$'  ; 9


    ascii db 2 dup('$')      ;  VALUE STORED '98' i.e. [3938]
     ;  VALUE STORED '89' i.e. [3839]   --> correct way

    endl db 0ah,'$'
.code

convert proc stdcall
    xor ax, ax
    xor bx, bx

  here:
    mov al, byte ptr bin+si
    and al, 01h
    shl bx, 1
    or bl, al
    ;mov byte ptr bin+si, bl
    ;and bl, 0fh
    inc si
    loop here
  ret
convert endp

 start:
  mov ax, @data ;setting up ds segment
  mov ds, ax    ;setting up es segment
  mov es, ax
  mov cx, 8

 ; mov di, 1   ; to resolve problem coming due to LITTLE Endian        (???)
  mov si, 0

  call convert

  mov byte ptr ascii, bl

  cout ascii

  .exit 0
end start
