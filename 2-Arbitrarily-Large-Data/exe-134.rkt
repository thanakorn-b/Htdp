;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exe-134) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(define (contains? kw alon)
  (cond
      [(string=? (first alon) kw) #true]
      [else (contains? kw (rest alon))]))

(contains? "Flatt" (cons "b" (cons "Flatt" '())))
(member? "Flatt" (cons "b" (cons "Flatt" '())))