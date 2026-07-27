                       
                       ;Si     realizzi un programma in assembly ARM che implementi le seguenti funzionalita.
                       ;Sia    dato un vettore di interi a 32 bit:
                       ;1.     Generare due vettori, even e odd, con tutti gli elementi pari e dispari del vettore originario;
                       ;2.     Determinare quale dei due vettori possiede pi` u elementi e calcolarne il mas simo ed il minimo,
                       ;memorizzando i due valori in due apposite locazioni della memoria.


VEC                    DCD     90,2,33,3,77,5,10,8,6,7
DIM                    EQU     10
EVENS                  FILL    40
ODDS                   FILL    40
MASSIMO                DCD     0
MINIMO                 DCD     0


;R0:VETTORE
;R1:DIMENSIONE
;R2:VETTORE DEI NUMERI PARI
;R3:VETTORE DEI NUMERI DISPARI


                       MOV     R0,#VEC
                       MOV     R1,#DIM
                       MOV     R2,#EVENS
                       MOV     R3,#ODDS
                       MOV     R6,#0 ;CONTATORE EVENS
                       MOV     R7,#0 ;CONTATORE ODDS



LOOP                   
                       CMP     R1,#0
                       BEQ     END_LOOP
                       LDR     R4,[R0],#4
                       SUB     R1,R1,#1
;USO AND PER VEDERE SE IL NUMERO è PARI O DISPARI, AND (REGISTRO DI DESTINAZIONE),(NUMERO CORRENTE),#1 
;SE IL RISULTATO IN R5 SARA' 1,ALLORA IL NUMERO E' DISPARI, SE E' 0 ALLORA è PARI
                       MOV     R5,#0
                       AND     R5,R4,#1
                       CMP     R5,#1
                       BEQ     DISPARI

                       STR     R4,[R2]
                       ADD     R6,R6,#1
                       ADD     R2,R2,#4

                       B       LOOP



DISPARI                
                       STR     R4,[R3]
                       ADD     R7,R7,#1
                       ADD     R3,R3,#4
                       B       LOOP



                       ;SECONDAPARTE
END_LOOP               

                       MOV     R0,#EVENS
                       MOV     R1,#DIM
                       MOV     R2,#ODDS
                       MOV     R9,#MASSIMO
                       MOV     R8,#MINIMO
                       LDR     R9,[R9]


                       CMP     R6,R7
                       BGE     LOOP_MAX_MIN_EVENS

LOOP_MAX_MIN_ODDS      
                       CMP     R1,#0
                       BEQ     END_LOOP_MAX_MIN_ODDS
                       LDR     R4,[R2],#4
                       SUB     R1,R1,#1



                       CMP     R4,R9
                       BGT     MAX_ODDS

                       CMP     R4,R8
                       BLT     MIN_ODDS
                       B       LOOP_MAX_MIN_EVENS

MAX_ODDS               
                       MOV     R9,R4
                       B       LOOP_MAX_MIN_ODDS

MIN_ODDS               
                       CMP     R4,#0
                       BEQ     LOOP_MAX_MIN_ODDS
                       MOV     R8,R4
                       B       LOOP_MAX_MIN_ODDS
END_LOOP_MAX_MIN_ODDS  

                       ;-----------------------------------------------------------------------------------------------
LOOP_MAX_MIN_EVENS     
                       CMP     R1,#0
                       BEQ     END_LOOP_MAX_MIN_EVENS
                       LDR     R4,[R0],#4
                       SUB     R1,R1,#1



                       CMP     R4,R9
                       BGT     MAX

                       CMP     R4,R8
                       BLT     MIN
                       B       LOOP_MAX_MIN_EVENS

MAX                    
                       MOV     R9,R4
                       B       LOOP_MAX_MIN_EVENS

MIN                    
                       CMP     R4,#0
                       BEQ     LOOP_MAX_MIN_EVENS
                       MOV     R8,R4
                       B       LOOP_MAX_MIN_EVENS









END_LOOP_MAX_MIN_EVENS 







