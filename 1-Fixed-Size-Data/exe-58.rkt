;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exe-58) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
; --- 1 ---
; A Price falls into one of three intervals: 
; — 0 through 1000
; — 1000 through 10000
; — 10000 and above.
; interpretation the price of an item

; --- 2 ---
; Price -> Number
; computes the amount of tax charged for p
(define (sales-tax p) 0)

; --- 3 ---
(check-expect (sales-tax.v2 537) 0)
(check-expect (sales-tax.v2 1000) (* 0.05 1000))
(check-expect (sales-tax.v2 12017) (* 0.08 12017))

; --- 4 ---
(define (sales-tax.v1 p)
  (cond
    [(and (<= 0 p) (< p 1000)) ...]
    [(and (<= 1000 p) (< p 10000)) ...]
    [(>= p 10000) ...]))

(define low-tax 0.05)
(define lux-tax 0.08)

(define low-bound 1000)
(define lux-bound 10000)

; --- 5 ---
(define (sales-tax.v2 p)
  (cond
    [(and (<= 0 p) (< p low-bound)) 0]
    [(and (<= low-bound p) (< p lux-bound)) (* low-tax p)]
    [(>= p lux-bound) (* lux-tax p)]))

; --- 6 ---
(sales-tax.v2 150)

