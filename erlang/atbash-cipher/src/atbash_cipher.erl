-module(atbash_cipher).

-export([encode/1, decode/1, test_version/0]).

encode(String) -> insert_spaces(plain_encode(string:to_lower(String)), "", "").

plain_encode(String) -> plain_encode(String, "").
plain_encode([], Encoded) -> Encoded;
plain_encode([H | T], Encoded) when H >= $a andalso H =< $z -> plain_encode(T, Encoded ++ [($a + $z) - H]);
plain_encode([H | T], Encoded) when H >= $1 andalso H =< $9 -> plain_encode(T, Encoded ++ [H]);
plain_encode([_ | T], Encoded) -> plain_encode(T, Encoded).

insert_spaces([], Temp, Acc) -> Acc ++ Temp;
insert_spaces([H | T], Temp, Acc) when length(Temp) == 5 -> insert_spaces(T, [H], Acc ++ Temp ++ [$ ]);
insert_spaces([H | T], Temp, Acc) -> insert_spaces(T, Temp ++ [H], Acc).

decode(String) -> decode(String, "").

decode([], Acc) -> Acc;
decode([H | T], Acc) -> plain_encode(T, Acc ++ plain_encode([H])).

test_version() -> 1.
