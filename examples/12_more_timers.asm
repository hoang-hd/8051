org 000h
	ajmp setup
org 003h
	ajmp up
org 00bh
	ajmp blinktimer
org 013h
	ajmp down
org 01bh
org 023h
org 030h
setup:
	mov ie,#087h
	mov tmod,#002h;8 bit autoreload timer0
	mov th0,#000h
	mov tl0,#000h
	mov r5,#005h
	mov tl0,#0c0h
start:
	mov dptr,#vrimena
	mov a,r5
	movc a,@a+dptr
	mov th0,a
	mov dptr,#znam
	mov a,r5
	movc a,@a+dptr
	mov p1,a
	ajmp start
blinktimer:
	cpl p2.7
	reti
up:
	inc r5
	setb tr0
	cjne r5,#00ah, preskokup
	mov r5,#009h
preskokup:
	reti
	
down:
	cjne r5,#000h, preskokdown
	clr tr0
	setb p2.7
	reti
preskokdown:
	dec r5
	setb tr0
	reti
vrimena:
	db 000h, 0a0h, 0a8h, 0b0h, 0b8h, 0c0h, 0c8h
	db 0d0h, 0e0h, 0f0h

znam:
	db 03fh, 006h, 05bh, 04fh, 066h
	db 06dh, 07dh, 007h, 07fh, 06fh