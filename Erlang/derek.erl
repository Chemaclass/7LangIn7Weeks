% tutorial based on https://www.youtube.com/watch?v=IEhwc2q1zG4

-module(derek).
-import(string, [len/1, concat/2, chr/2, substr/3, str/2, to_lower/1, to_upper/1]).
-export([main/0]).

main() ->
  what_grade(10),
  say_hello(german),
  string_stuff(),
  tuple_stuff().

preschool() -> 'Go to preschool'.
kindergarten() -> 'Go to kindergarten'.
grade_school() -> 'Go to grade school'.

what_grade(N) ->
  io:format("======= What grade =======~n"),
  if N < 5 -> preschool();
    N == 5 -> kindergarten();
    N > 5 -> grade_school()
  end.

say_hello(Language) ->
  io:format("======= Say Hello =======~n"),
  case Language of
    french -> 'Bonjour';
    german -> 'Guten Tag';
    english -> 'Hello'
  end.

string_stuff() ->
  io:format("======= String stuff =======~n"),
  Str1 = "Random string",
  Str2 = "Another string",

  io:format("String: ~p ~p\n", [Str1, Str2]),

  Str3 = io_lib:format("It's a ~s and ~s\n", [Str1, Str2]),
  io:fwrite(Str3),

  Str4 = concat(Str1, Str2),
  io:format(Str4),

  CharIndex = chr(Str4, $n),
  io:format("~p~n", [CharIndex]),

  Str5 = substr(Str4, 8, 6),
  io:format("~p~n", [Str5]),

  StrIndex = str(Str4, Str2),
  io:format("~p~n", [StrIndex]),
  io:format("~p~n", [to_lower(Str1)]).

tuple_stuff() ->
  "======= Tuple stuff =======",
  MyData = {42, 175, 6.25},
  {A, _, C} = MyData,
  io:format("MyData: ~p, A:~p, C:~p\n", [MyData, A, C]),

  Data2 = {height, 1.89},
  {height, H} = Data2,
  io:format("The height is ~p~n", [H]).
