;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exe-51) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(require 2htdp/universe)
; A TrafficLight is one of the following Strings:
; -- "red"
; -- "green"
; -- "yellow"
; interpretation the three strings represent the three
; possible states that a traffic light may assume

; TrafficLight -> TrafficLight
; yields the next state given current state s
(check-expect (traffic-light-next "red") "green")
(check-expect (traffic-light-next "green") "yellow")
(check-expect (traffic-light-next "yellow") "red")
(define (traffic-light-next s)
(cond
[(string=? "red" s) "green"]
[(string=? "green" s) "yellow"]
[(string=? "yellow" s) "red"]))

; tfl -> image
; take stage to render tfl
(check-expect (render "red") (beside (circle 20 "solid" "red") (circle 20 "outline" "yellow") (circle 20 "outline" "green")))
(check-expect (render "yellow") (beside (circle 20 "outline" "red") (circle 20 "solid" "yellow") (circle 20 "outline" "green")))
(check-expect (render "green") (beside (circle 20 "outline" "red") (circle 20 "outline" "yellow") (circle 20 "solid" "green")))
(define (render s)
  (beside
   (circle 20 (if (string=? "red" s) "solid" "outline") "red")
   (circle 20 (if (string=? "yellow" s) "solid" "outline") "yellow")
   (circle 20 (if (string=? "green" s) "solid" "outline") "green")))

(define (main s)
  (big-bang s
    [on-tick traffic-light-next 1]
    [to-draw render]))

(main "red")