.model small

.stack 100h   ; declearing stack size

.data
hello db 'hello, world',0ah,'$'

.code
start:
  mov ax, @data

  mov ds, ax    ;setting up ds segment
  mov es, ax    ;setting up es segment

  mov ah, 09h   ; 09h is value for o/p
  mov dx, offset hello

  int 21h   ; 21h is code for termination 
  .exit
end start
