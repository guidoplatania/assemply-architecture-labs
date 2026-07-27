            ;Si     realizzi un programma in assembly ARM che implementi le seguenti funzionalita.`
            ;Sia    dato un vettore v di interi a 32 bit:
            ;1.     Generare un nuovo vettore v1 in cui inserire gli elementi di v i cui bit 3 e 7 sono entrambi a 1
            ;2.     Determinare il minimo di v1.

VEC         DCD     1,190,168,40,33,66,191,139,9,10
DIM         EQU     10
V1          FILL    40
MINIMO      DCD     0


            MOV     R0,#VEC
            MOV     R1,#DIM
            MOV     R2,#V1

            MOV     R5,#0 ;CONTATORE BIT
            MOV     R6,#0 ;CONTATORE BIT 7


LOOP        
            CMP     R1,#0
            BEQ     END_LOOP
            LDR     R4,[R0],#4
            SUB     R1,R1,#1

            LSR     R5,R4,#3
            AND     R5,R5,#1
            CMP     R5,#1
            BEQ     POS_3
            B       LOOP

POS_3       
            LSR     R6,R4,#7
            AND     R6,R6,#1
            CMP     R6,#1
            BEQ     TROVATO
            B       LOOP

TROVATO     

            STR     R4,[R2]
            ADD     R2,R2,#4
            B       LOOP

END_LOOP    

            MOV     R0,#V1
            MOV     R1,#DIM
            MOV     R3,#MINIMO
            LDR     R6,[R0]
            STR     R6,[R3]


LOOP_V1     
            CMP     R1,#0
            BEQ     END_LOOP_V1
            LDR     R4,[R0],#4
            SUB     R1,R1,#1

            LDR     R7,[R3]

            CMP     R4,R3
            BLT     MIN
            B       LOOP_V1


MIN         
            CMP     R4,#0
            BEQ     LOOP_V1
            STR     R4,[R3]

            B       LOOP_V1


END_LOOP_V1 



