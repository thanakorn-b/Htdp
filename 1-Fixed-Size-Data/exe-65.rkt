;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exe-65) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(define-struct movie [title producer year])
(make-movie "It" "don't know" "2023?")

(define-struct person [name hair eyes phone])
(make-person "thang" "black" "black" "0881743749")

(define-struct pet [name number])
(make-pet "cat" "no")

(define-struct CD [artist title price])
(make-CD "keshi" "soft spot" "9.99")

(define-struct sweater [material size producer])
(make-sweater "cotton" "M" "uniqlo")

(define-struct entry [name phone email])
(make-entry "test" "000-000-0000" "test@test.com")
