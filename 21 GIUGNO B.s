                        ;Si     realizzi un programma in assembly ARM che implementi le seguenti funzionalita.
                        ;Sia    dato un vettore V di interi a 32 bit:
                        ;1.     Generare quattro nuovi vettori con le seguenti caratteristiche:
                        ;zero   = {x∈V :bit0(x) = 1}
                        ;one    = {x∈V :bit1(x) = 1}
                        ;two    = {x∈V :bit2(x) = 1}
                        ;three  = {x ∈V :bit3(x) = 1}
                        ;2.     Determinare quale dei quattro vettori possiede piu elementi e memorizzare
                        ;questa informazione in una apposita locazione di memoria


VEC                     DCD     1,2,3,4,5,6,7,8,9,10
DIM                     EQU     10
ZERO                    FILL    40
ONE                     FILL    40
TWO                     FILL    40
THREE                   FILL    40
VEC_MAX                 FILL    4

                        ;R0:VETTORE ZERO
                        ;R1:VETTORE ONE
                        ;R2:VETTORE TWO
                        ;R3:VETTORE THREE
                        ;R4:VETTORE PRINCIPALE
                        ;R5:DIMENSIONE VETTORE
                        ;R6:USATO PER L'ELEMENTO CORRENTE DEL VETTORE
                        ;R7:CONTATORE DEL VETTORE ZERO DOVE IMMAGAZZINARE IL BIT MENO SIGNIFICATIVO PER POI CONFRONTARLO
                        ;R8:CONTATORE DEL VETTORE ONE DOVE IMMAGAZZINARE IL BIT MENO SIGNIFICATIVO PER POI CONFRONTARLO
                        ;R9:CONTATORE DEL VETTORE TWO DOVE IMMAGAZZINARE IL BIT MENO SIGNIFICATIVO PER POI CONFRONTARLO
                        ;R10:CONTATORE DEL VETTORE THREE DOVE IMMAGAZZINARE IL BIT MENO SIGNIFICATIVO PER POI CONFRONTARLO

                        MOV     R0,#ZERO
                        MOV     R1,#ONE
                        MOV     R2,#TWO
                        MOV     R3,#THREE
                        MOV     R4,#VEC
                        MOV     R5,#DIM
                        MOV     R7,#0 ;CONTATORE ZERO
                        MOV     R8,#0 ;CONTATORE ONE
                        MOV     R9,#0 ;CONTATORE TWO
                        MOV     R10,#0 ;CONTATORE THREE


LOOP                    
                        CMP     R5,#0
                        BEQ     END_LOOP
                        LDR     R6,[R4],#4
                        SUB     R5,R5,#1

                        ;ISTRUZIONI PER VEC ZERO
IS_ZERO                 

                        AND     R7,R6,#1
                        CMP     R7,#1
                        BEQ     LOOP_ZERO

                        ;ISTRUZIONI PER VEC ONE
IS_ONE                  
                        LSR     R8,R6,#1
                        AND     R8,R8,#1
                        CMP     R8,#1
                        BEQ     LOOP_ONE

                        ;ISTRUZIONI PER VEC TWO
IS_TWO                  
                        LSR     R9,R6,#2
                        AND     R9,R9,#1
                        CMP     R9,#1
                        BEQ     LOOP_TWO
                        ;ISTRUZIONI PER VEC THREE
IS_THREE                
                        LSR     R10,R6,#3
                        AND     R10,R10,#1
                        CMP     R10,#1
                        BEQ     LOOP_THREE
                        B       LOOP





                        ;----------------------------------------------PARTE DEI LOOP-----------------------------------------------------------------------------------------
                        ;LOOP   ZERO
LOOP_ZERO               

                        STR     R6,[R0]
                        ADD     R0,R0,#4
                        B       IS_ONE

                        ;LOOP   ONE
LOOP_ONE                
                        STR     R6,[R1]
                        ADD     R1,R1,#4

                        B       IS_TWO

                        ;LOOP   TWO
LOOP_TWO                
                        STR     R6,[R2]
                        ADD     R2,R2,#4
                        B       IS_THREE

                        ;LOOP   THREE
LOOP_THREE              
                        STR     R6,[R3]
                        ADD     R3,R3,#4
                        B       LOOP

END_LOOP                
                        ;INIZIALIZZO I REGISTRI PER RIUSARLI PER TROVARE IL VETTORE MAGGIORE
                        MOV     R0,#ZERO
                        MOV     R1,#ONE
                        MOV     R2,#TWO
                        MOV     R3,#THREE
                        
                        MOV     R5,#DIM
                        MOV     R7,#0 ;CONTATORE ZERO
                        MOV     R8,#0 ;CONTATORE ONE
                        MOV     R9,#0 ;CONTATORE TWO
                        MOV     R10,#0 ;CONTATORE THREE
                        ;LOOP   PER ZERO
LOOP_COUNTING_ZERO      
                        CMP     R5,#0
                        BEQ     END_LOOP_COUNTING

                        LDR     R4,[R0],#4
                        SUB     R5,R5,#1
                        CMP     R4,#0
                        BEQ     LOOP_COUNTING_ZERO
                        ADD     R7,R7,#1
                        B       LOOP_COUNTING_ZERO

END_LOOP_COUNTING       

                        MOV     R5,#DIM
                        ;LOOP   PER ONE
LOOP_COUNTING_ONE       
                        CMP     R5,#0
                        BEQ     END_LOOP_COUNTING_ONE
                        LDR     R4,[R1],#4
                        SUB     R5,R5,#1

                        CMP     R4,#0
                        BEQ     LOOP_COUNTING_ONE
                        ADD     R8,R8,#1
                        B       LOOP_COUNTING_ONE

END_LOOP_COUNTING_ONE   
                        MOV     R5,#DIM
                        ;LOOP   PER TWO
LOOP_COUNTING_TWO       
                        CMP     R5,#0
                        BEQ     END_LOOP_COUNTING_TWO
                        LDR     R4,[R2],#4
                        SUB     R5,R5,#1

                        CMP     R4,#0
                        BEQ     LOOP_COUNTING_TWO
                        ADD     R9,R9,#1
                        B       LOOP_COUNTING_TWO

END_LOOP_COUNTING_TWO   

                        MOV     R5,#DIM
                        ;LOOP   PER THREE
LOOP_COUNTING_THREE     
                        CMP     R5,#0
                        BEQ     END_LOOP_COUNTING_THREE
                        LDR     R4,[R3],#4
                        SUB     R5,R5,#1

                        CMP     R4,#0
                        BEQ     LOOP_COUNTING_THREE
                        ADD     R10,R10,#1
                        B       LOOP_COUNTING_THREE

END_LOOP_COUNTING_THREE 

END 














