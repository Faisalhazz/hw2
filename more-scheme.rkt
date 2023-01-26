;; Faisal Alhazzaa
;; CS360

;;
;; DO NOT REMOVE THESE TWO LINES
;;
#lang racket
(provide (all-defined-out))

;;
;; Problem 1
;;


(define (stream-pair-with f s)
  (stream-map (lambda (x) (cons x (f x))) s))


;;
;; Problem 2
;;

(define (stream-iterate f x)
  (stream-cons x (stream-iterate f (f x))))
;;
;; Problem 3
;;

(define (stream-zip xs ys)
  (if (or (stream-empty? xs) (stream-empty? ys))
      (stream)
      (stream-cons (cons (stream-first xs) (stream-first ys))
                   (stream-zip (stream-rest xs) (stream-rest ys)))))


;;
;; Problem 4
;;

(define (cycle-streams xs ys)
  (if (or (stream-empty? xs) (stream-empty? ys))
      (stream)
      (stream-cons (cons (stream-first xs) (stream-first ys))
                   (stream-zip (stream-rest xs) (stream-rest ys)))))

;;
;; Problem 5
;;

(define count 0)


(define apply-count 
    (lambda (f x)
       (set! count (+ count 1))
      (cons (f x) count)))
