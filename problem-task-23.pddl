(define (problem bar-23) ;; Replace XX with task number
    (:domain bartending)
    (:objects 
         G1 - glass
         G2 - glass
         C1 - customer
         C2 - customer
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
        (at Agent MF)
        (at G1 MB)
        (empty G1)
        (at G2 LB)
        (empty G2)
        (at C1 UB)
        (at C2 LF)
    )
    
    (:goal (and 
        (served C1)
        (served C2)
        (at Agent BAR)
    ))
)