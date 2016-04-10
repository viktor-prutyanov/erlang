%Simple echo program test

-module(echo_test).
-export([echo_test/0]).
-import(echo, [start/0]).

echo_test() ->
    Id = start(),
    lists:foreach(fun(_) -> send(Id) end, lists:seq(1, 5)),
    loop().

send(Id) ->
    Id ! {self(), gracias}.

loop() ->
    receive
        Msg ->
            io:fwrite("Received back \"~w\"~n", [Msg]),
            loop()
    end.
