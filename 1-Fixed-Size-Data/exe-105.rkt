;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exe-105) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
; A Coordinate is one of:
; -- a NegativeNumber
; interpretation on the y axis, distance from top
; -- a PositiveNumber
; interpretation on the x axis, distance from left
; -- a Posn
; interpretation an ordinary Cartesian point


-1
-2

1
2

(make-posn 1 2)
(make-posn 4 3)
