; source https://youtu.be/A0nzZXHphXE
(ns examples.recur)

(defn bad-recursion
  "it will provoke a stack overflow"
  [x y]
  (print x y)
  (bad-recursion (inc x) (dec y)))

; (bad-recursion 5 2)

(defn good-recursion
  "Jump back to start of function with new arguments"
  [x y]
  (print x y)
  (if (< x 9)
    (recur (int x) (dec y))
    ; OK: recur is in tail position of if which
    ; is itself in tail position of the funtion
    ))

(good-recursion 5 2)