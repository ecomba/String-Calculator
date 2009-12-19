(load "lib/str-split/str-split.scm")
(define (str-add string)
  (cond
    ((list? string)
     (cond ((null? string) 0)
      (else
        (+ (string->number (car string)) (str-add (cdr string))))))
    ((string-null? (string-trim string)) 0)
    (else (str-add (str-split (remove-delimiters string delimiters) #\space)))
    ))

(define (remove-delimiter string delimiter) (string-replace string delimiter #\space))

(define delimiters (string->list ",/;\n"))

(define (remove-delimiters string delimiters)
  (cond 
    ((null? delimiters) (string-trim string))
    (else
      (remove-delimiters (remove-delimiter string (car delimiters)) (cdr delimiters)))))
