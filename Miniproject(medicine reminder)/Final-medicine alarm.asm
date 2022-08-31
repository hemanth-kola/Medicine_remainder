;MEDICINE REMINDER
ORG 0
CLR P0.3			
CALL ID3		
JB F0,Done  		 
						
			
CLR P0.2			
CALL ID2		
JB F0,Done		 							

			
CLR P0.1			
CALL ID1		
JB F0,Done			

			
CLR P0.0			
CALL ID0		
JB F0,Done			
														
			
Done:
Start:
MOV A,R7
Mov R1,A;Number of hours
UP:Mov R2,#220
Two:MOV R3,#249
HERE:MOV TMOD,#10H ; TIMER 1 IN MODE 1
MOV TL1,#0H
MOV TH1,#0H
SETB TR1
Again:JNB TF1,Again
CLR TF1
DJNZ R3,HERE
DJNZ R2,TWO
DJNZ R1,UP


MOV A,#38H
   ACALL COM
   ACALL DELAY
MOV A,#0EH
   ACALL COM
   ACALL DELAY
MOV A, #01
   ACALL COM
   ACALL DELAY
MOV A,#06H
   ACALL COM
   ACALL DELAY

MOV DPTR,#STRING
BACK:
   MOV A,#00H
   MOVC A,@A+DPTR
   JZ EXIT
   ACALL DATA
   INC DPTR
SJMP BACK

EXIT:
   Acall PQ
   MOV A,#01
   ACALL COM
   ACALL DELAY

SJMP Start

DELAY:
   MOV R0,#50
   STAY1:MOV R4,#255
   STAY2:DJNZ R4,STAY2
   DJNZ R0, STAY1
   RET

COM:
   MOV P1,A
   CLR P0.3
   SETB p0.2
   ACALL DELAY
   CLR P0.2
   RET
DATA:
   MOV P1,A
   SETB P0.3
   SETB P0.2
   ACALL DELAY
   CLR P0.2
   RET

PQ:
   MOV R5,#231
   HERE1:MOV TMOD , #10H ; TIMER 1 IN MODE 1
   MOV TL1,#0H
   MOV TH1,#0H
   SETB TR1
   Again1:JNB TF1,Again1
   CLR TF1
   DJNZ R5,HERE1
   RET

STRING: DB 'T','A','B','L','E','T',' ','R','E','M','I','N','D','E','R',0
	
			
ID3:
   JNB P0.4,Key3	
   JNB P0.5, Key2	
   JNB P0.6, Key1	
   RET	
				

Key3:	
   SETB F0			
   Mov R7,#03	
   RET				

Key2:
   SETB F0			
   Mov R7,#02	
   RET				

Key1:
   SETB F0			
   Mov R7,#01	
   RET				

ID2:
   JNB P0.4, Key6	
   JNB P0.5, Key5	
   JNB P0.6, Key4	
   RET					

Key6:
   SETB F0
   Mov R7,#06		
   RET				

Key5:	
   SETB F0			
   Mov R7,#05		
   RET				

Key4:
   SETB F0			
   Mov R7,#04		
   RET				

ID1:
   JNB P0.4, Key9	
   JNB P0.5, Key8	
   JNB P0.6, Key7	
   RET					

Key9:
   SETB F0			
   Mov R7,#09		
   RET
				
Key8:
   SETB F0			
   Mov R7,#08		
   RET				

Key7:
   SETB F0			
   Mov R7,#07	
   RET	
			
ID0:
   JNB P0.4, KeyP	
   JNB P0.5, Key0	
   JNB P0.6, KeyQ
   RET					

KeyP:
   SETB F0			
   Mov R7,#00	
   RET				

Key0:
   SETB F0			
   Mov R7,#0	
   RET				

KeyQ:
   SETB F0			
   Mov R7,#00	
   RET				
		  
End