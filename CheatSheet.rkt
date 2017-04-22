#lang racket
(define l (list 1 2 3 4 5))
(define i (list 1 3 5))
;first gives the first element of the list 
(first l)
(car l)
;rest gives everything bar the first element 
(rest l)
(cdr l)


;checks if the list l is empty or not 
(null? '(l))

;use ' to stop it from being evaluated
'(+ 1 2)
(+ 1 2 )

;define variables 
(define some-var 5)
some-var

;; Test for existence with `set-member?' so if 1 is in the set then give back true 
(set-member? (set 1 2 3) 1)

;The plus function that takes the combinations of the list and adds them together 
(define (plus posList) 
  (+ (car posList) (cadr posList)))
(map plus(combinations posList 2))

;References:
;https://learnxinyminutes.com/docs/racket/
;https://www.youtube.com/watch?v=ing4IKLW4rU