module Anagram exposing (detect)

compareWith : List String -> String -> List String
compareWith candidates word =
    functionBody

detect : String -> List String -> List String
detect word candidates =
    candidates
    |> compareWith word
