;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exe-81) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
; a TIME is a structure:
; (make-time Number Number Number)
; interpretation (make-time h m s)
; which h is hours, m is minutes, and s is seconds
(define-struct time [hh mm ss])

(define a (make-time 21 55 12))

; TIME -> seconds
; receive struct time to return seconds that the time pass at midnight

(check-expect (secondsPassMidnight (make-time 0 0 1)) 1)
(check-expect (secondsPassMidnight (make-time 0 1 1)) 61)
(check-expect (secondsPassMidnight (make-time 1 1 1)) 3661)

(define (secondsPassMidnight t)
  (+ (* (time-hh t) 3600) (* (time-mm t) 60) (time-ss t)))