;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exe-101) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(require 2htdp/universe)

; A UFO is a Posn.
; interpretation (make-posn x y) is the UFO's location
; (using the top-down, left-to-right convention)

(define-struct tank [loc vel])
; A Tank is a structure:
; (make-tank Number Number).
; interpretation (make-tank x dx) specifies the position:
; (x, HEIGHT) and the tank's speed: dx pixels/tick

; A Missile is a Posn.
; interpretation (make-posn x y) is the missile's place

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


; A SIGS is one of:
; -- (make-aim UFO Tank)
; -- (make-fired UFO Tank Missile)
; interpretation represents the complete state of a
; space invader game
; first instance (make-aim UFO Tank) is when before tank is fire missile
; second instance  (make-fired UFO Tank Missile) is when tank fire and generate missile
  (define-struct aim [ufo tank])
(define-struct fired [ufo tank missile])

(define-struct sigs [ufo tank missile])
; A SIGS.v2 (short for SIGS version 2) is a structure:
; (make-sigs UFOTankMissileOrNot)
; interpretation represents the complete state of a
; space invader game
  
; A MissileOrNot is one of:
; -- #false
; -- Posn
; interpretation#false means the missile is in the tank;
; Posn says the missile is at that location


  ; SIGS -> Image
  ; adds TANK, UFO, and possibly MISSILE to
  ; the BACKGROUND scene
;  (define (si-render s)
;    (cond
;      [(aim? s) (tank-render (aim-tank s)
;                  (ufo-render (aim-ufo s) CANVAS))]
;      [(fired? s) (fired-render (fired-missile s) (tank-render (fired-tank s)
;                  (ufo-render (fired-ufo s) CANVAS)))]))
(define (si-render s)
  (missile-render.v2 (sigs-missile s) (tank-render (sigs-tank s)
                  (ufo-render (sigs-ufo s) CANVAS))))

