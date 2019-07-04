; TEXT segment is used to keep the actual code

segment	.text
   global _start     ;must be declared for linker (ld)

_start:	            ;tells linker entry point
   mov	edx,len     ;message length
   mov	ecx,msg     ;message to write
   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int	0x80        ;call kernel

   mov	eax,1       ;system call number (sys_exit)
   int	0x80        ;call kernel


; DATA segment is used to declare the CONSTANTS

section	.data
msg db 'Hello, world!', 0xa  ;string to be printed
len equ $ - msg     ;length of the string

; there is another section i.e. BSS where variables are declared


;	a SECTION represents a Memory SEGMENT
; that's why the segment ... and section ... both work in the same way

;==============================================================;
; DIVISION OF Memory segments
  ; Data Seg.:      .data  &   .bss
  ; Code Seg.:      .text
  ; Stack Seg.:     This segment contains data values passed to functions and procedures within the program.
