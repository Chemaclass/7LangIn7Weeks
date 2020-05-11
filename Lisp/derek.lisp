;; source: https://youtu.be/ymSq4wHrqyU

(setq *print-case* :capitalize)

(format t "Hello world ~%")
(print "What's your name")
;; (defvar *name* (read))

;; (defun hello-you (name)
;;   (format t "Hello ~a! ~%" name))

(defparameter *name* 'Chema)
(format t "(eq *name 'Chema) = ~d ~%" (eq *name* 'Chema))
(format t "(equal \"string\" \"String\") = ~d~%" (equal "string" "String"))

;; Conditionals
(defvar *age* 18)
(if (= *age* 18)
  (format t "You can vote~%")
  (format t "You can't vote~%"))

;; loops
(loop for x from 1 to 10
  do (print x))

(setq x 1)
(loop
  (format t "~d," x)
  (setq x (+ x 1))
  (when (> x 5) (return x))
)

(loop for x in '(Sus Angel Juan Lola) do
  (format t "~s ~%" x))

(loop for y from 100 to 103 do (print y))

(dotimes (y 6) (print y))

;; playing with lists

(cons 'superman 'batman)
(list 'superman 'batman 'flash)
(cons 'aquaman '(superman batman))

(format t "Head = ~a ~%" (car '(superman barman aquaman joker)))
(format t "Tail = ~a ~%" (cdr '(superman barman aquaman joker)))
(format t "2nd = ~a ~%" (cadr '(superman barman aquaman joker)))
(format t "3rd = ~a ~%" (caddr '(superman barman aquaman joker)))

(format t "Is 3 in list = ~a~%" (if (member 3 '(2 4 6)) 't nil))

(defvar superman (list :name "Superman" :secret-id "Clark Kent"))
(defvar *hero-list* nil)
(push superman *hero-list*)
(dolist (hero *hero-list*)
  (format t "~{~a : ~a ~}~%" hero))

;; assoc-lists

(defparameter *heroes*
  '((Superman (Clark Kent))
  (Flash (Barry Allen))
  (Batman (Bruce Wayne))))

(format t "Superman Data ~a ~%" (assoc 'superman *heroes*))
(format t "Superman is ~a ~%" (cadr (assoc 'superman *heroes*)))

