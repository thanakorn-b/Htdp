;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exe-56) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(require 2htdp/universe)

; step 1: stage declare variable
(define HEIGHT 300) ; distances in pixels
(define WIDTH 100)
(define YDELTA 3)
(define BACKG (empty-scene WIDTH HEIGHT))
(define ROCKET (rectangle 5 30 "solid" "red"))

(define CENTER (/ (image-height ROCKET) 2))

(define ROCKET-CENTER (- HEIGHT CENTER))

; step 2: stage declare world state
; An LRCD (for launching rocket countdown) is one of:
; -- "resting"
; -- a Number between -3 and -1
; -- a NonnegativeNumber
; interpretation a grounded rocket, in countdown mode,
; a number denotes the number of pixels between the
; top of the canvas and the rocket (its height)

; step 3: stage define fuctions

; LRCD -> Image
; renders the state as a resting or flying rocket
; (define (show x)
; BACKG)
; step 4: stage implement to correct test
(define (show x)
  (cond
    [(string? x)
     (place-image ROCKET 10 ROCKET-CENTER BACKG)]
    [(<= -3 x -1)
     (place-image (text (number->string x) 20 "red")
                  10 (* 3/4 WIDTH)
                  (place-image ROCKET
                               10 ROCKET-CENTER
                               BACKG))]
    [(>= x 0)
     (place-image ROCKET 10 (- x CENTER) BACKG)]))



; LRCD KeyEvent -> LRCD
; starts the countdown when space bar is pressed,
; if the rocket is still resting
;(define (launch x ke)
;x)

;(define (launch x ke)
;(cond
;[(string? x) ...]
;[(<= -3 x -1) ...]
;[(>= x 0) ...]))

(define (launch x ke)
(cond
[(string? x) (if (string=? " " ke) -3 x)]
[(<= -3 x -1) x]
[(>= x 0) x]))

; LRCD -> LRCD
; raises the rocket by YDELTA,
; if it is moving already
;(define (fly x)
;x)

; step 4: stage add test case for functions

(check-expect
 (show "resting")
 (place-image ROCKET 10 ROCKET-CENTER BACKG))

(check-expect
(show HEIGHT)
(place-image ROCKET 10 ROCKET-CENTER BACKG))
 
(check-expect
 (show -2)
 (place-image (text "-2" 20 "red")
              10 (* 3/4 WIDTH)
              (place-image ROCKET 10 ROCKET-CENTER BACKG)))
 
(check-expect
 (show 53)
 (place-image ROCKET 10 (- 53 CENTER) BACKG))

(check-expect (launch "resting" " ") -3)
(check-expect (launch "resting" "a") "resting")
(check-expect (launch -3 " ") -3)
(check-expect (launch -1 " ") -1)
(check-expect (launch 33 " ") 33)
(check-expect (launch 33 "a") 33)

; LRCD -> LRCD
(define (main1 s)
(big-bang s
[to-draw show]
[on-key launch]))

; LRCD -> LRCD
; raises the rocket by YDELTA if it is moving already 
 
(check-expect (fly "resting") "resting")
(check-expect (fly -3) -2)
(check-expect (fly -2) -1)
(check-expect (fly -1) HEIGHT)
(check-expect (fly 10) (- 10 YDELTA))
(check-expect (fly 22) (- 22 YDELTA))
 
(define (fly x)
  (cond
    [(string? x) x]
    [(<= -3 x -1) (if (= x -1) HEIGHT (+ x 1))]
    [(>= x 0) (- x YDELTA)]))

; LRCH -> Boolean
; stop stage when rockey out of sight

(check-expect (end? "resting") #false)
(check-expect (end? -3) #false)
(check-expect (end? -1) #false)
(check-expect (end? 10) #false)
(check-expect (end? 50) #false)
(check-expect (end? 0) #true)

(define (end? s)
  (if (and (number? s) (= s 0)) #true #false))


(define (main2 s)
  (big-bang s
    [to-draw show]
    [on-key launch]
    [on-tick fly]
    [stop-when end?]))

(main2 "resting")
