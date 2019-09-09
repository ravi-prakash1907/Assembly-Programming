;32-bit BCD addition and subtraction

.model small

.stack 1000h

.data

  num1	dq 	99999999h  ; first number
  num2 	dq 	23456789h  ; second number

  addition 	dd 	0
  subtraction dq 0

  sum db 0ah,'99999999h + 23456789h = $'
  diff db 0ah,'99999999h + 23456789h = $'
  s db 10 dup('$')
  d db 9 dup('$')

.code
calcSum proc stdcall
  mov ax, word ptr num1
  mov bx, word ptr num2
  add ax, bx
  mov word ptr addition, ax

  mov ax, word ptr num1+2
  adc ax, 0
  mov bx, word ptr num2+2
  add ax, bx
  mov word ptr addition+2, ax

  mov ax, 0
  adc ax, 0
  mov word ptr addition+4, ax
  ret
calcSum endp


clacDiff proc stdcall
  mov dl, 0
  mov ax, word ptr num1
  mov bx, word ptr num2
  sub ax, bx
  mov word ptr subtraction, ax

  mov ax, word ptr num1+2
  mov bx, word ptr num2+2
  sbb ax, bx
  mov word ptr subtraction+2, ax
  jnc borrow

  inc dl

  borrow:
    mov byte ptr subtraction+4, dl
  ret
calcDiff endp

start:
	mov ax, @data
	mov ds, ax
	mov es, ax

  call calcSum
  call calcDiff

last:
  int 21h
  .exit 0
end start
