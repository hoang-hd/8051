; knight rider effect running light: turn OFF the previous, turn ON the next, wait, and repeat
; Virtual hardware: led_panel

org 000h

start:

mov a,#07fh ; all ones and single 0
anl 090h,#03fh
call timer

right:
rr a
orl 090h,a
   call timerTransitionGap
rr a
anl 090h,a
rl a
call timer
cjne a,#0fdh,right
rr a
left:
rl a
orl 090h,a
   call timerTransitionGap
rl a
anl 090h,a
rr a
call timer
cjne a,#0bfh,left
rl a
ajmp right




timer:
; vrijeme kasnjenja priblizno je odredjeno formulom:
; t=A*B*C*2us
;ret; ukloniti prije programiranja (staviti ; ispred)
up1: mov r5,#01fh ;C
djnz r5,$ ;svaka naredba djnz izvodi se 2us
ret


timerTransitionGap:
; vrijeme kasnjenja priblizno je odredjeno formulom:
; t=A*B*C*2us
;ret; ukloniti prije programiranja (staviti ; ispred)
up2: mov r5,#02fh ;C
djnz r5,$ ;svaka naredba djnz izvodi se 2us
ret
