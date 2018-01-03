%%-module(accumulate).
%%
%%-export([accumulate/2, test_version/0]).
%%
%%accumulate(Fn, Ls) -> [Fn(X) || X <- Ls].
%%
%%test_version() -> 1.


-module(accumulate).

-export([accumulate/2, test_version/0]).

accumulate(Fn, In) ->
  do_accumulate(Fn, In, []).

do_accumulate(Fn, [H | T], Out) ->
  do_accumulate(Fn, T, Out ++ [Fn(H)]);
do_accumulate(_, [], Out) ->
  Out.

test_version() -> 1.