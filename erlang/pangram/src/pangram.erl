-module(pangram).

-export([is_pangram/1, test_version/0]).

is_pangram(Sentence) -> is_pangram(string:to_lower(Sentence), maps:new()).

is_pangram(Sentence, Map) ->
    case Sentence of
        [] -> check_pangram(Map, 26);
        [Ascii | T] -> is_pangram(T, maps:put(Ascii, true, Map))
    end.

check_pangram(Map, Limit) ->
    case Limit of
        0 -> true;
        N ->
            case maps:is_key(96 + N, Map) of
                true -> check_pangram(Map, N - 1);
                _ -> false
            end
    end.

test_version() -> 1.
