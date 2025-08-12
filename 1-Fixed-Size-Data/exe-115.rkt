;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exe-115) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
; TrafficLight TrafficLight -> Boolean
; are the two (states of) traffic lights equal
(check-expect (light=? "red" "red") #true)
(check-expect (light=? "red" "green") #false)
(check-expect (light=? "green" "green") #true)
(check-expect (light=? "yellow" "yellow") #true)

;(define (light=? a-value another-value)
;(string=? a-value another-value))



; Any -> Boolean
; is the given value an element of TrafficLight
(define (light? x)
  (cond
    [(string? x) (or (string=? "red" x)
                     (string=? "green" x)
                     (string=? "yellow" x))]
    [else #false]))

(define MESSAGE
  "traffic light expected, given some other value")
 
; Any Any -> Boolean
; are the two values elements of TrafficLight and, 
; if so, are they equal
 
(check-expect (light=? "red" "red") #true)
(check-expect (light=? "red" "green") #false)
(check-expect (light=? "green" "green") #true)
(check-expect (light=? "yellow" "yellow") #true)
 
(define (light=? a-value another-value)
  (cond
    [(and (light? a-value) (light? another-value)) (string=? a-value another-value)]
    [(and (false? (light? a-value)) (light? another-value)) (error "first argument isn't traffic light")]
    [(and (false? (light? another-value)) (light? a-value)) (error "second argument isn't traffic light")]
    [else (error "Please entertraffic light ")]
    ))

(light=? "red" "red")
(light=? "red" 10)
(light=? 10 "green")
(light=? 20 10)