;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exe-61) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(require 2htdp/universe)

; An N-TrafficLight is one of:
; -- 0 interpretation the traffic light shows red
; -- 1 interpretation the traffic light shows green
; -- 2 interpretation the traffic light shows yellow

(define RED 0)
(define GREEN 1)
(define YELLOW 2)
; An S-TrafficLight is one of:
; -- RED
; -- GREEN
; -- YELLOW

(define BULB-RADIUS 30)

; ws -> imgMode
; cal img mode to return compare to ws
(define (mode ws ews)
  (if (string=? ews ws) "solid" "outline"))

; ws -> string
; change ws to string color
(define (ws2string ws)
  (cond
    [(= 0 ws) "red"]
    [(= 1 ws) "green"]
    [(= 2 ws) "yellow"]))

; N-TrafficLight -> N-TrafficLight
; yields the next state, given current state cs

(check-expect (tl-next-numeric 0) 1)
(check-expect (tl-next-numeric 1) 2)
(check-expect (tl-next-numeric 2) 0)

(define (tl-next-numeric cs) (modulo (+ cs 1) 3))
 
; TrafficLight -> Image
; renders the current state cs as an image

(check-expect (tl-render RED)
              (beside (circle BULB-RADIUS "solid" "red")
                      (circle BULB-RADIUS "outline" "yellow")
                      (circle BULB-RADIUS "outline" "green")))

(define (tl-render current-state)
  (beside
   (circle BULB-RADIUS (mode (ws2string current-state) "red") "red")
   (circle BULB-RADIUS (mode (ws2string current-state) "yellow") "yellow")
   (circle BULB-RADIUS (mode (ws2string current-state) "green") "green")))

; TrafficLight -> TrafficLight
; simulates a clock-based American traffic light
(define (traffic-light-simulation initial-state)
  (big-bang initial-state
    [to-draw tl-render]
    [on-tick tl-next-numeric 1]
    ))

(traffic-light-simulation 0)


