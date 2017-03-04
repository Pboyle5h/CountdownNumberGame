#lang racket
;list of numbers to use to try get to the expected number 
(define l(list 1 2 3 4 5 6 2))
;The expected nimber we are going to try get close to 
(define Expected 5)
;list of the different operators that can be used in the game.
(define ops (list + * - /))

;The plus function that takes the combinations of the list and adds them together 
(define (plus l) 
  (+ (car l) (cadr l)))

(map plus(combinations l 2))

