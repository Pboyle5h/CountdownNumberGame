#lang racket
;Author: Pauri Boyle G00316554
;list of numbers to use to try get to the expected number 
(define posList(list 2 3 10 25 50 100))

;The expected number we are going to try get close to randomly genertated: 
(define (rand) (random 101 999))
(define Expected (rand))
Expected

;list of the different operators that can be used in the game.
(define ops (list '+ '* '- '/))

;This our original list to create reverse polish notation 1 will represent operators
;and -1 will represent numbers. It doesnt have two -1's and one 1 at the end because
;for valid reverse polish notaion it needs to start with two nummbers and end with an operator
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
;this filters out the #f from the list 
(define filteredList(filter identity validList))

;https://rosettacode.org/wiki/Parsing/RPN_calculator_algorithm#Racket
;This function was taken exactly as is from the above URL it hasnt been implemented
;due to time contraits and problems encountered it was meant to be addapted to take
;the resulting valid RPN and give me answers where i would then check to see if they're right 
(define (calculate-RPN expr)
  (for/fold ([stack '()]) ([token expr])
    (printf "~a\t -> ~a~N" token stack)
    (match* (token stack)
     [((? number? n) s) (cons n s)]
     [('+ (list x y s ___)) (cons (+ x y) s)]
     [('- (list x y s ___)) (cons (- y x) s)]
     [('* (list x y s ___)) (cons (* x y) s)]
     [('/ (list x y s ___)) (cons (/ y x) s)]
     [('^ (list x y s ___)) (cons (expt y x) s)]
     [(x s) (error "calculate-RPN: Cannot calculate the expression:" 
                   (reverse (cons x s)))])))

; this is used in a later function to pop numbers of a list 
(define (removeDups li test)
      remove '(li) test)
;This funtion takes two lists and has a stack to add values onto
;This function is used to change -1's to numbers and 1 to operators
;it is done by going through each element of li popping it off and adding it to the stack
;creating a cartesian product of each value 
(define (numSort li rpnType [stack'()])
  ;if the list is null do the first if not do the second 
  (if (null? li )
         stack
         ;if the value of rpn type is 1 then we do the first statment which appends the 
          (if(equal? rpnType 1)
             (if(pair? (flatten(car li)))
                (numSort (cdr li) rpnType (append (popOff li stack)stack))
                (numSort (cdr li) rpnType (append (cartesian-product (list(car li))(remove (car li) posList))stack)))
  (numSort (cdr li) rpnType (append (cartesian-product (list(flatten(car li)))ops)stack))))) 
;These functions are called to remove any or the numbers so that they are only used once 
(define (popOff li vals)
(define nums(flatten(car li)))
(define removeNums (removeDups nums posList))
(define cartNums (cartesian-product (list( car li))removeNums))cartNums)

;This function takes the list of 1's and -1's 
(define (generateRpn valid [stack'()])
  ;if the list is null 
  (if (null? valid)
          #t ;replace this with a function
          ;if stack is empty do the first one which send the posList the first 1 or -1 
          (if (empty? stack)
           ;recursevaly calling it self to go through all possibilities
          (generateRpn (cdr (cdr valid))(numSort posList (car valid))) 
          (generateRpn (cdr valid)(numSort stack(car valid)))))) 
          
;passing in a sigular list to check to see where i was going wrong
;ideally I would prefer to have this using map with the filtered list
(define test(generateRpn (list -1 -1 1 -1 1 -1 1 1 -1 -1 1) ))

