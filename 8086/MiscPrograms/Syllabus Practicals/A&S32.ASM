;32-bit BCD addition and subtraction

.model small

.stack 1000h

.data

  num1	dq 	99999999h  ; first number
  num2 	dq 	23456789h  ; second number

  addition 	dd 	0
  subtraction dq 0

  sum db 0ah,'99999999h + 23456789h = $'    ; = BCDF0122
  diff db 0ah,'99999999h - 23456789h = $'   ; = 76543210
  s db 10 dup('$')
  d db 9 dup('$')

.code

calcSum proc stdcall
  mov ax, word ptr num1
  mov bx, word ptr num2
  add ax, bx                ;   AX = [0122],  C = 1
  mov word ptr addition, ax

  mov ax, word ptr num1+2
  adc ax, 0                 ;   AX = [999A],  C = 0
  mov bx, word ptr num2+2
  add ax, bx                ;   AX = [BCDF],  C = 0
  mov word ptr addition+2, ax
  mov ax, 0
  adc ax, 0
  mov word ptr addition+4, ax
  ret
calcSum endp


calcDiff proc stdcall
  mov dl, 0
  mov ax, word ptr num1
  mov bx, word ptr num2
  sub ax, bx                     ;   AX = [3210],  O = 1
  mov word ptr subtraction, ax

  mov ax, word ptr num1+2
  mov bx, word ptr num2+2
  sbb ax, bx                     ;   AX = [7654],  O = 1
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
  int 21h
  call calcDiff

last:
  int 21h
  .exit 0
end start
