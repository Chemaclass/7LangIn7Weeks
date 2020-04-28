% Quicksort
% [4,2,1,3,5,7,6] - [1,2,3,4,5,6,7] L + P + G

qsort([],[]).
qsort([H|T], Sorted) :- 
  partition(H,T,Less,Greater),
  qsort(Less,SortedLess),
  qsort(Greater,SortedGreater),
  append(SortedLess,[H|SortedGreater],Sorted).

partition(_,[],[],[]).

partition(P, [H|T], [H|Less], Greater) :- 
  H =< P,
  partition(P,T,Less,Greater).

partition(P, [H|T], Less, [H|Greater]) :- 
  H > P,
  partition(P,T,Less,Greater).

% Usage: qsort([4,2,1,3,5,7,6],S).