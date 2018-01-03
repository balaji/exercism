-module(leap).

-export([leap_year/1, test_version/0]).


leap_year(Year) ->
  if
    Year rem 4 /= 0 ->
      false;
    Year rem 100 == 0 andalso Year rem 400 /= 0 ->
      false;
    true ->
      true
  end.

test_version() -> 3.
