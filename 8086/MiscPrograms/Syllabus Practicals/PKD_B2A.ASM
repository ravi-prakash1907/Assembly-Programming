;Packed BCD to ASCII

.model small

.stack 1000h

.data
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ; num dw 1234h      ; change '12' into [3132] & '34' into [3334]
                     ; but if no is '12' => it'll be stored in register as: [3231]  ~ [3433]  --->
                     ; and for 1234h, ASCII equvilent will be     ---->   '2143'

  ; num dw 3412h     ; will again lead to '3412'       (???)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ; therefor =>       ACTUALLY value i.e. stored in memory, be like:

  num db 34h, 12h

  res db 5 dup('$')   ;   3412h     ---->     results as '1234'

.code

  convert proc stdcall
    a:
      xor ax, ax

      mov al, byte ptr[num+si]
      and al, 0fh

      mov ah, byte ptr[num+si]
      ror ah, 4
      and ah, 0fh

      or ax, 3030h

      mov byte ptr[res+di], al
      dec di
      mov byte ptr[res+di], ah
      inc si
      dec di
      loop a
    ret
  convert endp

start:
  mov ax, @data
  mov ds, ax
  mov es, ax
  mov si, 0
  mov di, 3
  mov cx, 2

  call convert

  mov ah, 09h
  mov dx, offset res
  int 21h

.exit 0
end start
