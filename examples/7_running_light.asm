; Virtual hardware: led_panel

org 000h

start:

mov a,#0feh ; all ones and single 0

right:
rr a
call print
cjne a,#0feh,right
left:
rl a
call print
cjne a,#07fh,left

ajmp right

print:
mov 090h,a
call tajmer
ret


tajmer:
; vrijeme kasnjenja priblizno je odredjeno formulom:
; t=A*B*C*2us
;ret; ukloniti prije programiranja (staviti ; ispred)
up1: mov r5,#02fh ;C
djnz r5,$ ;svaka naredba djnz izvodi se 2us
ret
