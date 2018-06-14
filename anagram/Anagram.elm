module Anagram exposing (detect)

import Char exposing (..)

isAnagram : String -> String -> Bool
isAnagram candidateWord word =
    String.toUpper candidateWord /= String.toUpper word
    && (
        -- Handles detecting of unicode anagrams
        transformWord (String.toLower candidateWord) ==
        transformWord (String.toLower word)
        || transformWord candidateWord ==
        transformWord word
    )

transformWord : String -> List Char
transformWord word =
    word
    |> String.toList
    |> List.sort 

detect : String -> List String -> List String
detect word candidates =
    List.filter (\ candidateWord -> isAnagram candidateWord word) candidates
