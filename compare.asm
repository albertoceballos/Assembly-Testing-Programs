cpu 286
org 100h

section .data
  s1 db "abc$"
  s2 db "abc$"
  s3 db "abd$"
  not_equal db "NOT EQUAL$"
  equal db "Equal$"

section .text
  ;mov bx, s3
  ;push bx
  ;call print_string
  call compare_string
  call exit

  compare_string:
    mov cx,4
    mov si,s1
    mov di,s3
    repe cmpsb
    cmp cx,0
    je print_equal
    jne print_not_equal
    ret

  print_not_equal:
    mov ah,9
    mov dx,not_equal
    int 21h
    ret

  print_equal:
    mov ah,9
    mov dx,equal
    int 21h
    ret

  ;print_string:
  ;  push bp
  ;  mov bp,sp
  ;  mov ah,9
  ;  mov dx,[bp+4] ;+4 is first parameter; +6 is second parameter
  ;  int 21h
  ;  pop bp
  exit:
    mov ah,4Ch
    mov al,0
    int 21h
