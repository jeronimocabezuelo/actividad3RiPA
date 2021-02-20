;Header and description

(define (domain ambulancias)

;remove requirements that are not needed
(:requirements :strips :typing  :negative-preconditions )

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


(:action mueveAmbulancia
    :parameters (?amb - ambulancia ?locInicial - localizacion ?locFinal - localizacion)
    :precondition (and 
        (localizado ?amb ?locInicial)
        (conectados ?locInicial ?locFinal)
    )
    :effect (and 
        (not(localizado ?amb ?locInicial))
        (localizado ?amb ?locFinal)
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
