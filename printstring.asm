;TITLE: test
;HEADER
cpu 286
org 100h ;starting point of .com

;CONST section
ASCIIcr equ 0Dh ;ASCII code for return carriage
ASCIIlf equ 0Ah ;ASCII code for line feed

;initialized data
section .data
msg db "Alberto Ceballos",0Dh,0Ah, '$';Define ASCII string
;takes parameter string,return carriage, line feed, end line

;program body goes here
section .text
start:
  mov dx,msg ;local address of ASCII to display
  ;stores msg to dx register
  ;dx is general register
  mov ah, 9 ;mov 9 to ah. display string function
  int 21h ;display the string
  ;interrupt
Exit:
  mov ah,4Ch ;call for system Exit
  mov al,0  ;return exit code value
  int 21h   ;return to OS
