; Two sempahores
; Virtual hardware: led_panels_semaphore
; Customer: Bartul

org 000h

pocetak:

;svima je crveno
setb p1.5
clr p1.3
clr p1.0
call tajmer

;livi zuto
clr p1.1
call tajmer

;livi palimo, desni ceka
setb p1.0
setb p1.1
clr p1.2
call tajmer
call tajmer
call tajmer

;svima je crveno
setb p1.2
clr p1.0
call tajmer

;livi zuto
clr p1.4
call tajmer

;desni palimo, livi ceka
setb p1.2
clr p1.0
clr p1.4
call tajmer


setb p1.3
setb p1.4
clr p1.5
call tajmer
call tajmer
call tajmer


ajmp pocetak


tajmer:
; vrijeme kasnjenja priblizno je odredjeno formulom:
; t=A*B*C*2us
;ret; ukloniti prije programiranja (staviti ; ispred)
up1: mov r5,#005h ;C
djnz r5,$ ;svaka naredba djnz izvodi se 2us
ret
