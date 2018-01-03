-module(collatz_conjecture).

-export([steps/1, test_version/0]).


steps(N) ->
  if
    N > 0 -> steps(N, 0);
    true -> {error, "Only positive numbers are allowed"}
  end.

steps(N, Acc) ->
  case N of
    1 -> Acc;
    N when N rem 2 == 0 -> steps(N div 2, Acc + 1);
    N when N rem 2 /= 0 -> steps(3 * N + 1, Acc + 1)
  end.

test_version() -> 2.
