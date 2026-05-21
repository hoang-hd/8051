; switch 3.2 is closed by default, timer tracks how long the switch 3.2 was open before closing again
; each timeout shifts the LED from end to the start
; Virtual hardware: simple_keypad, led_panel

org 000h
setup:
mov th0,#0f5h;100h(256)-064h(100us)=09ch-reload vrijednosti
mov tl0,#09ch;brojac
mov tmod,#00ah;mod 2, gate0
setb tr0;zapocni brojanje
mov r1,#010h
mov a,#07fh
start:
jnb p3.2,setup
jnb tf0,start
rl a
mov p1,a
clr tf0
djnz r1,start

ajmp start