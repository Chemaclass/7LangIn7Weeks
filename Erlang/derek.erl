% tutorial based on https://www.youtube.com/watch?v=IEhwc2q1zG4

-module(derek).
-import(string, [len/1, concat/2, chr/2, substr/3, str/2, to_lower/1, to_upper/1]).
-export([main/0]).

main() ->
  what_grade(10),
  say_hello(german).

preschool() -> 'Go to preschool'.
kindergarten() -> 'Go to kindergarten'.
grade_school() -> 'Go to grade school'.

what_grade(N) ->
  if N < 5 -> preschool();
    N == 5 -> kindergarten();
    N > 5 -> grade_school()
  end.

say_hello(Language) ->
  case Language of
    french -> 'Bonjour';
    german -> 'Guten Tag';
    english -> 'Hello'
  end.