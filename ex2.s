           
             ;Si     realizzi un programma in assembly ARM che implementi le seguenti funzionalita.
             ;Siano  dati due vettori di interi a 32 bit, array A e array B.
             ;Generare un nuovo vettore occurences in cui l’elemento i-esimo
             ;contiene il numero di volte in cui l’elemento i-esimo di array B ` e presente in array A
             ;Determinare il massimo dell’array occurences

VEC_A        DCD     1,2,3,4,2,6,7,8,9,10
VEC_B        DCD     4,78,12,6,82,55,2,34,9,10
DIM_A        EQU     10
DIM_B        EQU     10
OCCURENCES   FILL    40
MASSIMO      DCD     0

;R0:VETTORE A
;R1: DIMENSIONE VETTORE A
;R2:VETTORE B
;R3:DIMENSIONE VETTORE B
;R4: VETTORE OCCURENCES
;R8: CONTATORE PER VEDERE QUANTE VOLTE L'ELEMENTO I-ESIMO DEL VETTORE B E' PRESENTE IN VETTORE A
             MOV     R0,#VEC_A
             MOV     R1,#DIM_A
             MOV     R2,#VEC_B
             MOV     R3,#DIM_B
             MOV     R4,#OCCURENCES
             MOV     R8,#0 ;CONTATORE

;INIZIO IL LOOP PER I VALORI DELL'ARRAY B
LOOP_B       
             CMP     R3,#0
             BEQ     END_LOOP_B
             LDR     R5,[R2],#4
             SUB     R3,R3,#1
;R7:NUMERO DI ELEMENTI RIMASTI DA LEGGERE
;R9:PUNTATORE AL VETTORE  A
             MOV     R7,R1
             MOV     R9,R0

;INIZIO IL LOOP PER IL VETTORE A,COMPARO I VALORI CORRENTI DEI DUE VETTORI E SE SONO UGUALI INCREMENTO IL CONTATORE
LOOP_A       
             CMP     R7,#0
             BEQ     END_LOOP_A
             LDR     R6,[R9],#4
             SUB     R7,R7,#1

             CMP     R5,R6
             BNE     LOOP_A

             ADD     R8,R8,#1
             B       LOOP_A


;MEMORIZZIO IN MEMORIA IL VALORE DI R8, INCREMENTO OCCURENCES E INIZIALIZZO A 0 IL CONTATORE PER IL NUOVO CONTROLLO
END_LOOP_A   
             STR     R8,[R4]
             ADD     R4,R4,#4
             MOV     R8,#0
             B       LOOP_B



END_LOOP_B 
;SVUOTO E RIUSO I REGISTRI CHE NON MI SERVONO PIU  
             MOV     R0,#OCCURENCES
             MOV     R1,#DIM_A
             MOV     R2,#MASSIMO
             LDR     R2,[R2]

;INIZIO IL LOOP PER CONTROLLARE IL MASSIMO
LOOP_MAX     
             CMP     R1,#0
             BEQ     END_LOOP_MAX
             LDR     R4,[R0],#4
             SUB     R1,R1,#1

             CMP     R4,R2
             BLT     LOOP_MAX

             MOV     R2,R4
             B       LOOP_MAX

END_LOOP_MAX 



             END





















