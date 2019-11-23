.model small

.stack 1000h

.data
    num1 dq 12345678h
    num2 dq 87654321h
    res dd 0

.code
start:
    mov ax, @data
    mov ds, ax
    mov es, ax
    
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

    add bx, dx
    mov word ptr res+2, cx

    mov ax, word ptr num1+2
    mul word ptr num2+2
    add bx, ax

    mov word ptr res+4, bx
    mov word ptr res+6, dx

    int 3
    .exit 0
end start
