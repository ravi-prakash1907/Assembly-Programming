;32-bit BCD addition and subtraction

.model small

.stack 1000h

.data

  num1	dd 	99999999h  ; first number
  num2 	dd 	23456789h  ; second number

  addition dq 0
  subtraction dd 0

  sum db 0ah,'99999999h + 23456789h = $'    
  diff db 0ah,'99999999h - 23456789h = $'   
  s db 10 dup('$')
  d db 9 dup('$')

.code

calcSum proc stdcall
  xor ax, ax
  mov si, 0
  mov cx, 4
  hereAdd:
    mov al, byte ptr [num1+si]
    add al, byte ptr [num2+si]
    daa
    mov byte ptr[addition+si], al

    inc si
    loop hereAdd

    xor al, al
    adc al, 0
    daa
    mov byte ptr[addition+4], al
  ret
calcSum endp


calcDiff proc stdcall
  xor ax, ax
  mov si, 0
  mov cx, 4
  hereSub:
    mov al, byte ptr [num1+si]
    sub al, byte ptr [num2+si]
    das
    mov byte ptr[subtraction+si], al

    inc si
    loop hereSub

    xor al, al
    sbb al, 0
    das
    mov byte ptr[subtraction+4], al
  ret
calcDiff endp

start:
	mov ax, @data
	mov ds, ax
	mov es, ax

  call calcSum
  
  call calcDiff

last:
  .exit 0
end start
