.model small

.data
num1 	dq 	11223344h; first number
num2	dq 	22334455h; second number
res	 	dd 	0

.stack 1000h ; declaring stack

.code

main proc stdcall
	mov ax, word ptr num1
	mul word ptr num2
	mov word ptr res, ax
	mov cx, dx
	mov ax, word ptr num1+2
	mul word ptr num2
	add cx, ax

	mov bx, dx
	adc bx, 0
	mov ax, word ptr num1
	mul word ptr num2+2
	add cx, ax
	mov word ptr res+2, cx
	mov cx, dx
	adc bx, 0
	mov ax, word ptr num1+2
	mul word ptr num2+2
	add cx, ax
	adc dx, 0
	add cx, bx
	mov word ptr res+4, cx
	adc dx, 0
	mov word ptr res+6, dx
	int 3
	.exit 0
main endp

start:
	mov ax, @data
	mov ds, ax
	mov es, ax
	call main
end start
