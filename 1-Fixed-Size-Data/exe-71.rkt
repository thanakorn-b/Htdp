;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exe-71) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
; distances in terms of pixels:
(define HEIGHT 200)
(define MIDDLE (quotient HEIGHT 2))
; (define MIDDLE (quotient 200 2))
; (define MIDDLE 100)
(define WIDTH 400)
(define CENTER (quotient WIDTH 2))
; (define CENTER (quotient 400 2))
; (define CENTER 200)
(define-struct game [left-player right-player ball])
(define game0
  (make-game MIDDLE MIDDLE (make-posn CENTER CENTER)))
;(define game0
;  (make-game 100 MIDDLE (make-posn CENTER CENTER)))

;(define game0
;  (make-game 100 100 (make-posn CENTER CENTER)))

;(define game0
;  (make-game 100 100 (make-posn 200 CENTER)))

;(define game0
;  (make-game 100 100 (make-posn 200 200)))

(game-ball game0)
; (game-ball (make-game 100 100 (make-posn 200 200)))

; law of game-ball
; (make-posn 200 200)
(posn? (game-ball game0))
; (posn? (game-ball (make-game 100 100 (make-posn 200 200)))
; (posn? (make-posn 200 200))
; #true
(game-left-player game0)
; (game-left-player (make-game 100 100 (make-posn 200 200)))

; law of game-left-player
; 100
