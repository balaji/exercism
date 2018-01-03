-module(grains).

-export([square/1, total/0, test_version/0]).

square(N) ->
  trunc(math:pow(2, N - 1)).

total() ->
  trunc(2 * math:pow(2, 63)) - 1.

test_version() -> 1.
