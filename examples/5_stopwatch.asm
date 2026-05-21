; Stopwatch, close switch 3.2, start timing until it is open,
; and after closed display elapsed time
; Virtual hardware: simple_keypad, led_display
; Customer: Ante K. G.

org 000h

novoStopanjeVremena:


; vrijeme kasnjenja priblizno je odredjeno formulom:
; t=A*B*C*2us

jb p3.2,novoStopanjeVremena;ako nije stisnuta nezapocinje stopanje
;stisnuta je


mov a,#000h

stopanje:
mov r7,#001h ;A=008  -> tajmer prilagođen simulaciji
up3: mov r6,#001h ;B=000
up2: mov r5,#001h ;C=000
up1: jb p3.2,prikaz;skoči ako je ponovno stisnuta tipka
djnz r5,up1 ;svaka naredba djnz izvodi se 2us
djnz r6,up2
djnz r7,up3
inc a;svake sekunde naraste za jedan
cjne a,#009h,stopanje;kada dode do 9 sekundi prekida se i i de na prikaz
call devet
ajmp stopanje

prikaz:
cjne a,#000h,jed
call nula
jed:
cjne a,#001h,dv
call jedan
dv:
cjne a,#002h,tr
call dva
tr:
cjne a,#003h,cet
call tri
cet:
cjne a,#004h,pe
call cetri
pe:
cjne a,#005h,ses
call pet
ses:
cjne a,#006h,sed
call sest
sed:
cjne a,#007h,os
call sedam
os:
cjne a,#008h,dev
call osam 
dev:
call devet
ajmp novoStopanjeVremena

nula:
mov p1,#040h
ajmp novoStopanjeVremena

jedan:
mov p1,#0f9h
ajmp novoStopanjeVremena

dva:
mov p1,#0a4h
ajmp novoStopanjeVremena

tri:
mov p1,#0b0h
ajmp novoStopanjeVremena

cetri:
mov p1,#099h
ajmp novoStopanjeVremena

pet:
mov p1,#092h
ajmp novoStopanjeVremena

sest:
mov p1,#082h
ajmp novoStopanjeVremena

sedam:
mov p1,#0f8h
ajmp novoStopanjeVremena

osam:
mov p1,#090h
ajmp novoStopanjeVremena

devet:
mov p1,#090h
ajmp novoStopanjeVremena
