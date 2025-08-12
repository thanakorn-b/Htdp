;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exe-79) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
; A Color is one of:
; --- "white"
; --- "yellow"
; --- "orange"
; --- "green"
; --- "red"
; --- "blue"
; --- "black"

(define WHITE "white")

; H is a Number between 0 and 100.
; interpretation represents a happiness value

(define MIN 0)
(define MAX 0)

(define-struct person [fstname lstname male?])
; A Person is a structure:
; (make-person String String Boolean)

(define Thang (make-person "Thanakorn" "Boonyamanee" #true))

(define-struct dog [owner name age happiness])
; A Dog is a structure:
; (make-dog Person String PositiveInteger H)

(make-dog Thang "Bob" 99 MIN)

; A Weapon is one of:
; --- #false
; --- Posn
; interpretation #false means the missile hasn't
; been fired yet; a Posn means it is in flight


(define weapon1 #false)
(define weapon2 (make-posn 0 0))