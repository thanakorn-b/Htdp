;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exe-140) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
; A list-of-boolean is one of:
; -- '()
; -- (cons Boolean list-of-boolean)

(define ex1 '())
(define ex2 (cons #true '()))
(define ex3 (cons #false '()))
(define ex4 (cons #true (cons #true '())))
(define ex5 (cons #true (cons #false '())))

; lob -> Boolean
; check all of boolean in list is true
(check-expect (all-true ex1) #true)
(check-expect (all-true ex2) #true)
(check-expect (all-true ex3) #false)
(check-expect (all-true ex4) #true)
(check-expect (all-true ex5) #false)

(define (all-true lob)
  (cond
    [(empty? lob) #true]
    [else (and (first lob) (all-true (rest lob)))]))

; lob -> Boolean
; check all of boolean in list has one true
(check-expect (one-true '()) #false)
(check-expect (one-true (cons #true '())) #true)
(check-expect (one-true (cons #true (cons #true '()))) #true)
(check-expect (one-true (cons #false '())) #false)
(check-expect (one-true (cons #false (cons #false '()))) #false)
(check-expect (one-true (cons #true (cons #false '()))) #true)
(check-expect (one-true (cons #false (cons #true '()))) #true)

(define (one-true lob)
  (cond
    [(empty? lob) #false]
    [else (or (first lob) (one-true (rest lob)))]))
