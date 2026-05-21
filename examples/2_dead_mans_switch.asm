; Virtual hardware: simple_keypad, led_display
; Customer: Ana

org 000h

pocetak:

; vrijeme kasnjenja priblizno je odredjeno formulom:
; t=A*B*C*2us
jb p3.2,poc;ako je stisnuta idemo na stopanje 10 s
mov p1,#000h;LEDice upaljene
jnb p3.2,pocetak;ovdi se vrtimo sve dok se sklopka ne stisne
poc:
mov p1,#0ffh
mov r7,#002h ;A  080
up2: mov r6,#002h ;B 000
up1: mov r5,#002h ;C 000
jb p3.2,pocetak;skoči ako je sklopka upaljena
djnz r5,$ ;svaka naredba djnz izvodi se 2us
djnz r6,up1
djnz r7,up2
mov p1,#000h;ukljuci sve LEDice na P1
ajmp pocetak

