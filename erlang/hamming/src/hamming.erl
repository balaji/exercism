-module(hamming).

-export([distance/2, test_version/0]).

distance(Strand1, Strand2) when length(Strand1) =:= length(Strand2) -> calculate(lists:zip(Strand1, Strand2), 0);
distance(_, _) -> {error, "left and right strands must be of equal length"}.

calculate([], Count) -> Count;
calculate([{Same, Same} | T], Count) -> calculate(T, Count);
calculate([_ | T], Count) -> calculate(T, Count + 1).

test_version() -> 2.
