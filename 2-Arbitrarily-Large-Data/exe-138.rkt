;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exe-138) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
; A List-of-amounts is one of:
; -- '()
; -- (cons PositiveNumber List-of-amounts)

(define ex1 '())
(define ex2 (cons 2 '()))
(define ex3 (cons 5 (cons 1 '())))

; Loa -> Number
; summary number in list of amounts
(check-expect (sum ex1) 0)
(check-expect (sum ex2) 2)
(check-expect (sum ex3) 6)
(define (sum loa)
  (cond
    [(empty? loa) 0]
    [else (
           + (first loa) (sum (rest loa)))]))