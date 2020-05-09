% tutorial based on https://www.youtube.com/watch?v=IEhwc2q1zG4

-module(derek).
-import(string, [len/1, concat/2, chr/2, substr/3, str/2, to_lower/1, to_upper/1]).
-export([main/0, add/2, add/3]).

main() ->
  do_math(5, 4).

hello_world() -> io:format("Hello Chema\n").

add(N1, N2) -> hello_world(), N1 + N2.
add(N1, N2, N3) -> hello_world(), N1 + N2 + N3.

% There is also (math:) sin, cos, tan, asin, acos, atan,
% sinh, cosh, tanh, asinh, acosh, atanh, and lots of more...
do_math(A, _) ->
  rand:uniform(A).