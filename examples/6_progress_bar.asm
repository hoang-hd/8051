; 4 LED displays simulating progress bar
; Virtual hardware: led_displays_progress_bar
; Customer: Fagarazzi

org 000h

pocetak:

mov r3,#006h;6 segmenata na svakom displeyu
mov r4,#000h;krećemo o d segmenta 0

mov 080h,#000h;p0
mov 090h,#000h;p1
mov 0a0h,#000h;p2
mov 0b0h,#000h;p3


mov a,r4;unesi u akumulator
skok1:
rl a;pomakni ulivo jedinicu
inc a;dodaje jedinicu na prvo misto
mov p0,a;ispiši rezultat na željeni port
djnz r3,skok1;vrti ovo za svih 6 segmenata

mov r3,#006h;6 segmenata na svakom displeyu
mov a,r4;unesi u akumulator
skok2:
rl a;pomakni ulivo jedinicu
inc a;dodaje jedinicu na prvo misto
mov p1,a;ispiši rezultat na željeni port
djnz r3,skok2;vrti ovo za svih 6 segmenata

mov r3,#006h;6 segmenata na svakom displeyu
mov a,r4;unesi u akumulator
skok3:
rl a;pomakni ulivo jedinicu
inc a;dodaje jedinicu na prvo misto
mov p2,a;ispiši rezultat na željeni port
djnz r3,skok3;vrti ovo za svih 6 segmenata

mov r3,#006h;6 segmenata na svakom displeyu
mov a,r4;unesi u akumulator
skok4:
rl a;pomakni ulivo jedinicu
inc a;dodaje jedinicu na prvo misto
mov p3,a;ispiši rezultat na željeni port
djnz r3,skok4;vrti ovo za svih 6 segmenata



call tajmer;cekamo 1 sekundu
ajmp pocetak




tajmer:
; vrijeme kasnjenja priblizno je odredjeno formulom:
; t=A*B*C*2us
ret; ukloniti prije programiranja (staviti ; ispred)
mov r7,#008h ;A
up2: mov r6,#000h ;B
up1: mov r5,#000h ;C
djnz r5,$ ;svaka naredba djnz izvodi se 2us
djnz r6,up1
djnz r7,up2
ret