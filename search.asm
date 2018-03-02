cpu 286
org 100h

section .data
  msg db "testing"
  tgt db "sti"
  linefeed db 13,10,'$';
  found db "String found$";
  not_found db "String not found!$";
section .text
  call print_string_1
  call print_target
  call search

print_string_1:
  mov ah,9
  mov dx, msg
  int 21h
  call print_line
  ret

print_line:
  mov ah,9
  mov dx,linefeed
  int 21h
  ret

print_target:
  mov ah,9
  mov dx,tgt
  int 21h
  ret

search:
  mov di,msg
  mov cx,7
  cld
  mov al,[tgt]
  repne scasb
  jne nomatch
  je match

nomatch:
  mov ah,9
  mov dx,not_found
  int 21h
  call exit

match:
  mov ah,9
  mov dx,found
  int 21h
  call exit

exit:
  mov ah,4Ch
  mov al,0
  int 21h
