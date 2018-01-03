-module(rna_transcription).

-export([to_rna/1, test_version/0]).


to_rna(Strand) ->
  try [nucleotide_pair(X) || X <- Strand]
  catch
    error:_ -> error
  end.

nucleotide_pair($A) -> $U;
nucleotide_pair($C) -> $G;
nucleotide_pair($G) -> $C;
nucleotide_pair($T) -> $A.

test_version() -> 2.
