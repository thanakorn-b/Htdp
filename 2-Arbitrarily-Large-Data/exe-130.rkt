;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exe-130) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
; A 3LON is a list of three numbers:
; (cons Number (cons Number (cons Number '())))
; interpretation a point in 3-dimensional space
; ----- wrong -----

; A List-of-names is one of:
; -- '()
; -- (cons String List-of-names)
; interpretation a list of invitees, by last name
; ex. (cons "bob" (cons "anna" '()))

(cons "1" (cons "2" '()))
; first: "1", rest: (first: "2", rest: '())
; Which is correct

(cons 2 '())
; fist: 1, rest: '()
; Which is wrong because first is not string, It's number