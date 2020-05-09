-module(yet_again).
-export([another_factorial/1]).
-export([another_fib/1]).

another_factorial(0) -> 1;
another_factorial(N) -> N * another_factorial(N - 1).

another_fib(0) -> 1;
another_fib(1) -> 1;
another_fib(N) -> another_fib(N - 1) + another_fib(N - 2).

% Usage:
% Inside the console, compile the `erl` file with `c(yet_again)`.
% Then you'll be able to call these functions by:
% yet_again:another_factorial(N).
% yet_again:another_fib(N).