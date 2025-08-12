;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exe-126) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(define-struct point [x y z])
(define-struct none [])

(make-point 1 2 3) ; value structure point
(make-point (make-point 1 2 3) 4 5) ;value structure point
(make-point (+ 1 2) 3 4) ; value structure point
(make-none) ; value structure none
(make-point (point-x (make-point 1 2 3)) 4 5) ; value structure point