(ns tutorial.core
    (:require [clojure.string :as str])
    (:gen-class))

(defn printf-possibilities []
  (def aString "Hello")
  (def aDouble 1.234567)
  (def aLong 15)
  (printf "This is a string %s\n" aString)
  (printf "5 spaces and %5d\n" aLong)
  (printf "Leading zeros %04d\n" aLong)
  (printf "%-4d left justified\n" aLong)
  (printf "3 decimals %.3f\n" aDouble))

(defn string-manipulation []
  (def str1 "This is my 2nd string")
  (str/blank? str1)
  (str/includes? str1 "my")
  (str/index-of str1 "my")
  (str/split str1 #" ")
  (str/split str1 #"\d")
  (str/join " " ["The" "Big" "Chesse"])
  (str/replace "I am 26" #"26" "27")
  (str/upper-case str1)
  (str/lower-case str1))


(defn lists-manipulation [& args]
  (println (list "Dog" 1 3.4 true)) ; (Dog 1 3.4 true)
  (println (nth (list 1 2 3) 2)) ; 3
  (println (list* 1 2 [3 4])) ; (1 2 3 4)
  (println (cons 3 (list 1 2))) ; (3 1 2)
  )

(defn set-manipulation [& args]
  (println (set '(1 1 2))) ; #{1 2}
  (println (get (set '(1 2 3 4 4)) 2)) ; 2
  (println (contains? (set '(1 1 2 3)) 2)) ;true
  )

(defn vector-manipulation [& args]
  (println (vector 1 "Dog")) ; [1 Dog]
  (println (conj (vector 3 2) 1)) ; [3 2 1]
  (println (pop (vector 3 2))) ; [3]
  )

(defn map-manipulation []
  (def aMap ; [{Age 26, Name Chema} {Age 42, Name Derek}]
    [(hash-map "Name" "Chema", "Age" 26)
     (hash-map "Name" "Derek", "Age" 42)])

  (println aMap) ; {Age 26, Name Chema}
  (println (map (fn [p] (get p "Age")) aMap)) ; (26 42)
  (println (map #(get % "Name") aMap)) ; (Chema Derek)
  )

(map-manipulation)
