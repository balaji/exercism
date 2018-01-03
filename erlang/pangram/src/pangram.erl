-module(pangram).

-export([is_pangram/1, test_version/0]).

is_pangram(Sentence) -> is_pangram(string:to_lower(Sentence), maps:new()).

is_pangram([], Map) -> check_pangram(Map, 26);
is_pangram([Ascii | T], Map) -> is_pangram(T, maps:put(Ascii, true, Map)).

check_pangram(_, 0) -> true;
check_pangram(Map, N) ->
  case maps:is_key(96 + N, Map) of
    true -> check_pangram(Map, N - 1);
    _ -> false
  end.

test_version() -> 1.
