-module(phone_number).

-export([number/1, areacode/1, pretty_print/1, test_version/0]).

number(Number) -> number_internal([C || C <- Number, C >= $0, C =< $9]).

number_internal([$1|Number]) when length(Number) =:= 10 -> Number;
number_internal(Number) when length(Number) =:= 10 -> Number;
number_internal(_) -> string:copies("0", 10).

areacode(Number) -> string:substr(number(Number), 1, 3).

pretty_print(Num) ->
  Number = number(Num),
  lists:flatten(io_lib:format("(~s) ~s-~s",
    [lists:sublist(Number, 1, 3),
      lists:sublist(Number, 4, 3),
      lists:sublist(Number, 7, 4)])).

test_version() -> 1.