; 32-BIT Devision

  print macro data
    mov ah, 09h
    mov dx, offset data
    int 21h
  endm

.model small
.stack

.data

  ;   11876000 ÷ 1122 = 105EA Remainder : CEC
  disp db 0ah,'11876000 / 1122 = Quotient -> BX:CX,  Remainder -> DX',0ah,'$'

  dividend dd 11876000h
  divisor dw 1122h
  remainder dw 0000h
  quotient dd 00000000h

.code

  devision proc stdcall
    mov ax,word ptr dividend+2
    div word ptr divisor

    mov word ptr quotient+2, ax

    mov ax,word ptr dividend
    div word ptr divisor

    mov word ptr quotient, ax
    mov word ptr remainder, dx
    ret
  devision endp


  ;bringing vaules of Quotient and Remainder in BX:CX & DX registers, respactively

  sol proc stdcall
    xor bx, bx
    xor cx, cx
    xor dx, dx

    mov bx, word ptr quotient+2     ; 0001
    mov cx, word ptr quotient       ; 05EA
    mov dx, word ptr remainder      ; 0CEC
    ret
  sol endp

start:

  mov ax, @data
  mov ds, ax
  mov es, ax

  call devision
  print disp
  call sol

  .exit 0
end start
