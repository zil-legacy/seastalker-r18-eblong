

	.FUNCT	QUEUE,RTN,TICK,CINT
	CALL	INT,RTN >CINT
	PUT	CINT,C-TICK,TICK
	RETURN	CINT


	.FUNCT	INT,RTN,E,C,INT
	ADD	C-TABLE,C-TABLELEN >E
	ADD	C-TABLE,C-INTS >C
?PRG1:	EQUAL?	C,E \?ELS5
	SUB	C-INTS,C-INTLEN >C-INTS
	ADD	C-TABLE,C-INTS >INT
	PUT	INT,C-RTN,RTN
	RETURN	INT
?ELS5:	GET	C,C-RTN
	EQUAL?	STACK,RTN \?CND3
	RETURN	C
?CND3:	ADD	C,C-INTLEN >C
	JUMP	?PRG1


	.FUNCT	CLOCKER,C,E,TICK,FLG=0,VAL
	ZERO?	CLOCK-WAIT /?CND1
	SET	'CLOCK-WAIT,FALSE-VALUE
	RFALSE	
?CND1:	ZERO?	P-WON /?PRD7
	PUSH	C-INTS
	JUMP	?CND5
?PRD7:	PUSH	0
?CND5:	ADD	C-TABLE,STACK >C
	ADD	C-TABLE,C-TABLELEN >E
?PRG11:	EQUAL?	C,E \?ELS15
	INC	'MOVES
	RETURN	FLG
?ELS15:	GET	C,C-ENABLED?
	ZERO?	STACK /?CND13
	GET	C,C-TICK >TICK
	ZERO?	TICK \?ELS20
	JUMP	?CND13
?ELS20:	SUB	TICK,1
	PUT	C,C-TICK,STACK
	GRTR?	TICK,1 /?CND18
	GET	C,C-RTN
	CALL	STACK >VAL
	ZERO?	VAL /?CND18
	ZERO?	FLG /?THN31
	EQUAL?	VAL,M-FATAL \?CND13
?THN31:	SET	'FLG,VAL
?CND18:	
?CND13:	ADD	C,C-INTLEN >C
	JUMP	?PRG11

	.ENDI
