; the led_panel and simple_keypad are dividen in half
; code compare which half has more ones
; if left side of simple_keypad has more closed switches the left side of led_panel in ON and vice versa,
; if equal both sides of led_panel are ON
; Virtual hardware: led_panel, simple_keypad
; Customer: Topic


org 000h

pocetak:

;učitajmo stanje na P3, sklopke
mov r3,0b0h;na r3 unosimo stanje sa p3, i zanemarujemo sve daljnje promjene p3

mov a,r3;unesi u akumulator stanje p3
anl a,#00fh;izdvajamo desna 4 bita
mov p0,a;spremamo desna 4 bita na p0

mov a,r3;unesi u akumulator stanje p3 ponovno
mov r2,#004h
pomicanjeUlivo:
rl a
djnz r2,pomicanjeulivo
anl a,#00fh;izdvajamo lijeva 4 bita u akumulatoru
mov p2,a;spremamo lijeva 4 bita na p2


;brojimo jedinice u lijevoj strani

mov r6,#004h;brojač

jnb p0.0,no01;provjeravamo bitnove od 4 do 1
inc r6;ima jedinicu, povecaj r6
No01:
jnb p0.1,no02;provjeravamo bitnove od 4 do 1
inc r6;ima jedinicu, povecaj r6
No02:
jnb p0.2,no03;provjeravamo bitnove od 4 do 1
inc r6;ima jedinicu, povecaj r6
No03:
jnb p0.3,no04;provjeravamo bitnove od 4 do 1
inc r6;ima jedinicu, povecaj r6
No04:


;brojimo jedinice u desnoj strani

jnb p2.0,no05;provjeravamo bitnove od 4 do 1
dec r6;ima jedinicu, povecaj r6
No05:
jnb p2.1,no06;provjeravamo bitnove od 4 do 1
dec r6;ima jedinicu, povecaj r6
No06:
jnb p2.2,no07;provjeravamo bitnove od 4 do 1
dec r6;ima jedinicu, povecaj r6
No07:
jnb p2.3,no08;provjeravamo bitnove od 4 do 1
dec r6;ima jedinicu, povecaj r6
No08:

;jednak broj jedinica, r6=4
;liva strana vise jedinica, r6>4
;desna strana vise jedinica, r6<4

mov a,r6
cjne a,#004h,skok1;skoci ako nisu jednaki
mov p1,#000h
ajmp pocetak;jednaki su i gotovo
skok1:
subb a,#004h;oduzimamo od brojaca 4
mov p2,a
jb p2.7,skok2;skoci ako je 7dmi bit == 1, tj, r6<4 ==> desna strana vise jedinica
mov p1,#0f0h
ajmp pocetak;gotovo
skok2:
mov p1,#00fh
ajmp pocetak; gotovo



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
