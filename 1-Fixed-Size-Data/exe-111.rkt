;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exe-111) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(define-struct vec [x y])
; A vec is
; (make-vec PositiveNumber PositiveNumber)
; interpretation represents a velocity vector

; Any -> vec
; check vec before make vec with positive number
(define (check-make-vec p1 p2)
  (cond
    [(and (> p1 0) (> p2 0)) (make-vec p1 p2)]
    [else (error "check-make-vec: only positive number")]))

(check-make-vec 1 2)

(check-make-vec 1 0)