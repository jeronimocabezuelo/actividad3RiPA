(define (problem problemaDosAmbulanciasDuration2) (:domain ambulanciasDuration2)
(:objects 
    l1 l2 l3 l4 l5 l6 l7 l8 l9 l10 - localizacion 
    hos1 hos2 - hospital
    amb1 amb2 - ambulancia
    e1 e2 e3 e4 e5 e6 e7 e8 - enfermo
)
(:init
    (localizado hos1 l9)
    (localizado hos2 l5)
    
    (localizado amb1 l9)
    (localizado amb2 l5)
    
    (localizado e1 l3)
    (localizado e2 l4)
    (localizado e3 l2)
    (localizado e4 l6)
    (localizado e5 l7)
    (localizado e6 l8)
    (localizado e7 l1)
    (localizado e8 l10)
    
    (conectados l1 l3)
    (= (distancia l1 l3) 20)
    (conectados l3 l1)
    (= (distancia l3 l1) 20)
    
    (conectados l1 l2)
    (= (distancia l1 l2) 20)
    (conectados l2 l1)
    (= (distancia l2 l1) 20)

    (conectados l1 l9)
    (= (distancia l1 l9) 70)
    (conectados l9 l1)
    (= (distancia l9 l1) 70)

    (conectados l1 l10)
    (= (distancia l1 l10) 30)
    (conectados l10 l1)
    (= (distancia l10 l1) 30)

    (conectados l1 l4)
    (= (distancia l1 l4) 40)
    (conectados l4 l1)
    (= (distancia l4 l1) 40)

    (conectados l4 l5)
    (= (distancia l4 l5) 60)
    (conectados l5 l4)
    (= (distancia l5 l4) 60)
    
    (conectados l3 l5)
    (= (distancia l3 l5) 50)
    (conectados l5 l3)
    (= (distancia l5 l3) 50)

    (conectados l3 l6)
    (= (distancia l3 l6) 40)
    (conectados l6 l3)
    (= (distancia l6 l3) 40)

    (conectados l2 l7)
    (= (distancia l2 l7) 60)
    (conectados l7 l2)
    (= (distancia l7 l2) 60)

    (conectados l2 l8)
    (= (distancia l2 l8) 60)
    (conectados l8 l2)
    (= (distancia l8 l2) 60)


    (= (gravedad e1) 7)
    (= (gravedad e2) 9)
    (= (gravedad e3) 8)
    (= (gravedad e4) 2)
    (= (gravedad e5) 6)
    (= (gravedad e6) 7)
    (= (gravedad e7) 6)
    (= (gravedad e8) 4)
)
(:goal (and
    (hospitalizado e1)
    (hospitalizado e2)
    (hospitalizado e3)
    (hospitalizado e4)
    (hospitalizado e5)
    (hospitalizado e6)
    (hospitalizado e7)
    (hospitalizado e8)
))
)
