-module(isogram).

-export([is_isogram/1, test_version/0]).

is_isogram(String) -> is_isogram(string:to_lower(String), sets:new()).

is_isogram(String, Set) ->
  case String of
    [] -> true;
    [32 | T] -> is_isogram(T, Set);
    [45 | T] -> is_isogram(T, Set);
    [H | T] ->
      case sets:is_element(H, Set) of
        true -> false;
        _ -> is_isogram(T, sets:add_element(H, Set))
      end
  end.

test_version() ->
  1.
