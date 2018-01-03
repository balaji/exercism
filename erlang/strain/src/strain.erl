-module(strain).

-export([keep/2, discard/2, test_version/0]).

keep(Fn, List) -> strain(Fn, List, [], true).
discard(Fn, List) -> strain(Fn, List, [], false).

strain(Fn, List, Acc, Cond) ->
  case List of
    [] -> Acc;
    [H | T] ->
      case Fn(H) of
        Cond -> strain(Fn, T, Acc ++ [H], Cond);
        _ -> strain(Fn, T, Acc, Cond)
      end
  end.

test_version() -> 1.
