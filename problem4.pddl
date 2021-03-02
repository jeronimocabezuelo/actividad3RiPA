(define (problem problemaDosAmbulanciasDuration2) (:domain ambulanciasDuration2)
(:objects 
    loc1 loc2 loc3 loc4 - localizacion 
    hos1  - hospital
    amb1 amb2 - ambulancia
    enf1 enf2 - enfermo
)
(:init
    (localizado hos1 loc1)
    (localizado amb1 loc1)
    (localizado amb2 loc1)
    (localizado enf1 loc3)
    (localizado enf2 loc4)
    (conectados loc1 loc2)
    (= (distancia loc1 loc2) 10)
    (conectados loc2 loc1)
    (= (distancia loc2 loc1) 10)
    (conectados loc2 loc4)
    (= (distancia loc2 loc4) 10)
    (conectados loc4 loc2)
    (= (distancia loc4 loc2) 10)
    (conectados loc4 loc3)
    (= (distancia loc4 loc3) 15)
    (conectados loc3 loc4)
    (= (distancia loc3 loc4) 15)
    

    (= (gravedad enf1) 5)
    (= (gravedad enf2) 7)
)
(:goal (and
    (hospitalizado enf1)
    (hospitalizado enf2)
))
)
