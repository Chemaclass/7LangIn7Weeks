(ns tutorial.core
    (:gen-class))

(defn -main
  "I don't do a whole lot ... yet."
  [& args]

  (def aString "Hello")
  (def aDouble 1.234567)
  (def aLong 15)
  (printf "This is a string %s\n" aString)
  (printf "5 spaces and %5d\n" aLong)
  (printf "Leading zeros %04d\n" aLong)
  (printf "%-4d left justified\n" aLong)
  (printf "3 decimals %.3f\n" aDouble))

(-main)