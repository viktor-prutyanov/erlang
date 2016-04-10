%Simple echo program

-module(echo).
-export([start/0, loop/0]).

start() ->
        spawn(echo, loop, []).

loop() ->
    receive
        {Src, Msg} ->
            Src ! Msg,
            loop()
    end.
