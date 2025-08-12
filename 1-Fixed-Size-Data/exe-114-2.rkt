;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exe-114-2) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(require 2htdp/universe)

(define-struct editor [str index])
; An editor is a struct
; (make-editor string number)
; interpretation (make-editor s i)
; which s is a string in editor and i is index of cursor

(define WIDTH 200)

; editor -> image
; got editor to render image

(check-expect (render (make-editor "hello world" 6))
              (overlay/align "left" "center"
               (beside
                (text "hello " 16 "black")
                (rectangle 1 20 "solid" "red")
                (text "world" 16 "black"))
               (empty-scene 200 20)))

(define (render e)
  (overlay/align
   "left"
   "center"
   (beside
    (text (string-before-i (editor-str e) (editor-index e)) 16 "black")
    (rectangle 1 20 "solid" "red")
    (text (string-after-i (editor-str e) (editor-index e)) 16 "black"))
   (empty-scene WIDTH 20)))

; editor -> string
; got string before index
(check-expect (string-before-i "abc" 1) "a")
(define (string-before-i s i)
  (substring s 0 i))

; editor -> string
; got string after index
(check-expect (string-after-i "abc" 1) "bc")
(define (string-after-i s i)
  (substring s i))

; string index -> string
; delete string at index
(check-expect (string-remove-i "abc" 2) "ac")
(define (string-remove-i s i)
  (string-append (substring s 0 (- i 1)) (substring s i)))

; string index -> string
; add string at index
(check-expect (string-add-i "abc" 2 "d") "abdc")
(define (string-add-i s i 1s)
  (string-append (string-before-i s i) 1s (string-after-i s i)))

; editor keyEvent -> editor
; do action to editor

(check-expect (edit (make-editor "ab" 1) "c") (make-editor "acb" 2))
(check-expect (edit (make-editor "ab" 1) "\b") (make-editor "b" 0))
(check-expect (edit (make-editor "ab" 1) "left") (make-editor "ab" 0))
(check-expect (edit (make-editor "ab" 1) "right") (make-editor "ab" 2))
(check-expect (edit (make-editor "ab" 1) "\t") (make-editor "ab" 1))
(check-expect (edit (make-editor "ab" 1) "\r") (make-editor "ab" 1))

(define (edit e ke)
  (cond
    [(string=? "left" ke) (make-editor (editor-str e) (- (editor-index e) 1))]
    [(string=? "right" ke) (make-editor (editor-str e) (+ (editor-index e) 1))]
    [(string=? "\b" ke) (make-editor (string-remove-i (editor-str e) (editor-index e)) (- (editor-index e) 1))]
    [else (if (or (string=? "\t" ke) (string=? "\r" ke))
           e
           (add? e ke))]
    ))

; editor 1string -> editor
; receive editor and first string to calculate that will add or not if it over width
(define (add? e ke)
  (if (> WIDTH (image-width (text (string-append (editor-str e) ke) 16 "black")))
      (make-editor (string-add-i (editor-str e) (editor-index e) ke) (+ (editor-index e) 1))
      ;(make-editor (string-append (string-before-i (editor-str e) (editor-index e)) ke (string-after-i (editor-str e) (editor-index e))) (+ (editor-index e) 1))
      e))

; Any -> bool

(define (check-editor e)
  (editor? e))

; editor -> editor
; get editor to run
(define (run e)
  (big-bang e
    [to-draw render]
    [check-with check-editor]
    [on-key edit]))

(run (make-editor "" 0))