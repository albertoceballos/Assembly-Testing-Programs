cpu 286
org 100h

section .data
FIRST db "TEST",'$'
SECOND db "JOIN",'$'
UNION db "          "
linefeed db 13,10,'$';

section .text
print_first:
  mov ah,9
  mov dx,FIRST
  int 21h

print_second:
  mov ah,9
  mov dx,SECOND
  int 21h

print_space_2:
  mov ah,9
  mov dx,linefeed
  int 21h

mov cx,4
combine_1:
  mov ax,[FIRST+bx]
  mov [UNION+bx],ax
  inc bx
loop combine_1
xor cx,cx
mov cx,4
combine_2:
  mov ax,[SECOND+bx-4]
  mov [UNION+bx],ax
  inc bx
loop combine_2
print_union:
  mov ah,9
  mov dx,UNION
  int 21h

exit:
  mov ah,4Ch
  mov al,0
  int 21h
