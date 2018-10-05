(define (problem bar-22) ;; Replace XX with task number
    (:domain bartending)
    (:objects 
         G - glass
         C - customer
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
        (at G BAR)
        (empty G)
        (at C LB)
        
    )
    
    (:goal (and 
        (served C)
    ))
)