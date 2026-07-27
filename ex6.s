          ;Si     realizzi un programma in assembly ARM che implementi le seguenti funzionalita.
          ;Siano  dati due vettori di interi a 32 bit, array a e array
          ;b.     Generare un nuovo vettore found in cui l’elemento i-esimo contiene “1” se l’elemento
          ;i-esimodi array b ` e presente in array a, “0” in caso contrario.
          ;Successivamente determinare se il numero di “1” presenti in found ` e pari O
          ;dispariindicando l’esito del test nel registro R0.

VEC_A     DCD     1,2,3,4,5,6,7,8,9,10
VEC_B     DCD     1,10,4,8,5,6,18,11,9,10
DIM       EQU     10
FOUND     FILL    40

          MOV     R0,#VEC_A
          MOV     R1,#DIM
          MOV     R2,#VEC_B
          MOV     R3,#FOUND
          MOV     R6,#1
          MOV     R7,#0



LOOP      
          CMP     R1,#0
          BEQ     END_LOOP
          LDR     R4,[R0]
          LDR     R5,[R2]
          ADD     R0,R0,#4
          ADD     R2,R2,#4
          SUB     R1,R1,#1


          CMP     R4,R5
          BEQ     METTI1

METTI0    
          STR     R7,[R3]
          ADD     R3,R3,#4
          B       LOOP


METTI1    
          STR     R6,[R3]
          ADD     R3,R3,#4
          B       LOOP

END_LOOP  
          MOV     R0,#0
          MOV     R1,#DIM
          MOV     R3,#FOUND

LOOP2     
          CMP     R1,#0
          BEQ     END_LOOP2
          LDR     R4,[R3]
          ADD     R3,R3,#4
          SUB     R1,R1,#1

          CMP     R4,#1
          BEQ     UGUALE
          B       LOOP2


UGUALE    
          ADD     R0,R0,#1
          B       LOOP2


END_LOOP2 
          MOV     R4,#0 ;IL RISULTATO SARA' 1 SE IL NUMERO DI 1 E' DISPARI E SARA' 0 SE IL NUMERO DI 1 E' PARI
          AND     R4,R0,#1

          END


