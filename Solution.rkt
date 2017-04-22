#lang racket
;list of numbers to use to try get to the expected number 
(define posList(list 2 3 10 25 50 100))

;The expected number we are going to try get close to randomly genertated: 
(define (rand) (random 101 999))
(define Expected (rand))
Expected

;list of the different operators that can be used in the game.
(define ops (list '+ '* '- '/))

(define numPerm (permutations posList))
(define combined(append ops (list numPerm)))
;(append-map combined numPerm)


;This our original list to create reverse polish notation -1 will represent operators
;and 1 will represent numbers. It doesnt have two -1's and one 1 because for valid
;reverse polish notaion it needs to start with two nummbers and end with an operator
(define start-perm (list -1 -1 -1 -1 1 1 1 1))

;This line creates all permutations of the original RPN list and it removes the duplicates 
(define perms (remove-duplicates (permutations start-perm)))

;This function adds the two 1s to the front of the list and the -1 to the end of the list 
(define (make-rpn l)
  (append (list 1 1) l (list -1)))

(make-rpn (car  perms))
; adds 1 1 to start of all permutations and adds -1 to the end of all permutations
;define new list called perm list which gets passed to the validRpn? function 
(define permList (map make-rpn perms))

;expression is a list we pass to valid-rpn? 
(define (valid-rpn? expression [stack 0][valid'()]) ;create a list inside brackets because they need to be the same size [] when called in map
  ;if expression is a null list call the first if else call the secon
  (if (null? expression)
      ;if stack has one value on the list then return the list otherwise return false
      (if (= stack 1)
          valid;replace this with a list 
          #f)
      ;if the first value in expression is a 1 then call the first line otherwise call the second which starts recurision
      (if (= (car expression) 1)
          (valid-rpn? (cdr expression) (+ 1 stack)(append valid (list (car expression)))) ;appends first value in expression the list valid list
          (valid-rpn? (cdr expression) (- 1 stack)(append valid (list (car expression)))) ;appends first value in expression the list valid list
          )))
;defines valid list which will be populated with the valid rpns
(define validList(map valid-rpn? permList))

(filter identity validList)


