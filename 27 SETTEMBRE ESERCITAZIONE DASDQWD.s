         ;27     settembre ESERCITAZIONE
         ;Si     realizzi un programma in assembly ARM che implementi le seguenti funzionalita.
         ;Siano  dati due vettori di interi a 32 bit A e B,
         ;contarequanti elementi di B sono presenti anche in A memorizzando il risultato finale nel registro R0

VEC_A    DCD     1,2,3,4,5,6,7,8,9,10
VEC_B    DCD     345,67,3,6,6,2,5,2,17,7
DIM_A    EQU     10
DIM_B    EQU     10



         MOV     R0,#VEC_A
         MOV     R1,#DIM_A
         MOV     R2,#VEC_B
         MOV     R3,#DIM_B
         MOV     R6,#0 ;CONTATORE


LOOP_B   
         CMP     R3,#0
         BEQ     END_LOOP
         LDR     R4,[R2],#4
         SUB     R3,R3,#1

         MOV     R7,R0
         MOV     R8,R1

LOOP_A   
         CMP     R8,#0
         BEQ     LOOP_B
         LDR     R5,[R7],#4
         SUB     R8,R8,#1

         CMP     R4,R5
         BNE     LOOP_A

         ADD     R6,R6,#1
         B       LOOP_A

END_LOOP 
         MOV     R0,R6











