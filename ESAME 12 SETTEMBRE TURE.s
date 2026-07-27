               ;Si     realizzi un programma in assembly ARM che implementi le seguenti funzionalita.
               ;Sia    dato un vettore di interi a 32 bit v e un intero k memorizzato in una locazione di memoria:
               ;1.     Generare due vettori:
               ;a1     e a2, il primo con tutti gli elementi di v divisibili per k e il secondo i rimanenti elementi;
               ;2.     Determinare il vettore, tra a1 e a2 con il maggior numero di elementi indicando questo risultato
               ;con    il numero 1 o 2 memorizzato su R10 a fine programma.

VEC            DCD     9,2,3,4,5,6,7,8,10,3
DIM            EQU     10
KAPPA          EQU     2
A1             FILL    40
A2             FILL    40

               MOV     R0,#VEC ;r0:vettore
               MOV     R1,#DIM ;r1 dimensione
               MOV     R2,#KAPPA ;k
               MOV     R3,#A1 ;array 1 DIVISIBILI
               MOV     R4,#A2 ;array 2 NON DIVISIBILI
               MOV     R6,#0 ;DIVISIONE


;
LOOP           
               CMP     R1,#0
               BEQ     END_LOOP
               LDR     R5,[R0]
               LDR     R6,[R0]


               ADD     R0,R0,#4
               SUB     R1,R1,#1


LOOP_DIVISIONE 

               CMP     R6,R2
               BLT     END_DIVISIONE
               SUB     R6,R6,R2
               B       LOOP_DIVISIONE


END_DIVISIONE  
               CMP     R6,#0
               BEQ     DIVISIBILE

               STR     R5,[R4]
               ADD     R4,R4,#4
               B       LOOP


DIVISIBILE     
               STR     R5,[R3]
               ADD     R3,R3,#4

               B       LOOP

END_LOOP       

               ;SVUOTO I REGISTRI E LI INIZIALIZZO
               MOV     R0,#A1
               MOV     R1,#DIM
               MOV     R2,#A2
               MOV     R5,#0 ;CONTATORE DI ARRAY 1
               MOV     R6,#0 ;CONTATORE DI ARRAY 2

LOOP_MAGGIORE  
               CMP     R1,#0
               BEQ     FINE

               LDR     R3,[R0]
               LDR     R4,[R2]

               ADD     R0,R0,#4
               ADD     R2,R2,#4
               SUB     R1,R1,#1

               CMP     R3,#0
               BEQ     CONTATORE2

               ADD     R5,R5,#1




CONTATORE2     
               CMP     R4,#0
               BEQ     LOOP_MAGGIORE
               ADD     R6,R6,#1

               B       LOOP_MAGGIORE

FINE           
               CMP     R5,R6
               BGE     MAGGIOREA1

               MOV     R10,#2
               END


MAGGIOREA1     
               MOV     R10,#1






               END