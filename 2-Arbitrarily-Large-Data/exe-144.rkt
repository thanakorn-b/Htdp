;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exe-144) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
; A List-of-temperatures is one of:
; – '()
; – (cons CTemperature List-of-temperatures)

; A CTemperature is a Number greater than -272.

; An NEList-of-temperatures is one of:
; -- (cons CTemperature '())
; -- (cons CTemperature NEList-of-temperatures)
; interpretation non-empty lists of Celsius temperatures

; (define ERR-MSG "checked-average expects not empty List-of-temperatures")
(define LIST1 (cons 1 (cons 2 (cons 3 '()))))

; NEList-of-temperatures -> Number
; compute the average tempurature
(check-expect (checked-average LIST1) 2)
;(check-error (checked-average '()) ERR-MSG)
(define (checked-average lot)
  (cond
    [(eq? '() lot) (error ERR-MSG)]
    [else (/ (sum lot) (count lot))]))

; NEList-of-temperatures -> Number
; summary temperature in list
(check-expect (sum LIST1) 6)
(define (sum lot)
  (cond
    [(empty? lot) 0]
    [else (+ (first lot) (sum (rest lot)))]))

; NEList-of-temperatures -> Number
; count number temp. in list
(check-expect (count LIST1) 3)
(define (count lot)
  (cond
    [(empty? lot) 0]
    [else (+ 1 (count (rest lot)))]))

; Ans: Yes, It's will work, Because NEList-of-temperatures is subset of List-of-temperatures
; List-of-temperatures is bigger and it's work.