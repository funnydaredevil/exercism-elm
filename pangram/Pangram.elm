module Pangram exposing (isPangram)

import Array exposing (..)
import Set exposing (..)

initialAlphabet : Set String
initialAlphabet =
    Set.fromList ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]

isSetSizeEqual : Set a -> Set b -> Bool
isSetSizeEqual a b =
    Set.size a == Set.size b

intersectWithAlphabet : Set String -> Set String
intersectWithAlphabet sentence =
    sentence
    |> Set.intersect initialAlphabet

isPangram : String -> Bool
isPangram sentence =
    sentence
    |> String.toUpper
    |> String.split ""
    |> Set.fromList
    |> intersectWithAlphabet
    |> isSetSizeEqual initialAlphabet
