;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exe-145) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
; A List-of-temperatures is one of:
; – '()
; – (cons CTemperature List-of-temperatures)

; A CTemperature is a Number greater than -272.

; An NEList-of-temperatures is one of:
; -- (cons CTemperature '())
; -- (cons CTemperature NEList-of-temperatures)
; interpretation non-empty lists of Celsius temperatures

(check-expect (sorted>? (cons 1 '())) #true)
(check-expect (sorted>? (cons 3 (cons 2 (cons 1 '())))) #true)
(check-expect (sorted>? (cons 1 (cons 2 (cons 3 '())))) #false)

; NEList-of-temperatures -> boolean
; check that NEList-of-temperatures is already sorted desc return #true else is #false
(define (sorted>? nel)
  (cond
    [(empty? (rest nel)) #true]
    [else (and (> (first nel) (first (rest nel))) (sorted>? (rest nel)))]))

