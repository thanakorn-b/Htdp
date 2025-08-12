;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exe-39-) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(require 2htdp/universe)


(define WHEEL-RADIUS 5)
(define WHEEL-DIA (* WHEEL-RADIUS 2))

(define WHEEL
  (circle WHEEL-RADIUS "solid" "black"))
(define TWO-WHEELS
  (underlay/offset WHEEL (* WHEEL-DIA 2) 0 WHEEL))

(define CAR-BOT (rectangle (* 4 WHEEL-DIA)  WHEEL-DIA "solid" "red"))
(define CAR-TOP (rectangle (* 2 WHEEL-DIA)  WHEEL-DIA "solid" "red"))

(define CAR-BODY (underlay/offset CAR-TOP 0 WHEEL-DIA CAR-BOT))
(define CAR (underlay/offset CAR-BODY 0 WHEEL-DIA TWO-WHEELS))

(define BG-H (* 2 (image-height CAR)))
(define BG-W (* (image-width CAR) 8))

(define TREE
  (underlay/offset (circle WHEEL-DIA "solid" "green")
               0 WHEEL-DIA
               (rectangle (/ WHEEL-RADIUS 2) (* WHEEL-RADIUS 3) "solid" "brown")))


(define START-POINT (- (/ (image-width CAR) 2)))

; exe-41
(define BG
  (place-image TREE (/ BG-W 2) (- BG-H (/ (image-height TREE) 2)) (empty-scene BG-W BG-H)))

(define Y-CAR (- BG-H (/ (image-height CAR) 2)))

; A WorldState is a Number.
; interpretation the number of pixels between
; the left border of the scene and the car

; WorldState -> WorldState
; launches the program from some initial state 
(define (main ws)
   (big-bang ws
     [on-tick tock]
     [on-mouse hyper]
     [to-draw render]))

; exe-40
; WorldState -> Image
; places the car into the BACKGROUND scene,
; according to the given world state 
 (define (render cw)
   (place-image CAR cw Y-CAR BG))
(check-expect (render 200) (place-image CAR 200 Y-CAR BG))

; exe-39
; WorldState -> WorldState 
; moves the car by 3 pixels for every clock tick
; examples: 
;   given: 20, expect 23
;   given: 78, expect 81
(define (tock cw)
  (+ cw 3))

; exe-43
; WorldState Number Number String -> WorldState
; places the car at x-mouse
; if the given me is "button-down" 
; given: 21 10 20 "enter"
; wanted: 21
 (check-expect (hyper 21 10 20 "enter") 21)
; given: 42 10 20 "button-down"
; wanted: 10
  (check-expect (hyper 42 10 20 "button-down") 10)
; given: 42 10 20 "move"
; wanted: 42
   (check-expect (hyper 42 10 20 "move") 42)
(define (hyper x-position-of-car x-mouse y-mouse me)
  (cond
    [(string=? "button-down" me) x-mouse]
    [else x-position-of-car]))

(main START-POINT)
