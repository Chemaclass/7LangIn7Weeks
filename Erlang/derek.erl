% tutorial based on https://www.youtube.com/watch?v=IEhwc2q1zG4

-module(derek).
-import(string, [len/1, concat/2, chr/2, substr/3, str/2, to_lower/1, to_upper/1]).
-export([main/0]).

main() ->
  what_grade(10),
  say_hello(german),
  string_stuff(),
  tuple_stuff(),
  list_stuff(),
  lc_stuff(),
  type_stuff().

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

list_stuff() ->
  "======= List stuff =======",
  List1 = [1, 2, 3],
  List2 = [4, 5, 6],
  List3 = List1 ++ List2,
  io:format("List3: ~p~n", [List3]),

  List4 = List3 -- List1,
  io:format("List4: ~p~n", [List4]),

  hd(List4), %retrieve the head of a list
  tl(List4), %retrieve the tail of a list

  % or you can get the head and tail by using [Head|Tail] like:
  List5 = [3 | List4],
  io:format("List5: ~p~n", [List5]),

  [Head | Tail] = List5,
  io:format("Head: ~p, Tail: ~p~n", [Head, Tail]).

lc_stuff() ->
  "======= List Comprehension stuff =======",
  List1 = [1, 2, 3],
  List2 = [10 * N || N <- List1],
  io:format("List2: ~p~n", [List2]),

  List3 = [1, 2, 3, 4, 5, 6],
  List4 = [N || N <- List3, N rem 2 == 0], % even values
  io:format("List4: ~p~n", [List4]),

  Weather = [{murcia, 50}, {madrid, 40}, {miami, 25}, {bullas, 30}],
  GreatTemp = [{City, Temp} || {City, Temp} <- Weather, Temp >= 35],
  GreatTemp.

type_stuff() ->
  "======= Typestuff =======",
  is_atom(name),
  is_float(3.14),
  is_integer(10),
  is_boolean(false),
  is_list([1, 2, 3]),
  is_tuple({height, 6.93}),
  % you can convert from one to another using `type_to_type()`
  % atom_to_binary, atom_to_list, binary_to_atom, fun_to_list, iolist_to_atom, pid_to_list,...

  List = integer_to_list(21),
  io:format("is_integer:~p | is_list:~p~n", [is_integer(List), is_list(List)]).


