-module(mathStuff).
-export([perimeter/1]).

%% {square,Side}
%% {circle,Radius}
%% {triangle,{A,B,C}}
perimeter(Form) ->
  {Shape, N} = Form,
  io:format("The perimeter for the ~p is: ", [Shape]),
  if Shape == square -> squarePerimeter(N);
    Shape == circle -> circlePerimeter(N);
    Shape == triangle -> trianglePerimeter(N);
    true -> wtf
  end.

squarePerimeter(Side) -> Side * Side.
circlePerimeter(Radius) -> 2 * math:pi() * Radius.
trianglePerimeter({A, B, C}) when (A + B) > C -> A + B + C;
trianglePerimeter({A, B, C}) when (A + B) =< C -> "Invalid input: make sure `a+b>c`".