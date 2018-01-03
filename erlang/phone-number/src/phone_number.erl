-module(phone_number).

-export([number/1, areacode/1, pretty_print/1, test_version/0]).

number(String) -> check(list_to_integer(number(String, ""))).

number([], Acc) -> Acc;
number([H | T], Acc) when H >= $0 andalso H =< $9 -> number(T, Acc ++ [H]);
number([_ | T], Acc) -> number(T, Acc).

check(Number) when Number div 10000000000 =:= 1 -> integer_to_list(Number - 10000000000);
check(Number) when Number div 10000000000 > 0 -> "0000000000";
check(Number) when Number div 1000000000 /= 0 -> integer_to_list(Number);
check(_) -> "0000000000".

areacode(String) -> string:substr(number(String), 1, 3).

pretty_print(String) ->
  Number = number(String),
  lists:flatten(io_lib:format("(~s) ~s-~s",
    [lists:sublist(Number, 1, 3),
      lists:sublist(Number, 4, 3),
      lists:sublist(Number, 7, 4)])).

test_version() -> 1.
