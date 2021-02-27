;Header and description

(define (domain ambulanciasDuration)

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

(:durative-action mueveAmbulancia
    :parameters (?amb - ambulancia ?locInicial - localizacion ?locFinal - localizacion)
    :duration (= ?duration 5)
    :condition (and 
        (at start (localizado ?amb ?locInicial))
        (at start (conectados ?locInicial ?locFinal))
    )
    :effect (and 
        (at start (not(localizado ?amb ?locInicial)))
        (at end (localizado ?amb ?locFinal))
    )
)
(:action cargarEnfermo
    :parameters (?amb - ambulancia ?enf - enfermo ?loc - localizacion)
    :precondition (and 
        (localizado ?amb ?loc)
        (localizado ?enf ?loc)
        (not(cargada ?amb))
    )
    :effect (and 
        (cargada ?amb)
        (cargaEnfermo ?amb ?enf)
        (not(localizado ?enf ?loc))
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
