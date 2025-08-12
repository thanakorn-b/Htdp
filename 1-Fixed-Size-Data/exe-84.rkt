;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exe-84) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
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

; editor keyEvent -> editor
; do action to editor

(check-expect (edit (make-editor "a" "b") "c") (make-editor "ac" "b"))
(check-expect (edit (make-editor "a" "b") "\b") (make-editor "" "b"))
(check-expect (edit (make-editor "a" "b") "left") (make-editor "" "ab"))
(check-expect (edit (make-editor "a" "b") "right") (make-editor "ab" ""))
(check-expect (edit (make-editor "a" "b") "\t") (make-editor "a" "b"))
(check-expect (edit (make-editor "a" "b") "\r") (make-editor "a" "b"))

(define (edit e ke)
  (cond
    [(string=? "left" ke) (make-editor (string-remove-last (editor-pre e)) (string-append (string-last (editor-pre e)) (editor-post e)))]
    [(string=? "right" ke) (make-editor (string-append (editor-pre e) (string-first (editor-post e)))  (string-remove-first (editor-post e)))]
    [(string=? "\b" ke) (make-editor (string-remove-last (editor-pre e)) (editor-post e))]
    [else (if (or (string=? "\t" ke) (string=? "\r" ke))
           e
           (make-editor (string-append (editor-pre e) ke) (editor-post e)))]))
  ;(... (editor-pre e) ... (editor-post e) ...))


(define (string-remove-last s)
  (substring s 0 (- (string-length s) 1)))

(define (string-last s)
  (substring s (- (string-length s) 1)))

(define (string-first s)
  (substring s 0 1))

(define (string-remove-first s)
  (substring s 1))