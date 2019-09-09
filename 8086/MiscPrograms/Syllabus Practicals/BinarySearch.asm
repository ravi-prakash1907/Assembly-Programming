;BINARY SEARCH

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;   MACRO -> to print data
    cout macro prompt
      mov ah, 09h
      mov dx, offset prompt
      int 21h
    endm

;   MACRO -> to get data
    cin macro
      mov ah, 01h
      int 21h
    endm

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
  cout msg1

    ;input size
      cin
      ;decimal conversion
      and al, 0fh
      mov byte ptr[sz], al
      mov cl, al
      dec al
      mov byte ptr[last], al
      int 21h


  ;take array elements
  getElement:
    cout msg2

    ;input elements
      cin
      ;decimal conversion
      and al, 0fh
      mov byte ptr[arr+si], al
      inc si
      loop getElement

    int 21h

    ;get element to search
      cout msg3

      ;input search
        cin
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

          cout msg4
          cout mid

          jmp endSearch


        notFound:
          cout error
          jmp endSearch

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
endSearch:
  .exit 0
end start
