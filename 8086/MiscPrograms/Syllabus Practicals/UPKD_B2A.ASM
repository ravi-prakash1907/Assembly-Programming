;	Unpacked BCD to ASCII

.model small

.stack 1000h

.data
    num db 9, 8

      ; VALUE STORED '89' i.e. 3839
      ; LITTLE Endian i.e. for:
      ;     num = {9, 8},     AX = AL:[09], AH:[08]
      ;     AX = AH:AL
      ;     So,   AX = [0908] or in     ASCII   ----->    [3938]

    res1 db ?      ;  VALUE STORED '89' i.e. [3839]
    res2 db ?      ;  VALUE STORED '89' i.e. [3938]   --> correct way

.code
convert proc stdcall

  here:
    mov ax, 0
    mov ax,word ptr[num+si]
    add ax, 30h
    and ax, 00ffh

    ;   LITTLE Endian effects
    mov byte ptr[res1+si], al    ; stores {09, 08} as [3839]
    mov byte ptr[res2+di], al    ; stores {09, 08} as [3938]   :   LITTLE Endian

    inc si
    dec di

    loop here

  mov ax, word ptr[res1]
  mov ax, word ptr[res2]
  ret
convert endp

 start:
  mov ax, @data ;setting up ds segment
  mov ds, ax    ;setting up es segment
  mov es, ax
  mov cx, 2

  mov di, 1   ; to resolve problem coming due to LITTLE Endian        (???)
  mov si, 0

  call convert
  int 21h
  .exit 0

end start
