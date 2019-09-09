;	Unpacked BCD to ASCII

    cout macro data
      mov ah, 09h
      mov dx, offset data
      int 21h
    endm

.model small

.stack 1000h

.data
    num db 9, 8

      ; VALUE STORED '89' i.e. 3839
      ; LITTLE Endian i.e. for:
      ;     num = {9, 8},     AX = AL:[09], AH:[08]
      ;     AX = AH:AL
      ;     So,   AX = [0809] or in     ASCII   ----->    [3839]

    res1 db 3 dup('$')      ;  VALUE STORED '98' i.e. [3938]
    res2 db 3 dup('$')      ;  VALUE STORED '89' i.e. [3839]   --> correct way

    endl db 0ah,'$'

.code
convert proc stdcall

  here:
    mov ax, 0
    mov ax,word ptr[num+si]
    add ax, 30h
    and ax, 00ffh

    ;   LITTLE Endian effects
    mov byte ptr[res1+si], al    ; stores {09, 08} as [3938]
    mov byte ptr[res2+di], al    ; stores {09, 08} as [3839]   :   LITTLE Endian

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

  cout res1
  cout endl
  cout res2

  .exit 0
end start
