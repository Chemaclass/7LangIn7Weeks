% http://erlang.org/course/exercises.html

-module(lists1).
-export([min_max/1]).

min(List) ->
  lists:foldl(
    fun(Current, Carry) ->
      if Carry == 0 -> Current;
        Current > Carry -> Carry;
        true -> Current end
    end, 0, List).

max(List) ->
  lists:foldl(
    fun(Current, Carry) ->
      if Current < Carry -> Carry;
        true -> Current end
    end, 0, List).


min_max(L) -> {min(L), max(L)}.
% Or better use the ones defined by erlang lists library ;)
%%min_max(L) -> {lists:min(L), lists:max(L)}.
