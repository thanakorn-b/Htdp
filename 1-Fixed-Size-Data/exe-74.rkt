;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exe-74) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(require 2htdp/universe)

(define BG (empty-scene 50 50))
(define DOT (circle 2 "solid" "red"))

; Posn Number Number MouseEvt -> Posn
; for mouse clicks, (make-posn x y); otherwise p

(check-expect
(reset-dot (make-posn 10 20) 29 31 "button-down")
(make-posn 29 31))
(check-expect
(reset-dot (make-posn 10 20) 29 31 "button-up")
(make-posn 10 20))

(define (reset-dot p x y me)
(cond
[(mouse=? me "button-down") (make-posn x y)]
[else p]))

; Posn -> image
; draw dot in BG

(check-expect (render (make-posn 10 20)) (place-image DOT 10 20 BG))

(check-expect (render (make-posn 29 31)) (place-image DOT 29 31 BG))

(define (render p)
  (place-image DOT (posn-x p) (posn-y p) BG))

(define (main p)
  (big-bang p
      [to-draw render]
    [on-mouse reset-dot]))

(main (make-posn 10 20))