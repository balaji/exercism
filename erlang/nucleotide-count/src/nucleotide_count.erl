-module(nucleotide_count).

-export([count/2, nucleotide_counts/1, test_version/0]).

nucleotide_counts(Dna) ->
  CountMap = nucleotide_counts_map(Dna),
  [{"A", maps:get("A", CountMap)},
    {"T", maps:get("T", CountMap)},
    {"C", maps:get("C", CountMap)},
    {"G", maps:get("G", CountMap)}].

count(Dna, [Nu | _]) when Nu =:= $A; Nu =:= $C; Nu =:= $G; Nu =:= $T -> maps:get([Nu], nucleotide_counts_map(Dna));
count(_, _) -> error("Invalid nucleotide").

nucleotide_counts_map(Dna) -> nucleotide_counts(Dna, #{"A" => 0, "T" => 0, "C" => 0, "G" => 0}).

nucleotide_counts([], CountMap) -> CountMap;
nucleotide_counts([Nu | T], CountMap) ->
  nucleotide_counts(T, maps:put([Nu], maps:get([Nu], CountMap) + 1, CountMap)).

test_version() -> 1.
