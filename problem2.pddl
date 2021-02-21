(define (problem problemaDosHospitales) (:domain ambulancias)
(:objects 
    loc1 loc2 loc3 loc4 - localizacion
    hos1 hos2 - hospital
    amb1 - ambulancia
    enf1 enf2 - enfermo
)
(:init
    (localizado hos1 loc1)
    (localizado hos2 loc2)
    (localizado amb1 loc1)
    (localizado enf1 loc3)
    (localizado enf2 loc4)
    (conectados loc1 loc2)
    (conectados loc2 loc1)
    (conectados loc2 loc4)
    (conectados loc4 loc2)
    (conectados loc4 loc3)
    (conectados loc3 loc4)
    (conectados loc1 loc3)
    (conectados loc3 loc1)
)
(:goal (and
    (hospitalizado enf1)
    (hospitalizado enf2)
))
)
