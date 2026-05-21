; Print odd numbers if switch is ON
; Virtual hardware: simple_keypad, led_display
; Customer: Sunje

org 000h

start:
mov a,#000h; counter

pocetak:
jb p3.2,pocetak; if active continue
inc a

cjne a,#001h,skok2; jump if not one
call jedan
ajmp pocetak

skok2:
cjne a,#002h,skok3
call tri
ajmp pocetak

skok3:
cjne a,#003h,skok4
call pet
ajmp pocetak

skok4:
cjne a,#004h,skok5
call sedam
ajmp pocetak

skok5:
;brojac je na 4 ili veci te se vracamo na pocetak
call devet
ajmp start


jedan:
mov p1,#0f9h
ret

tri:
mov p1,#0b0h
ret

pet:
mov p1,#092h
ret

sedam:
mov p1,#0f8h
ret

devet:
mov p1,#090h
ret
