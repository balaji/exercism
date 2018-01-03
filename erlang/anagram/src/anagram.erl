-module(anagram).

-export([find/2, test_version/0]).

find(Word, Candidates) -> find(Word, Candidates, []).

find(_, [], Acc) -> Acc;
find(Word, [H | Others], Acc) ->
  case string:length(Word) /= string:length(H) orelse string:equal(Word, H, true) of
    true -> find(Word, Others, Acc);
    _ -> case string:equal(lists:sort(string:to_lower(Word)), lists:sort(string:to_lower(H))) of
           true -> find(Word, Others, Acc ++ [H]);
           _ -> find(Word, Others, Acc)
         end
  end.

test_version() -> 1.
