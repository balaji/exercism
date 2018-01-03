-module(sum_of_multiples).

-export([sumOfMultiples/2, test_version/0]).

sumOfMultiples(_, 1) -> 0;
sumOfMultiples(Multiples, N) -> sumOfMultiples(Multiples, N - 1, N, sets:new()).

sumOfMultiples([], _, _, Acc) -> lists:foldl(fun(X, A) -> X + A end, 0, sets:to_list(Acc));
sumOfMultiples([_ | T], M, N, Acc) when M =< 0 -> sumOfMultiples(T, N - 1, N, Acc);
sumOfMultiples([H | T], M, N, Acc) when M rem H =:= 0 -> sumOfMultiples([H | T], M - H, N, sets:add_element(M, Acc));
sumOfMultiples([H | T], M, N, Acc) -> sumOfMultiples([H | T], M - 1, N, Acc).

test_version() -> 1.
