; 2 separate staircase automatic lights simulation
; switch p3.2 activates LEDs 1.7-1.4, timer 0 delays turning the LEDs off for 80us
; switch p3.3 activates LEDs 1.3-1.0, timer 1 delays turning the LEDs off for 110us
; closing the any of the switches resets the LEDs turn off timer
; Virtual hardware: simple_keypad, led_panel

org 000h
        ajmp setup
org 003h
        ajmp vanjski0
org 00bh
        ajmp tajmer0
org 013h
        ajmp vanjski1
org 01bh
        ajmp tajmer1
org 023h
org 030h
setup:
        mov ie, #08fh
        mov ip, #00ah
        mov tmod, #022h
        mov th0, #0afh
        mov tl0, #0afh
        mov th1, #091h
        mov tl1, #091h
        mov p1, #0ffh

start:
        ajmp start

vanjski0:
        mov tl0, #0afh
        anl p1, #00fh
        setb tr0
        reti
        
tajmer0:
        orl p1, #0f0h
        clr tr0
        reti
        
tajmer1:
        orl p1, #00fh
        clr tr1
        reti

vanjski1:
        mov tl1, #091h
        anl p1, #0f0h
        setb tr1
        reti