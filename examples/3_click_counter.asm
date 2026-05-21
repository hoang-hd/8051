; Count how many times the switch 3.2 was clicked
; Virtual hardware: simple_keypad, led_display
; Customer: Sego

org 000h

start:
mov a,#000h;brojac
call nula

pocetak:

cjne a,#000h,skok1;skoci ako nije nula
call nula
skok1:

jb p3.3,NoReset;ako je snisnuta reset tipka resetiramo brojac
mov a,#000h
NoReset:

jb p3.2,pocetak;ako je snisnuta idemo dalje

inc a

cjne a,#001h,skok2;skoci ako nije jedan
call jedan
ajmp pocetak

skok2:
cjne a,#002h,skok3
call dva
ajmp pocetak

skok3:
cjne a,#003h,skok4
call tri
ajmp pocetak

skok4:
cjne a,#004h,skok5
call cetri
ajmp pocetak

skok5:
cjne a,#005h,skok6
call pet
ajmp pocetak

skok6:
cjne a,#006h,skok7
call sest
ajmp pocetak

skok7:
cjne a,#007h,skok8
call sedam
ajmp pocetak

skok8:
cjne a,#008h,skok9
call osam
ajmp pocetak

skok9:
cjne a,#009h,skok10;skoci ako nije devet
call devet
ajmp pocetak

skok10:
call error
ajmp pocetak

nula:
mov p1,#040h
ret

jedan:
mov p1,#0f9h
ret

dva:
mov p1,#0a4h
ret

tri:
mov p1,#0b0h
ret

cetri:
mov p1,#099h
ret

pet:
mov p1,#092h
ret

sest:
mov p1,#082h
ret

sedam:
mov p1,#0f8h
ret

osam:
mov p1,#090h
ret

devet:
mov p1,#090h
ret

error:
mov p1,#086h
ret
