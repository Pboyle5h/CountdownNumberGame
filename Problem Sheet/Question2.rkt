#lang racket
;Question 2  Define a procedure that takes two arguments: an intem's initial price and a percentage discount.
;It should return the new price
 
(define (discount x y) (- x (* x(/ y 100))))
(discount 10 5)
(discount 29.90 50)