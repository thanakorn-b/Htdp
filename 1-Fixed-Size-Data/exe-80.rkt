;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exe-80) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(define-struct movie [title director year])

(define (doSomethingWithMovie m)
  (... (movie-title m) ... (movie-director m) ... (movie-year) ...))

(define-struct pet [name number])

(define (doPet p)
  (... (pet-name p) ... (pet-number p) ...))
  
(define-struct CD [artist title price])

(define (doCD c)
  (... (CD-artist c) ... (CD-title c) ... (CD-price c) ...))
  
(define-struct sweater [material size color])

(define (doSweater s)
  (... (sweater-material s) ... (sweater-size s) ... (sweater-color) ...))