% http://erlang.org/course/exercises.html

-module(temp).
-export([convert/1]).

% Simple sequential programs
% (hint 5(F-32) = 9C)

f2c(F) -> (5 * (F - 32)) / 9.
c2f(C) -> 32 + ((9 * C) / 5).

convert(Temp) ->
  {Scale, Grades} = Temp,
  if Scale == c -> c2f(Grades);
    Scale == f -> f2c(Grades);
    true -> wtf
  end.
