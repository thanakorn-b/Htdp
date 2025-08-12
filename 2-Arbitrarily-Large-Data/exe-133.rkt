;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exe-133) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(define (contains-flatt? alon)
  (cond
      [(string=? (first alon) "Flatt") #true]
      [else (contains-flatt? (rest alon))]))

(define xx (cons "Fagan"
  (cons "Findler"
    (cons "Fisler"
      (cons "Flanagan"
        (cons "Flatt"
          (cons "Felleisen"
            (cons "Friedman" '()))))))))

(contains-flatt? xx)
; Answer: #true
; the result is the same. but first is check for empty or cons first before check inside condition
; and it will panic if not found result and continue to get first '()