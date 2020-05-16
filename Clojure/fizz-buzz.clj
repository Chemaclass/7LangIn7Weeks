(defn fizz-buzz
  "Using normal if conditionals"
  []
  (loop [i 1]
    (if (<= i 100)
      (do
        (if (and (= (rem i 3) 0) (= (rem i 5) 0))
          (println "FizzBuzz")
          (if(= (rem i 3) 0)
            (println "Fizz")
            (if (= (rem i 5) 0)
              (println "Buzz")
              (println i))))
        (recur (inc i))))))

;(fizz-buzz)

(defn fizz-buzz-cond []
  "Using cond allow us to make conditional pairs. Similar as the switch-case"
  (loop [i 1]
    (if (<= i 100)
      (do
        (cond
         (and (= (rem i 3) 0) (= (rem i 5) 0)) (println "FizzBuzz")
         (= (rem i 3) 0)                       (println "Fizz")
         (= (rem i 5) 0)                       (println "Buzz")
         :else                                 (println i))
        (recur (inc i))))))

(fizz-buzz-cond)