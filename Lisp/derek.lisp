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
(terpri)
(defvar *age* 18)
(if (= *age* 18)
  (format t "You can vote~%")
  (format t "You can't vote~%"))

;; loops
(terpri)
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
(terpri)
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
(terpri)
(defparameter *heroes*
  '((Superman (Clark Kent))
  (Flash (Barry Allen))
  (Batman (Bruce Wayne))))

(format t "Superman Data ~a ~%" (assoc 'superman *heroes*))
(format t "Superman is ~a ~%" (cadr (assoc 'superman *heroes*)))

(defparameter *hero-size*
  '((Superman (6 ft 3 in) (230 lbs))
  (Flash (6 ft 0 in) (190 lbs))
  (Batman (6 ft 2 in) (120 lbs))))

(format t "Superman is ~a ~%" (cadr (assoc 'Superman *hero-size*)))

;; Functions
(terpri)
(defun hello()
  (print "Helllo")
  (terpri))
(hello)

(defun get-avg (num-1 num-2)
  (/ (+ num-1 num-2) 2))
(format t "Avg 10 & 50 = ~a ~%" (get-avg 10 50))

(defun print-list (w x &optional y z)
  (format t "List = ~a ~%" (list w x y z)))
(print-list 1 2 3 4)
(print-list 1 2)

(defvar *total* 0)
(defun sum (&rest nums)
  (dolist (num nums)
    (setf *total* (+ *total* num)))
  (format t "Sum = ~a~%" *total*))
(sum 1 2 3 4 5) ; 15

(format t "A number ~a ~%" (mapcar #'numberp '(1 2 3 f g)))

;; inner funcs
(terpri)
(flet ((double-it (num) (* num 2))
  (triple-it (num) (* num 3 )))
  (format t "Double & tripel 10 = ~a~%" (triple-it(double-it 10))))

(labels ((double-it (num)(* num 2))
  (triple-it (num)(* (double-it num) 3)))
  (format t "Double & Triple 3 = ~d~%" (triple-it 3)))

;; high order funcs
(defun times-3 (x) (* 3 x))
(defun times-4 (x) (* 4 x))

(defun multiplies (mult-func max-num)
  (dotimes(x max-num)
  (format t "~d: ~d~%" x (funcall mult-func x))))

(multiplies #'times-3 5)
(multiplies #'times-4 5)

;; lambdas
(terpri)
(mapcar (lambda (x) (print (* x 2))) '(1 2 3 4 5))

;; macros
(terpri)
; without macro
(defun add(num1 num2)
  (let ((sum (+ num1 num2)))
  (format t "~a + ~a = ~a ~%" num1 num2 sum)))
(add 3 4)
; with macro
(defmacro letx (var val &rest body)
  `(let ((,var ,val)) ,@body))
(defun subtract (num1 num2)
  (letx dif (- num1 num2)
  (format t "~a + ~a = ~a ~%" num1 num2 dif)))
(subtract 10 6)

;; classes
(terpri)
(defclass animal() (name sound))
(defparameter *dog* (make-instance 'animal))
(setf (slot-value *dog* 'name) "Spot")
(setf (slot-value *dog* 'sound) "Woof")
(format t "~a says ~a ~%" (slot-value *dog* 'name) (slot-value *dog* 'sound))

(defclass mammal()
  ((name 
      :initarg :name 
      :initform (error "Must provide a name"))
    (sound :initarg :sound 
      :initform "No sound"
      :accessor mammal-sound)))
(defparameter *king-kong*
  (make-instance 'mammal :name "King Kong" :sound "Rawwr!"))
(format t "~a says ~a ~%" 
  (slot-value *king-kong* 'name) 
  (slot-value *king-kong* 'sound))

;; arrays
(terpri)
(defparameter names (make-array 3))
(setf (aref names 1) 'Bob)
(format t "~a~%"(aref names 1))

(setf num-array (make-array '(3 3)
  :initial-contents '((0 1 2) (3 4 5)(6 7 8))))
(dotimes (x 3)
  (dotimes (y 3)
    (print(aref num-array x y))))
(terpri)

;; hash-tables
(defparameter people (make-hash-table))
(setf (gethash '102 people) '(Paul Vale))
(setf (gethash '103 people) '(Sam Real))
(setf (gethash '104 people) '(Chema Smith))

(format t "~a ~%" (gethash '102 people))
(maphash #'(lambda(k v) (format t "~a = ~a~%" k v)) people)
(remhash '103 people)
(terpri)
(maphash #'(lambda(k v) (format t "~a = ~a~%" k v)) people)

;; structs
(defstruct customer name address id)
(setq chema (make-customer
  :name "Chema"
  :address "123 Berlin"
  :id 1000))
(format t "~a~%" (customer-name chema))
(setf (customer-address chema) "123 main")
(write chema)

(setq sally-smith-1001 (make-customer
  :name "Sally smith"
  :address "123 main"
  :id 1001))
(print sally-smith-1001)

;; File IO
(terpri)
; writting
(with-open-file (my-stream "test.txt"
    :direction :output :if-exists :supersede)
  (princ "Some random Text" my-stream))

; reading
(let ((in (open "test.txt" :if-does-not-exist nil)))
  (when in 
    (loop for line = (read-line in nil)
      while line do (format t "~a~%" line))
    (close in)))

; deleting
(delete-file "test.txt")
