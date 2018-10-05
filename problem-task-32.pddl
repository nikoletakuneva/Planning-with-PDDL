(define (problem bar-32) ;; Replace XX with task number
    (:domain bartending)
    (:objects 
         G - glass
         BG1 - brokenGlass
         BG2 - brokenGlass
         C - customer
         B - broom
         UF - location
         MF - location
         LF - location
         UB - location
         MB - location
         LB - location
    )
    
    (:init
        (adjacent UF BAR)
        (adjacent UF UB)
        (adjacent UF MF)
        (adjacent UB MB)
        (adjacent MB LB)
        (adjacent LB LF)
        (adjacent MF LF)
        (adjacent BAR UF)
        (adjacent UB UF)
        (adjacent MF UF)
        (adjacent MB UB)
        (adjacent LB MB)
        (adjacent LF LB)
        (adjacent LF MF)
        (at Agent BAR)
        (at C LB)
        (at G BAR)
        (empty G)
        (at B BAR)
        (at BG1 MF)
        (at BG2 MB)
    )
    
    (:goal (and 
        (forall (?c - customer) (served ?c))
        (at Agent BAR)
        (forall (?l - location) (not (exists (?x - brokenGlass) (at ?x ?l))))
    ))
)