;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exe-129) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(define milky-way 
(cons "Neptune"
      (cons "Urarus"
            (cons "Saturn"
                  (cons "Jupiter"
                        (cons "Mars"
                              (cons "Earth"
                                    (cons "Venus"
                                          (cons "Mercury" '())))))))))

milky-way

(define meal
  (cons "ice cream"
        (cons "Brie cheese"
              (cons "water"
                    (cons "bread"
                          (cons "beans"
                                (cons "french fries"
                                      (cons "steak" '()))))))))

; steak, french fries, beans, bread, water, Brie cheese, and ice cream
meal

(define rainbow
  (cons "purple"
        (cons "indigo"
              (cons "blue"
                    (cons "green"
                          (cons "yellow"
                                (cons "orange"
                                      (cons "red" '()))))))))
rainbow