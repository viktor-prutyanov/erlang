%% Parallel Simpson method
%% Viktor Prutyanov viktor.prutyanov@phystech.edu
%% GNU GPL v2

-module(psm).

-export([simpson/5]).

psm_substep(A, B, Func) -> 
    (B - A) * (Func(A) + 4 * Func((A + B) / 2) + Func(B)) / 6.

psm_step(A, B, Func, Delta) when A < B ->
    psm_substep(A, A + Delta, Func) + psm_step(A + Delta, B, Func, Delta);
psm_step(A, B, Func, Delta) when A > B ->
    psm_substep(A - Delta, B, Func).    

psm_step_client() ->
    receive
        {From, Arg} -> From ! psm_step(element(1, Arg), element(2, Arg), element(3, Arg), element(4, Arg))
    end.

loop() ->
    Result = 0.0,
    receive
        Step_result -> 
            Result = Result + Step_result
    end,
    Result.
        

simpson(A, B, N_steps, Func, Delta) -> 
    Step = (A - B) / N_steps,   
    L = [{A + (I - 1) * Step, A + I * Step, Func, Delta} || I <- lists:seq(1, N_steps)],
    lists:foreach(fun(X) -> spawn(psm_step_client) ! {self(), X} end, L),
    loop().    
