(define (domain bartending)
    (:requirements :adl )
    
    (:types
        bartender
        location
        glass
        customer
        ;; Fill in additional types here
    )
    
    (:constants 
        ;; You should not need to add any additional constants
        Agent - bartender
        BAR - location
    )
    
    (:predicates
        ;; Example:
        ;; (Contains ?x - object ?c - container)
        (adjacent ?loc1 - location ?loc2 - location)
        (at ?x - object ?loc - location)
        (empty ?g - glass)
        (holding ?a - bartender ?g - glass)
        (served ?c - customer)
    )
    
    ;;;; Action Template - Delete and fill in own actions ;;;;
    
    ;(:action dummy-action
    ;    :parameters (?obj - object)
    ;    :precondition (and
    ;        (dummy-pred-1 ?obj)
    ;        (dummy-pred-2 ?obj)
    ;    )
    ;    :effect (and
    ;        (not (dummy-pred-1 ?obj))
    ;        (dummy-pred-3 ?obj)
    ;    )
    ;)
    
    (:action PickUp
         :parameters (?G - glass ?L - location)
         :precondition (and
             (at Agent ?L)
             (at ?G ?L)
             (not (exists (?x - glass) (holding Agent ?x)))
             (empty ?G)
         )
         :effect (and
             (holding Agent ?G)
         )
    )
    
    (:action HandOver
         :parameters (?G - glass ?C - customer ?L - location)
         :precondition (and
             (at Agent ?L)
             (at ?C ?L)
             (not (empty ?G))
             (holding Agent ?G)
             (not (served ?C))
         )
         :effect (and
             (served ?C)
             (not (holding Agent ?G))
         )
    )
    
    (:action Pour
         :parameters (?G - glass)
         :precondition (and
             (holding Agent ?G)
             (at Agent BAR)
             (empty ?G)
         )
         :effect (and
             (not (empty ?G))
         )
    )
    
    (:action Move
         :parameters (?from - location ?to - location)
         :precondition (and
             (at Agent ?from)
             (adjacent ?from ?to)
         )
         :effect (and
             (at Agent ?to)
             (not (at Agent ?from))
         )
    )
)