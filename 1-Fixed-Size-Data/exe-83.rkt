;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exe-83) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(define-struct editor [pre post])
; An Editor is a structure:
;   (make-editor String String)
; interpretation (make-editor s t) describes an editor
; whose visible text is (string-append s t) with 
; the cursor displayed between s and t

(overlay/align "left" "center"
               (text "hello world" 11 "black")
               (empty-scene 200 20))

; editor -> image
; got editor to render image

(check-expect (render (make-editor "hello " "world"))
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
    (text (editor-pre e) 16 "black")
    (rectangle 1 20 "solid" "red")
    (text (editor-post e) 16 "black"))
   (empty-scene 200 20)))
