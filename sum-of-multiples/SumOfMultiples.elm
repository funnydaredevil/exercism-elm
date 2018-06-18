module SumOfMultiples exposing (sumOfMultiples)

import Set exposing (..)

findMultiples : Int -> Int -> List Int
findMultiples number multiple =
    number - 1
    |> List.range 1
    |> List.filter (\n -> rem n multiple == 0)

sumUniqueValues : List Int -> Int
sumUniqueValues list =
    list |> Set.fromList |> Set.toList |> List.sum

sumOfMultiples : List Int -> Int -> Int
sumOfMultiples multiples limit =
    multiples
    |> List.map (\n -> findMultiples limit n)
    |> List.concat |> sumUniqueValues
