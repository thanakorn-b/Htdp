;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exe-113) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))

; A UFO is a Posn.
; interpretation (make-posn x y) is the UFO's location
; (using the top-down, left-to-right convention)

(define-struct tank [loc vel])
; A Tank is a structure:
;   (make-tank Number Number).
; interpretation (make-tank x dx) specifies the position:
; (x, HEIGHT) and the tank's speed: dx pixels/tick

; A Missile is a Posn.
; interpretation (make-posn x y) is the missile's place

(define-struct aim [ufo tank])
(define-struct fired [ufo tank missile])

; A SIGS is one of:
; – (make-aim UFO Tank)
; – (make-fired UFO Tank Missile)
; interpretation represents the complete state of a
; space invader game

; Any -> bool
; check input is sigs

(check-expect (check-sigs #false) #false)
(check-expect (check-sigs #true) #false)
(check-expect (check-sigs (make-aim (make-posn 1 2) (make-tank 3 4))) #true)
(check-expect (check-sigs (make-fired (make-posn 1 2) (make-tank 3 4) (make-posn 5 6))) #true)

(define (check-sigs s)
  (cond
    [(aim? s) #true]
    [(fired? s) #true]
    [else #false]))

; A Coordinate is one of:
; – a NegativeNumber
; interpretation on the y axis, distance from top
; – a PositiveNumber
; interpretation on the x axis, distance from left
; – a Posn
; interpretation an ordinary Cartesian point

; Any -> bool
; check input is coordinate

(check-expect (check-coor "") #false)
(check-expect (check-coor -1) #true)
(check-expect (check-coor 1) #true)
(check-expect (check-coor (make-posn 1 2)) #true)

(define (check-coor c)
  (or (number? c) (posn? c)))


(define-struct vCat [x score])
;; A VCat is a structure:
;; (make-vCat Number Score)
;; (make-vCat x s) represents a walking cat
;; which is located on an x-coordinate x and
;; has a happiness level s.

(define-struct vCham [x color score])
;; A VCham is a structure:
;; (make-vCham Number Color Score)
;; (make-vCham x c s) represents a walking cham
;; which is located on an x-coordinate x,
;; has a color c, and
;; a happiness level s.

; A VAnimal is either
; – a VCat
; – a VCham

(check-expect (check-vanimal #true) #false)
(check-expect (check-vanimal (make-vCat 1 2)) #true)
(check-expect (check-vanimal (make-vCham 1 "red" 2)) #true)

(define (check-vanimal a)
  (or (vCat? a) (vCham? a)))
