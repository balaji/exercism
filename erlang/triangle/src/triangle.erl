-module(triangle).

-export([kind/3, test_version/0]).

kind(A, B, C) when A =< 0 orelse B =< 0 orelse C =< 0 -> {error, "all side lengths must be positive"};
kind(A, B, C) when A + B =< C orelse A + C =< B orelse B + C =< A -> {error, "side lengths violate triangle inequality"};
kind(A, A, A) -> equilateral;
kind(A, B, C) when A =:= B orelse A =:= C orelse B =:= C -> isosceles;
kind(_, _, _) -> scalene.

test_version() -> 1.
