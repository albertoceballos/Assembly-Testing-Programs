org 100h
cpu 286

section .data
  A db 2;
  B db 3;
  C db 5;
section .text
print_numbers:
  mov ah,9
  mov dx, A
  int 21h
end:
  mov ah,4Ch
  mov al,0
  int 21h
