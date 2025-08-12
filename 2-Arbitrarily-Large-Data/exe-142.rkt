;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exe-142) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
; ImageOrFalse is one of:
; – Image
; – #false

; list-of-iof is one of:
; - '()
; - (cons ImageOrFalse list-of-iof)

; loi number -> ImageOrFalse
; take a list of image or false and number to find a first image that not a square with width that number
; if not find return false

(check-expect (ill-sized? '() 69) #false)
(check-expect (ill-sized? (cons #false '()) 69) #false)
(check-expect (ill-sized? (cons (square 69 "solid" "red") '()) 69) #false)
(check-expect (ill-sized? (cons (square 2 "solid" "red") '()) 69) (square 2 "solid" "red"))
(check-expect (ill-sized? (cons (square 3 "solid" "blue") (cons (square 2 "solid" "green") '())) 3) (square 2 "solid" "green"))

(define (ill-sized? loi n)
  (cond
    [(empty? loi) #false]
    [(false? (first loi)) (ill-sized? (rest loi) n)]
    [(and (= (image-width (first loi)) n) (= (image-height (first loi)) n))  (ill-sized? (rest loi) n)]
    [else (first loi)]))