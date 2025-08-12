;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exe-137) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
;; List-of-names -> Boolean
;; Determines whether "Flatt" is on a-list-of-names.
(define (contains-flatt? alon)
  (cond
    [(empty? alon) ...]
    [else
     (... (first alon) ...
      ... (contains-flatt? (rest alon)) ...)]))


;; List-of-strings -> Number
;; Determines how many strings are on alos.
(define (how-many alos)
  (cond
    [(empty? alos) ...]
    [else
     (... (first alos) ...
      ... (how-many (rest alos)) ...)]))

; Ans: structure is look alike because they use same data defination like List-of-strings
; and they self reference is same
; but difference with signature or result or in logic