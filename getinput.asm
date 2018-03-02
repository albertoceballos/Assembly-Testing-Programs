cpu 286
org 100h

section .data
MSG1 db 'enter a lower case letter: $' ;prompt for user
MSG2 db 0Dh,0Ah, 'In upper case it is:' ;display after processing
CHAR db ' ','$' ;placeholder for the inputed character
exCode db 0 ;exit code

section .text
start:
  mov ah,9 ;9=string function code.
  mov dx,MSG1 ;move the string to data register
  int 21h ;show it
  mov ah,1 ;1=get input function
  int 21h ; get input
  sub al,20h ;transform it. subtract and store result into
    ;lower bytes of acumulator register
    ;transformation works based on the ascii table
    ;lowercase letter range from 61 to 7A hex
    ;uppercase letter range from 41 to 5A hex
  mov [CHAR],al ;store the transformed
  ;store lower byte into char
  mov dx,MSG2 ;show message 2
  mov ah,9 ;string function
  int 21h ;int
Exit:
  mov ah,4Ch
  mov al,[exCode]
  int 21h
