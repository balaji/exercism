-module(hamming).

-export([distance/2, test_version/0]).

distance(Strand1, Strand2) ->
  case string:length(Strand1) == string:length(Strand2) of
    true -> calculate(lists:zip(Strand1, Strand2), 0);
    _ -> {error, "left and right strands must be of equal length"}
  end.

calculate([], Count) -> Count;
calculate([{Same, Same} | T], Count) -> calculate(T, Count);
calculate([_ | T], Count) -> calculate(T, Count + 1).

test_version() -> 2.
