module ScrabbleScore exposing (scoreWord)

import Set exposing (..)

wordValue : Char -> Int
wordValue letter =
    if Set.member letter (Set.fromList ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T']) then
        1
    else if Set.member letter (Set.fromList ['D', 'G']) then
        2
    else if Set.member letter (Set.fromList ['B', 'C', 'M', 'P']) then
        3
    else if Set.member letter (Set.fromList ['F', 'H', 'V', 'W', 'Y']) then
        4
    else if Set.member letter (Set.fromList ['K']) then
        5
    else if Set.member letter (Set.fromList ['J', 'X']) then
        8
    else if Set.member letter (Set.fromList ['Q', 'Z']) then
        10
    else
        0

scoreWord : String -> Int
scoreWord x =
    x
    |> String.toUpper
    |> String.toList
    |> List.map wordValue
    |> List.sum