(check-expect (si-render (make-sigs
  (make-posn 10 20)
  (make-tank 28 -3)
  #false))
              (place-image TANK-IMAGE 28 TANK-Y (place-image UFO-IMAGE 10 20 CANVAS)))

(check-expect (si-render
               (make-sigs
  (make-posn 20 100)
  (make-tank 100 3)
  (make-posn 22 103)))
              (place-image MISSILE-IMAGE 22 103 (place-image TANK-IMAGE 100 TANK-Y (place-image UFO-IMAGE 20 100 CANVAS))))

(check-expect (si-render
               (make-sigs
  (make-posn 10 20)
  (make-tank 28 -3)
  (make-posn 32 (- HEIGHT TANK-HEIGHT 10))))
              (place-image MISSILE-IMAGE 32 (- HEIGHT TANK-HEIGHT 10) (place-image TANK-IMAGE 28 TANK-Y (place-image UFO-IMAGE 10 20 CANVAS))))


; Tank Image -> Image 
; adds t to the given image im
(define (tank-render t im)
  (place-image TANK-IMAGE (tank-loc t) TANK-Y im))
 
; UFO Image -> Image 
; adds u to the given image im
(define (ufo-render u im)
  (place-image UFO-IMAGE (posn-x u) (posn-y u) im))

; Missile Image -> Image
; receive missile to render but check false or have
(define (missile-render.v2 m s)
(cond
      [(boolean? m) s]
      [(posn? m) (place-image MISSILE-IMAGE (posn-x m) (posn-y m) s)]))

; missile Image -> Image 
; adds m to the given image im
(define (fired-render m im)
  (place-image MISSILE-IMAGE (posn-x m) (posn-y m) im))

; SIGS -> bool
; stop when missile hit ufo or ufo landed
(define (si-game-over s)
  (or
   (ufo-landed? (sigs-ufo s))
   (if (posn? (sigs-missile s))
       (ufo-hit? (sigs-ufo s) (sigs-missile s))
       #false)))
;(define (si-game-over s)
;  (cond
;    [(aim? s) (ufo-landed? (aim-ufo s))]
;    [(fired? s) (
;                 or (ufo-landed? (fired-ufo s))
;                    (ufo-hit? (fired-ufo s) (fired-missile s)))]))

;(si-render (make-fired (make-posn 10 20) (make-tank 38 -3) (make-posn (+ 10 (/ (image-width UFO-IMAGE) 2)) (+ 20 (/ (image-height UFO-IMAGE) 2)))))

; ufo -> bool
; take ufo for calculate that it landed
(define (ufo-landed? ufo)
  (>= (posn-y ufo) (- HEIGHT (image-height UFO-IMAGE))))

; ufo missile -> bool
; check missile hit ufo or not
(define (ufo-hit? ufo missile)
  (and (<= (abs (- (posn-x ufo) (posn-x missile))) (/ (image-width UFO-IMAGE)2))
      (<= (abs (- (posn-y ufo) (posn-y missile))) (/ (image-height UFO-IMAGE)2))))

(ufo-hit? (make-posn 10 20) (make-posn (+ 11 (/ (image-width UFO-IMAGE) 2)) (+ 20 (/ (image-height UFO-IMAGE) 2))))

; SIGS -> Image
; render final stage of game that you win or lose
(define (si-render-final s)
  (overlay
   (text
    (if (ufo-landed? (sigs-ufo s)) "GAME OVER" "YOU WIN")
    26
    "blue") CANVAS)
  )

; SIGS -> SIGS
; move ufo and tank
(define (si-move s)
  (make-sigs
    (si-ufo-move (sigs-ufo s))
    (si-tank-move (sigs-tank s))
    (if (posn? (sigs-missile s)) (si-missile-move (sigs-missile s)) #false)))
;(define (si-move s)
;  (cond
;    [(aim? s) (make-aim (si-ufo-move (aim-ufo s)) (si-tank-move (aim-tank s)))]
;    [(fired? s) (make-fired (si-ufo-move (fired-ufo s)) (si-tank-move (fired-tank s)) (si-missile-move (fired-missile s)))]))

; UFO -> UFO
; move ufo
(define (si-ufo-move u)
  (make-posn
   (if (= (random 2) 0) (si-ufo-random-move (posn-x u)) (posn-x u))
   (+ (posn-y u) UFO-SPEED)))

; number -> number
; receive ufo x and plus with random number 1-10 tomove ufo to right or left axis
(define (si-ufo-random-move n)
  (if (= (random 2) 0) (+ n (+ 1 (random UFO-JUMP-MAX))) (- n (+ 1 (random UFO-JUMP-MAX)))))

; tank -> tank
; move tank
(define (si-tank-move t)
  (make-tank (+ (tank-loc t) (tank-vel t)) (tank-vel t)))

; missile -> missile
; move missile
(define (si-missile-move m)
  (make-posn (posn-x m) (- (posn-y m) MISSILE-SPEED)))

; SIGS KeyEvent -> SIGS
(define (si-control s ke)
  (cond
    [(or (string=? ke "right") (string=? ke "left"))
     (make-sigs (sigs-ufo s) (make-tank (tank-loc (sigs-tank s)) (tank-move ke)) (sigs-missile s))]
    [(string=? ke " ")
     (if (boolean? (sigs-missile s))
         (make-sigs (sigs-ufo s) (sigs-tank s) (make-posn (tank-loc (sigs-tank s)) (- HEIGHT TANK-HEIGHT))) 
         s)]))
;(define (si-control s ke)
;  (cond
;    [(or (string=? ke "right") (string=? ke "left"))
;     (if (aim? s) (make-aim (aim-ufo s) (make-tank (tank-loc (aim-tank s)) (tank-move ke)))
;         (make-fired (fired-ufo s) (make-tank (tank-loc (fired-tank s)) (tank-move ke)) (fired-missile s)))]
;    [(string=? ke " ")
;     (if (aim? s)
;     (make-fired (aim-ufo s) (aim-tank s) (make-posn (tank-loc (aim-tank s)) (- HEIGHT TANK-HEIGHT))) s)]))

; ke -> number
; receive key event to return velocity minus or plus
(define (tank-move ke)
  (cond
    [(string=? ke "right") TANK-SPEED]
    [(string=? ke "left") (- TANK-SPEED)]))

;; GameState -> GameState
;; Usage: (si-main INIT-STATE)
(define (si-main gs)
  (big-bang gs
    [to-draw si-render]
    [on-tick si-move 0.2]
    [on-key si-control]
;    [check-with game-state?] ; exercise 114
    [stop-when si-game-over si-render-final]
    ))


(si-main (make-sigs (make-posn (/ HEIGHT 2) 0) (make-tank (/ HEIGHT 2) TANK-SPEED) #false))