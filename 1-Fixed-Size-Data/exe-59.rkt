;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exe-59) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(require 2htdp/universe)

; TrafficLight is interpresentation of string values with
; -- "red"
; -- "yellow"
; -- "green"

; imgMode is interpresentation of string values with
; -- "outline"
; -- "solid"

(define BULB-RADIUS 30)

; ws -> imgMode
; cal img mode to return compare to ws
(define (mode ws ews)
  (if (string=? ews ws) "solid" "outline"))

; TrafficLight -> TrafficLight
; yields the next state, given current state cs
(define (tl-next cs) cs)
 
; TrafficLight -> Image
; renders the current state cs as an image

(check-expect (tl-render "red")
              (beside (circle BULB-RADIUS "solid" "red")
                      (circle BULB-RADIUS "outline" "yellow")
                      (circle BULB-RADIUS "outline" "green")))

(define (tl-render current-state)
  (beside
   (circle BULB-RADIUS (mode current-state "red") "red")
   (circle BULB-RADIUS (mode current-state "yellow") "yellow")
   (circle BULB-RADIUS (mode current-state "green") "green")))

; TrafficLight -> TrafficLight
; simulates a clock-based American traffic light
(define (traffic-light-simulation initial-state)
  (big-bang initial-state
    [to-draw tl-render]
    [on-tick tl-next 1]))

