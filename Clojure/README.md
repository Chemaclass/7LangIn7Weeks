## Clojure

Clojure created by Rich Hickey in 2007.

Lisp created by John McCarthy in 1950's.

Later 'dialects' of Lisp added macros.

The simple syntax of Lisp makes its macros.

---

Clojure is dynamically typed and functional.

Imperative programming freely mutates state;
functional programming avoids mutable state.

"Pure" functions are truly modular.

---

A Clojure reference type holds mutable state that 
is coordinated across threads without locks.

Clojure compiles to Java bytecode, runs on the JVM,
and easily interoperates with Java code.

Clojure's approach to OOP removes inheritance and
encapsulation but embraces polymorphism.

---

### Core sequence functions

* next; like rest, but returns nil for sequences of zero or one elements
* nth; like get, but works on sequences
* apply; invokes a function with args taken from a sequence
* map; returns a lazy sequence produced by invoking a function with args from sequences
* reduce; returns result of invoking a function on successive pairs of elements
* reductions; returns a lazy sequence of the intermediate values that would be produce by reduce
* filter; returns a lazy sequence of elements of another sequence for which a condition function returns true
* remove; like filter, but contains the elements for which the condition function returns false
* take; returns a lazy sequence of the first n elements of a sequence
* take-last; returns a lazy sequence of the last n elements of a sequence
* take-nth; returns a lazy sequence of every nth element of a sequence
* concat; returns a lazy sequence that concatenates together multiple sequences
* interleave; returns a lazy sequence that takes elements from multiple collections round-robin
* interpose; returns a lazy sequence in which a value is inserted in between elements of a sequence
* distinct; returns a lazy sequence in which only the first occurrence of any value is retained 
* reverse; returns a list of the elements of a sequence in reverse order
* flatten; return a lazy sequence containing the elements of a sequence and its nested sequences
* sort;  returns a non-lazy sequence of the elements of another sequence in sorted order  

---

## References

* https://youtu.be/vfnL5Dai77Q