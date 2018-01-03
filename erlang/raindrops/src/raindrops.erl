-module(raindrops).

-export([convert/1, test_version/0]).

convert(Number) ->
  RainDrops = convert(Number, 3) ++ convert(Number, 5) ++ convert(Number, 7),
  case RainDrops of
    "" -> integer_to_list(Number);
    Str -> Str
  end.

convert(Number, 3) when Number rem 3 == 0 -> "Pling";
convert(Number, 5) when Number rem 5 == 0 -> "Plang";
convert(Number, 7) when Number rem 7 == 0 -> "Plong";
convert(_, _) -> "".

test_version() -> 1.
