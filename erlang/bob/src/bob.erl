-module(bob).

-export([response/1, test_version/0]).

response(String) ->
  case string:trim(String) of
    "" -> "Fine. Be that way!";
    Str ->
      case re:run(Str, "^(?=.*[A-Z])[^a-z]*$") of
        {match, _} -> "Whoa, chill out!";
        nomatch ->
          case re:run(Str, "\\?$") of
            {match, _} -> "Sure.";
            nomatch -> "Whatever."
          end
      end
  end.

test_version() -> 2.
