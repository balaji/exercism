-module(raindrops).

-export([convert/1, test_version/0]).

convert(Number) ->
  RainDrops = convert(Number, 3) ++ convert(Number, 5) ++ convert(Number, 7),
  case RainDrops of
    "" -> integer_to_list(Number);
    Str -> Str
  end.

convert(Number, Factor) ->
  case Factor of
    3 when Number rem 3 == 0 -> "Pling";
    5 when Number rem 5 == 0 -> "Plang";
    7 when Number rem 7 == 0 -> "Plong";
    _ -> ""
  end.

test_version() -> 1.
