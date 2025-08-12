;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exe-28) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(define people 120)
(define base-price 5.0)
(define each-price-change 0.1)
(define people-will-change 15)
(define fixed-cost 180)
(define cost-per-attendees 0.04)

(define (attendees ticket-price)
  (- people (* (- ticket-price base-price) (/ people-will-change each-price-change))))

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(define (cost ticket-price)
  (+ fixed-cost (* cost-per-attendees (attendees ticket-price))))

(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))

(profit 5)
(profit 4)
(profit 3)
(profit 2)
(profit 1)
