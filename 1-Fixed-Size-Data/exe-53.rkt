;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exe-53) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(define HEIGHT 300) ; distances in pixels
(define WIDTH 100)
(define YDELTA 3)
(define BACKG (empty-scene WIDTH HEIGHT))
(define ROCKET (rectangle 5 30 "solid" "red"))

(define CENTER (/ (image-height ROCKET) 2))

; An LRCD (for launching rocket countdown) is one of:
; -- "resting"
; -- a Number between -3 and -1
; -- a NonnegativeNumber
; interpretation a grounded rocket, in countdown mode,
; a number denotes the number of pixels between the
; top of the canvas and the rocket (its height)

; resting and counting
(place-image ROCKET (/ WIDTH 2) (- HEIGHT CENTER) BACKG)

; Nonnegative number
(place-image ROCKET (/ WIDTH 2) (- HEIGHT CENTER 1) BACKG)

(place-image ROCKET (/ WIDTH 2) (- HEIGHT CENTER 99) BACKG)