-module(difference_of_squares).

-export([sum_of_squares/1, square_of_sums/1, difference_of_squares/1, test_version/0]).

sum_of_squares(N) ->
  trunc(N * (N + 1) * ((2 * N) + 1) / 6).

square_of_sums(N) ->
  trunc(math:pow(N * (N + 1) / 2, 2)).

difference_of_squares(N) ->
  square_of_sums(N) - sum_of_squares(N).

test_version() -> 1.
