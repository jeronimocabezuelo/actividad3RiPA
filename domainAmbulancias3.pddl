;Header and description

(define (domain ambulanciasDuration2)

(:requirements :strips :typing  :negative-preconditions :fluents :durative-actions)

(:types 
    localizacion - object
    elemento - object
    hospital ambulancia enfermo - elemento
)
(:predicates 
    (conectados ?loc1 - localizacion ?loc2 - localizacion)
    (localizado ?el - elemento ?loc - localizacion)
    (cargaEnfermo ?amb - ambulancia ?enf - enfermo)
    (cargada ?amb - ambulancia)
    (enHospital ?hos - hospital ?enf - elemento)
    (hospitalizado ?enf - enfermo)
)
(:functions
    (gravedad ?enf - enfermo)
    (distancia ?loc1 - localizacion ?loc2 - localizacion)
)
(:durative-action mueveAmbulancia
    :parameters (?amb - ambulancia ?locInicial - localizacion ?locFinal - localizacion)
    :duration (= ?duration (distancia ?locInicial ?locFinal))
    :condition (and 
        (at start (localizado ?amb ?locInicial))
        (at start (conectados ?locInicial ?locFinal))
    )
    :effect (and 
        (at start (not(localizado ?amb ?locInicial)))
        (at end (localizado ?amb ?locFinal))
    )
)
(:durative-action cargarEnfermo
    :parameters (?amb - ambulancia ?enf - enfermo ?loc - localizacion)
    :duration (= ?duration (gravedad ?enf))
    :condition (and 
        (at start(localizado ?amb ?loc))
        (at start(localizado ?enf ?loc))
        (at start(not(cargada ?amb)))
    )
    :effect (and 
        (at start (not (localizado ?amb ?loc)))
        (at end (not(localizado ?enf ?loc)))
        (at end (cargada ?amb))
        (at end (cargaEnfermo ?amb ?enf))
        (at end (localizado ?amb ?loc))
    )
)
(:action soltarEnfermo
    :parameters (?amb - ambulancia ?enf - enfermo ?hos - hospital ?loc - localizacion)
    :precondition (and
        (localizado ?amb ?loc)
        (localizado ?hos ?loc)
        (cargaEnfermo ?amb ?enf) 
    )
    :effect (and 
        (not(cargada ?amb))
        (not(cargaEnfermo ?amb ?enf))
        (enHospital ?hos ?enf)
        (hospitalizado ?enf)
    )
)
)
