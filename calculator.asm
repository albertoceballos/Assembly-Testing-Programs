cpu 286
org 100h

ASCIIcr equ 0Dh
ASCIIlf equ 0Ah

section .data
  MSG db "Please enter a number: $" ;message for inputed
  MSG2 db "Please enter a second number: $" ;same thing
  MSG3 db 0Dh,0Ah,"The sum of the two numbers is: ";display after processing
  opt db "(a)ddition,(s)ubtraction,(m)ultiply,(d)ivide: $"
  NUM dw 0;
  NUM2 dw 0;
  linefeed db 13,10,'$';
  ans dw 0;
section .text
  print_string_tag:
    mov ah,9
    mov dx,MSG
    int 21h
    mov al,0Dh
    push ax
    xor ax,ax
    mov ah,1
  get_first_number:
    cmp al,0Dh
    je finis
    push ax
    mov ax,10
    mul bx
    mov bx,ax
    pop ax
    and ax,000Fh
    add bx,ax
    mov ah,1
    int 21h
    jmp get_first_number
  finis:
    mov [NUM],bx
    mov ah,9
    mov dx,NUM
    int 21h
  print_line_skip:
    mov ah,9h;
    mov dx, linefeed;
    int 21h;
  print_string_tag_2:
    mov ah,9
    mov dx,MSG2
    int 21h
    xor bx,bx
  print_line_skip_3:
    mov ah,9h;
    mov dx, linefeed;
    int 21h;
    xor ax,ax ;reset register
    mov ah,1
    xor bx,bx
  get_second_number:
    cmp al,0Dh
    je finis2
    push ax
    mov ax,10
    mul bx
    mov bx,ax
    pop ax
    and ax,000Fh
    add bx,ax
    mov ah,1
    int 21h
    jmp get_second_number
  finis2:
    mov [NUM2],bx
    mov ah,9
    mov dx,NUM2
    int 21h
  print_line_skip_4:
    mov ah,9h;
    mov dx, linefeed;
    int 21h;
  print_option_tag:
    mov ah,9
    mov dx, opt
    int 21h
  option_tag:
    mov ah,1
    int 21h
    cmp al,'a'
    je add_numbers
    cmp al,'s'
    je subtract_numbers
    cmp al,'m'
    je multiply_numbers
    cmp al,'d'
    je divide_numbers
  add_numbers:
    xor ax,ax
    mov ax,[NUM]
    add ax,[NUM2]
    mov [NUM2],ax
    jmp print_line_skip_5
  subtract_numbers:
    xor ax,ax
    mov ax,[NUM]
    sub ax,[NUM2]
    mov [NUM2],ax
  multiply_numbers:
    xor ax,ax
    xor bx,bx
    mov bx,[NUM]
    mov ax,[NUM2]
    mul bx; lm is in ax, hm is in dx
    mov bx,ax
    mov [NUM2],bx
  divide_numbers:
    xor ax,ax
    xor bx,bx
    xor dx,dx
    mov bx,[NUM2]
    mov ax,[NUM]
    div bx
    mov bx,ax
    mov [NUM2],bx
  print_line_skip_5:
    mov ah,9h;
    mov dx, linefeed;
    int 21h;
  print_number_3:
    mov ah,9h;
    mov dx, NUM2;
    int 21h;
    xor cx,cx
    mov bx,[NUM2]
  dec2hex:
    mov ax,bx
    xor dx,dx
    mov bx,10
    div bx
    push dx
    inc cx
    mov bx,ax
    cmp ax,0
    jne dec2hex
    mov ah,2
  for:
    pop dx
    or dl,30h
    int 21h
    loop for
  Exit:
    mov ah,4Ch;
    mov al,0;
    int 21h;
