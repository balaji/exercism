-module(nucleotide_count).

-export([count/2, nucleotide_counts/1, test_version/0]).

nucleotide_counts(Dna) ->
  CountMap = nucleotide_counts_map(Dna),
  [{"A", maps:get("A", CountMap)},
    {"T", maps:get("T", CountMap)},
    {"C", maps:get("C", CountMap)},
    {"G", maps:get("G", CountMap)}].

count(Dna, N) ->
  CountMap = nucleotide_counts_map(Dna),
  case N of
    [Nu | _] when Nu =:= $A; Nu =:= $C; Nu =:= $G; Nu =:= $T -> maps:get([Nu], CountMap);
    _ -> error("Invalid nucleotide")
  end.

nucleotide_counts_map(Dna) ->
  nucleotide_counts(Dna, #{"A" => 0, "T" => 0, "C" => 0, "G" => 0}).

nucleotide_counts(Dna, CountMap) ->
  case Dna of
    [] -> CountMap;
    [Nu | T] -> nucleotide_counts(T, maps:put([Nu], maps:get([Nu], CountMap) + 1, CountMap))
  end.

test_version() -> 1.
