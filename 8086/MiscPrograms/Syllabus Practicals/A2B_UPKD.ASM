; ASCII to Unpacked BCD

.model small

.data

 x db '74'    ; = x db 37h,34h    = in little endian format: [3437]

 ;  in little endian format:
 ;      1) data on 0th index (as fetched) is put into LOWER-byte (eg. AL) of resister
 ;      2) data on 1ST index (as fetched) is put into HIGHER-byte (eg. AH) of resister
 ;      3) so for Above 'X', if:
 ;              MOV AX, word ptr[x]         results into      AX = [3437]
 ;              i.e. from '74' (37h, 34h) -> AL = 37, AH = 34   --->    AX = AH:AL = 34:37

 num db '1234'
 res1 db 4 dup (?)    ; stored in incorrect way     
 res2 db 4 dup (?)    ; stored in correct way

.stack 1000h

.code
start:

 mov ax, @data
 mov ds, ax
 mov es, ax

 mov si, 0
 mov di, 3
 mov cx, 4

 here:
  mov al, byte ptr[num+si]
  and al, 0fh

  ;   LITTLE Endian
  mov byte ptr[res1+si], al   ; stores: res = {01, 02, 03, 04} =>
                              ; on fetching: dx:ax = [3433]:[3231] = '4321'   >_<
  mov byte ptr[res2+di], al   ; stores: res = {04, 03, 02, 01} =>
                              ; on fetching: dx:ax = [3132]:[3334] = '1234'   ;-)

  dec di
  inc si
  loop here

  mov ax, word ptr[x]       ;  implementation

 .exit 0
end start
