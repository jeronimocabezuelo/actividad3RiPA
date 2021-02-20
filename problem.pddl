; rover B
(define (problem multi-agent) 
(:domain MarsMotivationExample)
(:objects
	B 			- rover
	R			- sample
	S			- sample
	L 			- lander
	w1 w2 w3 	- waypoint
	)
(:init

	; Location rover B
	(loc B w2)

	; lander
	(loc_l L w2)

	; capability to analyze
	(analyze B)
	
	; capability to transmit
	(trans B)
	
	; Grid can traverse B
	(link B w1 w2)
	(link B w1 w3)
	(link B w2 w1)
	(link B w2 w3)
	(link B w3 w1)
	(link B w3 w2)

	; Initial location of soils and rocks
	(loc_sample S w1)
	(loc_sample R w3)
	(loc_sample S w3)
)

(:goal 
	(and
		(comm S w1)
		(loc B w2)
	)
)
)