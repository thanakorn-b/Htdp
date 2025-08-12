;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exe-82) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
; letter is a string with single length and #false
; which is:
; "a"
; "b"
; ...
; "z"
; #false

; a 3letter is a structure
; (make-3letter letter letter letter)
; interpretation (make-3letter f s t)
; which is:
; f is first letter
; s is second
; t is third
(define-struct 3letter [f s t])

; 3letter 3letter -> boolean
; consume 3letter two variable to compare each letter

(check-expect (compare-word (make-3letter "c" "a" "t") (make-3letter "c" "a" "t")) #true)
(check-expect (compare-word (make-3letter "c" "a" "t") (make-3letter "f" "a" "t")) #false)
(check-expect (compare-word (make-3letter "g" "o" #false) (make-3letter "g" "o" #false)) #true)

(define (compare-word letter1 letter2)
  (and (compare-letter (3letter-f letter1) (3letter-f letter2))
       (compare-letter (3letter-s letter1) (3letter-s letter2))
       (compare-letter (3letter-t letter1) (3letter-t letter2))))

; letter letter -> boolean
; compare letter if same return true and not return false

(check-expect (compare-letter "a" "a") #true)
(check-expect (compare-letter "b" "a") #false)
(check-expect (compare-letter #false #false) #true)

(define (compare-letter l1 l2)
  (cond
    [(and (string? l1) (string? l2))
     (if (string=? l1 l2) #true #false)]
    [(and (false? l1) (false? l2)) #true]
    [else #false]))