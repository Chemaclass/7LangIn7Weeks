-module(translate).
-export([loop/0]).

% Spawning a Process
loop() ->
  receive
    "casa" ->
      io:format("house~n"),
      loop();
    "blanca" ->
      io:format("white~n"),
      loop();
    _ ->
      io:format("I don't understand~n"),
      loop()
  end.
