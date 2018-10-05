(define (domain bartending)
    (:requirements :adl )
    
    (:types
        bartender
        location
        glass broom - item
        customer
        brokenGlass
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
        (holding ?a - bartender ?i - item)
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
    
    (:action PickUpGlass
         :parameters (?G - glass ?L - location)
         :precondition (and
             (at Agent ?L)
             (at ?G ?L)
             (not (exists (?i - item) (holding Agent ?i)))
             (empty ?G)
         )
         :effect (and
             (holding Agent ?G)
         )
    )
    
    (:action PickUpBroom
         :parameters (?B - broom ?L - location)
         :precondition (and
             (at Agent ?L)
             (at ?B ?L)
             (not (exists (?i - item) (holding Agent ?i)))
             
         )
         :effect (and
             (holding Agent ?B)
         )
    )
    
    (:action HandOver
         :parameters (?G - glass ?C - customer ?L - location)
         :precondition (and
             (at Agent ?L)
             (at ?C ?L)
             (holding Agent ?G)
             (not (empty ?G))
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
             (not (exists (?b - brokenGlass) (at ?b ?to)))
         )
         :effect (and
             (at Agent ?to)
             (not (at Agent ?from))

         )
    )
    
    (:action SweepUp
         :parameters (?broken - brokenGlass ?locGlass - location ?locAgent - location)
         :precondition (and
             (at ?broken ?locGlass)
             (at Agent ?locAgent)
             (adjacent ?locGlass ?locAgent)
             (exists (?br - broom) (holding Agent ?br))
             (not (exists (?x - glass) (holding Agent ?x)))
         )
         :effect (and
             (not (at ?broken ?locGlass))
             
         )
    )
    
    (:action PutDown
         :parameters (?i - item ?locItem - location)
         :precondition (and
             (holding Agent ?i)
             (at Agent ?locItem)
         )
         :effect (and
             (not (holding Agent ?i))
             (at ?i ?locItem)
         )
    )
)