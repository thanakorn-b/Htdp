;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exe-139) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
; A List-of-numbers is one of:
; -- '()
; -- (cons Number List-of-numbers)

(define ex1 (cons 5 '()))
(define ex2 (cons -1 '()))

; Lon -> Boolean
; check all in list is positive number
(check-expect (pos? ex1) #true)
(check-expect (pos? ex2) #false)

(define (pos? lon)
  (cond
    [(empty? lon) #true]
    [else (and (> (first lon) 0) (pos? (rest lon)))]))

(define ERROR-MESSAGE "checked-sum expects a list of non-negative numbers")

; Lon -> Number
; check list of numbers that positive than it is a List of amounts that can sum result
(check-error (check-sum ex2) ERROR-MESSAGE)
(check-expect (check-sum ex1) 5)
(define (check-sum lon)
  (cond
    [(empty? lon) 0]
    [(< (first lon) 0) (error ERROR-MESSAGE)]
    [else (+ (first lon) (check-sum (rest lon)))]))

; Loa -> Number
; summary number in list of amounts
(define (sum loa)
  (cond
    [(empty? loa) 0]
    [else (
           + (first loa) (sum (rest loa)))]))

(sum ex2)