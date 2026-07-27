                 ;ESAME  13 LUGLIO
                 ;Si     realizzi un programma in assembly ARM che implementi le seguenti funzionalita.
                 ;Sia    dato un vettore di interi a 32 bit v:
                 ;1.     Generare due vettori, evens e odds, il primo con tutti gli elementi di v di
                 ;indice pari e il secondo con tutti gli elementi di v di indice dispari;
                 ;2.     Determinare il minimo e il massimo di evens e odds, memorizzando i valori
                 ;in     4 apposite locazioni (se un vettore ` e vuoto, memorizzare −1).

ARRAY            DCD     1,2,3,4,5,6,7,8,9,10
DIM              EQU     5
MINIMO           DCD     1000
MASSIMO          DCD     -123322
MINIMODISP       DCD     1000
MASSIMODISP      DCD     -123322
PARINDEX         DCD     5,3,9,1,7
DISPARINDEX      DCD     10,6,2,8,4


;R2 MINORE ARRAY DEGLI INDICI PARI
;R3 MAGGIORE ARRAY DEGLI INDICI PARI
;R8 MAGGIORE ARRAY DEGLI INDICI DISPARI
;R9 MINORE ARRAY DEGLI INDICI DISPARI


                 MOV     R1,#DIM
                 MOV     R2,#MINIMO
                 MOV     R3,#MASSIMO
                 MOV     R4,#PARINDEX
                 MOV     R5,#DISPARINDEX
                 MOV     R8,#MASSIMODISP
                 MOV     R9,#MINIMODISP
                 LDR     R3,[R3]
                 LDR     R2,[R2]
                 LDR     R8,[R8]
                 LDR     R9,[R9]

LOOP_PARI        
                 CMP     R1,#0
                 BEQ     END_LOOP_PARI
                 LDR     R6,[R4]
                 CMP     R6,R3
                 BGT     MAX
                 CMP     R6,R2
                 BLT     MIN
                 ADD     R4,R4,#4
                 SUBS    R1,R1,#1
                 B       LOOP_PARI

MIN              

                 MOV     R2,R6
                 B       LOOP_PARI

MAX              
                 MOV     R3,R6
                 B       LOOP_PARI


END_LOOP_PARI    
                 MOV     R0,#DIM

LOOP_DISPARI     

                 CMP     R0,#0
                 BEQ     END_LOOP_DISPARI
                 LDR     R7,[R5]

                 CMP     R7,R8
                 BGT     MAXD

                 CMP     R7,R9
                 BLT     MIND
                 ADD     R5,R5,#4
                 SUBS    R0,R0,#1
                 B       LOOP_DISPARI




MIND             

                 MOV     R9,R7
                 B       LOOP_DISPARI

MAXD             
                 MOV     R8,R7
                 B       LOOP_DISPARI






END_LOOP_DISPARI 
                 END





