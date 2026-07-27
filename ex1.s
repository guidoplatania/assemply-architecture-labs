                       ;13     LUGLIO 
                       ;Si     realizzi un programma in assembly ARM che implementi le seguenti funzionalita.
                       ;Sia    dato un vettore di interi a 32 bit v:
                       ;1.     Generare due vettori, evens e odds, il primo con tutti gli elementi di v di indice pari
                       ;e      il secondo con tutti gli elementi di v di indice dispari;
                       ;2.     Determinare il minimo e il massimo di evens e odds, memorizzando i valori
                       ;in     4 apposite locazioni (se un vettore ` e vuoto, memorizzare −1)

VEC                    DCD     1,2,3,4,5,6,7,8,9,10
DIM                    EQU     10
EVENS                  FILL    40
ODDS                   FILL    40
MASSIMO_EVENS          FILL    4
MINIMO_EVENS           FILL    4
MASSIMO_ODDS           FILL    4
MINIMO_ODDS            FILL    4


                       MOV     R0,#VEC
                       MOV     R1,#DIM
                       MOV     R2,#EVENS
                       MOV     R3,#ODDS

LOOP_EVENS             
                       CMP     R1,#0
                       BEQ     END_LOOP_EVENS
                       LDR     R4,[R0]
                       ADD     R0,R0,#8
                       SUB     R1,R1,#2
                       STR     R4,[R2]
                       ADD     R2,R2,#4
                       B       LOOP_EVENS

END_LOOP_EVENS         
                       MOV     R0,#VEC
                       MOV     R1,#DIM
                       ADD     R0,R0,#4
LOOP_ODDS              
                       CMP     R1,#0
                       BEQ     END_LOOP_ODDS
                       LDR     R5,[R0]
                       ADD     R0,R0,#8
                       SUB     R1,R1,#2

                       STR     R5,[R3]
                       ADD     R3,R3,#4
                       B       LOOP_ODDS

END_LOOP_ODDS          

                       MOV     R0,#EVENS
                       MOV     R1,#DIM
                       MOV     R3,#MASSIMO_EVENS
                       MOV     R4,#MINIMO_EVENS
                       ;CARICO IN R6 IL PRIMO ELEMENTO DI EVENS
                       LDR     R6,[R0]
                       ;CARICO IN MEMORIA IL VALORE DI R6(CIOE IL PRIMO VALORE DELL'ARRAY) SU MASSIMO E MINIMO
                       STR     R6,[R3]
                       STR     R6,[R4]

                       
                       

LOOP_MIN_MAX_EVENS     
                       CMP     R1,#0
                       BEQ     END_LOOP_MIN_MAX_EVENS
                       LDR     R7,[R0],#4
                       SUB     R1,R1,#1
                       ;CARICO IN R8 IL MASSIMO E IN R9 IL MINIMO PER IL CONFRONTO
                       LDR     R8,[R3] ;MAX
                       LDR     R9,[R4] ;MIN

                       CMP     R7,R8
                       BGT     MAX_EVENS

                       CMP     R7,R9
                       BLT     MIN_EVENS
                       B       LOOP_MIN_MAX_EVENS


MAX_EVENS              
                       STR     R7,[R3]
                       B       LOOP_MIN_MAX_EVENS

MIN_EVENS              
                       CMP     R7,#0
                       BEQ     LOOP_MIN_MAX_EVENS
                       STR     R7,[R4]
                       B       LOOP_MIN_MAX_EVENS

END_LOOP_MIN_MAX_EVENS 
                       MOV     R0,#ODDS
                       MOV     R1,#DIM
                       MOV     R3,#MASSIMO_ODDS
                       MOV     R4,#MINIMO_ODDS
                       LDR     R6,[R0]

                       STR     R6,[R3]
                       STR     R6,[R4]



LOOP_MIN_MAX_ODDS      
                       CMP     R1,#0
                       BEQ     END_LOOP_MIN_MAX_ODDS
                       LDR     R7,[R0],#4
                       SUB     R1,R1,#1

                       LDR     R10,[R3] ;MAX
                       LDR     R11,[R4] ;MIN

                       CMP     R7,R10
                       BGT     MAX_ODDS

                       CMP     R7,R11
                       BLT     MIN_ODDS

                       B       LOOP_MIN_MAX_ODDS


MAX_ODDS               
                       STR     R7,[R3]
                       B       LOOP_MIN_MAX_ODDS

MIN_ODDS               
                       CMP     R7,#0
                       BEQ     LOOP_MIN_MAX_ODDS
                       STR     R7,[R4]
                       B       LOOP_MIN_MAX_ODDS






END_LOOP_MIN_MAX_ODDS  













