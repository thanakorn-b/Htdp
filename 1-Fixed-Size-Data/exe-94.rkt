;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exe-94) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(define HEIGHT 200)
(define CANVAS (empty-scene HEIGHT HEIGHT))

(define UFO-HEIGHT 10)
(define UFO-WIDTH (* 2 UFO-HEIGHT))
(define UFO-IMAGE (overlay
                   (circle (/ UFO-HEIGHT 2) "solid" "palegreen")
                   (ellipse UFO-WIDTH (/ UFO-HEIGHT 2) "solid" "green")))
(define UFO-SPEED 2)
(define UFO-JUMP-MAX 10)

(define TANK-HEIGHT 8)
(define TANK-WIDTH (* 2 TANK-HEIGHT))
(define TANK-Y (- HEIGHT (/ TANK-HEIGHT 2)))
(define TANK-IMAGE (rectangle TANK-WIDTH TANK-HEIGHT "solid" "midnightblue"))
(define TANK-SPEED 10)

(define MISSILE-IMAGE (triangle 5 "solid" "black"))
(define MISSILE-SPEED 2)

(place-image TANK-IMAGE 28 TANK-Y (place-image UFO-IMAGE 10 20 CANVAS))