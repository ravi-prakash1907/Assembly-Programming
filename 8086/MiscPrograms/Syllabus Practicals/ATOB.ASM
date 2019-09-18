; ascii to bin

;   MACRO
    cin macro
      mov ah, 01h
      int 21h
    endm

    cout macro data
      mov ah, 09h
      mov dx, offset data
      int 21h
    endm

.model small

.stack 1000h

.data
    disp db 0ah,'Press a key (for ASCII to Binary conversion): $'
    prompt db 'Binary value: $'
    num db 3 dup('$')
    bin db 9 dup('$')
    endl db 0ah,'$'

.code
  convert proc stdcall
    xor ax, ax
    mov al, byte ptr num

    here2:
      mov ah, 0
      shl ax, 1
      or ah, 30h
      mov byte ptr bin+si, ah
      inc si
      loop here2
    ret
  convert endp

 start:
  mov ax, @data ;setting up ds segment
  mov ds, ax    ;setting up es segment
  mov es, ax

  cout disp
  cin
  cout endl
  mov byte ptr num, al

  mov cx, 8
  mov si, 0

  call convert

  cout prompt
  cout bin

  .exit 0
end start
