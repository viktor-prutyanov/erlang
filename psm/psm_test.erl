%% Parallel Simpson method test
%% Viktor Prutyanov viktor.prutyanov@phystech.edu
%% GNU GPL v2

-module(psm_test).

-export([psm_test/0]).

-import(psm, [simpson/5]).

psm_test() -> 
    io:fwrite("Result for x^2, [-100.0; 101.0], delta = 0.0001, 2, is ~f~n", [simpson(-100.0, 101.0, 2, fun(X) -> X * X end, 0.0001)]).
