;BINARY SEARCH

.model small

.stack 1000h

.data
  msg1 db 'Enter number of elements(max 9): $'
  msg2 db 0ah,'Enter the element: $'
  msg3 db 0ah, 'Enter the element to search: $'
  msg4 db 0ah, 'Found at pos: $'
  error db 0ah, 'Not Found!!$'

  sz db ?
  arr db 9 dup(?)
  num db ?          ; num to be searched
  beg db 00h
  last db 00h
  mid db 2 dup('$')

.code

findMid proc stdcall
  xor bx, bx
  mov bl, byte ptr[beg]
  add bl, byte ptr[last]
  shr bl, 1               ; ror or shr, both are co

  add bl, 30h
  mov byte ptr[mid], bl
  ret
findMid endp

start:
  mov ax, @data
  mov ds, ax
  mov es, ax
  mov si, 0
  mov cx, 0

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
      dec al
      mov byte ptr[last], al
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
      mov byte ptr[arr+si], al
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
        mov byte ptr[num], al
        int 21h

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;Searching the element
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

      binSearch:
        call findMid
        xor bx, bx
        mov bl, byte ptr[mid]
        and bl, 0fh
        mov si, bx

        mov bl, byte ptr[arr+si]
        cmp byte ptr[num], bl
        je found

        mov bl, byte ptr[last]
        cmp byte ptr[beg], bl
        je notFound

        mov bl, byte ptr[arr+si]
        cmp byte ptr[num], bl
        ja above
        cmp byte ptr[num], bl
        jb below

        above:
          mov bl, byte ptr[mid]
          and bl, 0fh
          cmp bl, byte ptr[beg]
          je increment
          mov byte ptr[beg], bl
          jmp binSearch

          increment:
            inc bl
            mov byte ptr[beg], bl
            jmp binSearch


        below:
          mov bl, byte ptr[mid]
          and bl, 0fh
          mov byte ptr[last], bl
          jmp binSearch


        found:
          mov bl, byte ptr[mid]
          inc bl
          mov byte ptr[mid], bl

          mov ah, 09h
          mov dx, offset msg4
          int 21h

          mov ah, 09h
          mov dx, offset mid
          int 21h
          jmp endSearch


        notFound:
          mov ah, 09h
          mov dx, offset error
          int 21h
          jmp endSearch

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
endSearch:
  .exit 0
end start
