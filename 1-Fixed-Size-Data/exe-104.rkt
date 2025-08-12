;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exe-104) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(define-struct vehicle [capacity license consumption])
; A vehicle is a struct
; (make-vehicle number number number)
; intepretation of (make-vehicle c l csp)
; which c is capacity for maximuium passengers that vehicle can carry
; l is license plate of vehicle
; csp is a consumption of fuel (miles per gallon)

; vehicle number -> bool
; receive vehicle and group of people and return that they can be in vehicle or not
(define (vehicle-enough? v p)
  (... (vehicle-capacity v) ... (vehicle-license v) ... (vehicle-consumption v) ... p ...))