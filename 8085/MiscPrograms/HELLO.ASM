.model small

.stack 100h

.data
hello db 'hello, world',0ah,'$'

.code
start:
mov ax, @data
mov ds, ax    ;setting up ds segment
mov es, ax    ;setting up es segment
mov ah, 09h
mov dx, offset hello
int 21h
.exit
end start
