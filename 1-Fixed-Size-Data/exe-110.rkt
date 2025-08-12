;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exe-110) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
; Number -> Number
; computes the area of a disk with radius r

(check-expect (area-of-disk 1) 3.14)
;(check-expect (area-of-disk -1) "please enter positive number")

(define (area-of-disk r)
  (if (> r 0) (* 3.14 (* r r)) (error "please enter positive number")))