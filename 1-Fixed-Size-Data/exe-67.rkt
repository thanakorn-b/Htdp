;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exe-67) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(define SPEED 3)
(define-struct balld [location direction])
(make-balld 10 "up")

;; Answer.
;; 1. Constant SPEED is defined but not used in the given code fragment.
;; 2. Struct balld is defined with two parameters: location and direction.
;; 3. A new istance of the struct balld is created
;;    by calling a constructor make-balld
;;    with parameters 10 (location) and "up" (direction).


;; Instance 1.
(check-expect (balld-location new-balld1) 5)
(define new-balld1 (make-balld 5 "down"))

;; Instance 2.
(check-expect (balld-direction new-balld2) "down")
(define new-balld2 (make-balld 20 "down"))

;; Instance 3.
(check-expect (balld? new-balld3) #true)
(define new-balld3 (make-balld 100 "up"))
