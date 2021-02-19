(define (problem problemaInicial) (:domain ambulancias)
(:objects 
    loc1 loc2 loc3 loc4 - localizacion
    hos1 - hospital
    amb1 - ambulancia
    enf1 enf2 - enfermo
)

(:init
    (localizado hos1 loc1)
    
    (localizado amb1 loc1)
    
    (localizado enf1 loc3)
    (localizado enf2 loc4)

    (conectados loc1 loc2)
    (conectados loc2 loc1)
    (conectados loc2 loc4)
    (conectados loc4 loc2)
    (conectados loc4 loc3)
    (conectados loc3 loc4)
)

(:goal (and
    (hospitalizado enf1)
    (hospitalizado enf2)
))
)
