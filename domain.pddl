(define (domain MarsMotivationExample)
(:requirements :typing)
(:types 
	agent sample waypoint lander - object
	rover  - agent
	rock soil 	 - sample)

(:predicates (loc ?r - rover ?w - waypoint) 
             (link ?r - rover ?w - waypoint ?p - waypoint)
             (have ?sa - sample ?r - rover) ; have rock and soil analysis 
             (comm ?sa - sample ?w - waypoint) ; communicated rock and soil data
	     	 (loc_sample ?sa - sample ?w - waypoint)	; at rock and soil sample at location
             (loc_l ?l - lander ?w - waypoint)

             (trans ?r - rover)
             (analyze ?r - rover)
             
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;    Rover's Actions    ;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(:action Navigate
:parameters 	(?r - rover ?w - waypoint ?p - waypoint) 
:precondition
	(and
	 	(link ?r ?w ?p)
	 	(loc ?r ?w)            
	)
:effect
	(and
 		(loc ?r ?p)
 		(not (loc ?r ?w))
	)
)

(:action Analyze
:parameters 	(?r - rover ?sa - sample ?p - waypoint)
:precondition
	(and
		(loc ?r ?p)
        (analyze ?r)
		(loc_sample ?sa ?p)
	)
:effect
 	(and
 		(have ?sa ?r)
 		(not (loc_sample ?sa ?p))
	)
)

(:action Communicate
 :parameters 	(?r - rover ?sa - sample ?l - lander ?w - waypoint ?y - waypoint)
 :precondition
 	(and
 		(loc ?r ?w)
		(loc_l ?l ?y)
		(have ?sa ?r)
		(trans ?r)
        )
 :effect
 	(and
		(comm ?sa ?w)
	)
)

)