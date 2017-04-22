#lang racket
;list of numbers to use to try get to the expected number 
(define posList(list 1 1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 9 9 10 10 25 50 75 100))

;The expected number we are going to try get close to randomly genertated: 
(define (rand) (random 101 999))
(define Expected (rand))
Expected
;list of the different operators that can be used in the game.
(define ops (list + * - /))


;The plus function that takes the combinations of the list and adds them together 
(define (plus posList) 
  (+ (car posList) (cadr posList)))
(map plus(combinations posList 2))


