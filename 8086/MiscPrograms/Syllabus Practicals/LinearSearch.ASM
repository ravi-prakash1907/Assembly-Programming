;LINEAR SEARCH

.model small

.stack 1000h

.data
  msg1 db 'Enter number of elements(max 9): $'
  msg2 db 0ah,'Enter the element: $'
  msg3 db 0ah, 'Enter the element to search: $'
  msg4 db 0ah, 'Found at pos: $'
  error db 0ah, 'Not Found!!$'
  find db ?
  pos db 2 dup('$')
  sz db ?
  res db 9 dup(?)

.code
start:
  mov ax, @data
  mov ds, ax
  mov es, ax
  mov si, 0

  ;take size of array
  mov ah, 09h
  mov dx, offset msg1
  int 21h

    ;input size
      mov ah, 01h
      int 21h

      ;decimal conversion
      and al, 0fh
      mov byte ptr[sz], al
      mov cl, al
      int 21h


  ;take array elements
  getElement:
    mov ah, 09h
    mov dx, offset msg2
    int 21h

    ;input elements
      mov ah, 01h
      int 21h

      ;decimal conversion
      and al, 0fh
      mov byte ptr[res+si], al
      inc si
      loop getElement

    int 21h

    ;get element to search
      mov ah, 09h
      mov dx, offset msg3
      int 21h

      ;input search
        mov ah, 01h
        int 21h
        ;decimal conversion
        and al, 0fh
        mov byte ptr[find], al
        int 21h

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;Searching the element
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

        mov si, 0
        mov bx, 0
        mov bl, 30H
        here:
          add bl, 01h
          mov byte ptr[pos], bl
          mov al, byte ptr[res+si]
          cmp al, byte ptr[find]
          je found
          inc si
          loop here

          notFound:
            mov ah, 09h
            mov dx, offset error
            int 21h
            jmp last

          found:
            cmp byte ptr[pos], 40h
            jae notFound
            mov ah, 09h
            mov dx, offset msg4
            int 21h

            mov ah, 09h
            mov dx, offset pos
            int 21h

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
last:
  .exit 0
end start
