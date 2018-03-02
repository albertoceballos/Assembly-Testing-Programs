cpu 286
org 100h

section .data
  array db 1,2,3,4,5,6,7,8,9,0;
section .text
  print_array:
    cmp array[bx],0
    je finis
    mov ah,9
    mov dx,[array+bx]
    inc bx
    jmp print_array

  end:
    mov ah,4Ch
    mov al,0
    int 21h
