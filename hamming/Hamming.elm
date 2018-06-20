module Hamming exposing (distance)

validateLengths : String -> String -> Bool
validateLengths left right =
    String.length left == String.length right

filterEqual : Char -> Char -> Bool
filterEqual left right =
    left == right

countMatching : (a -> Bool) -> List a -> Int
countMatching func listBools =
    List.filter func listBools
    |> List.length

isFalse : Bool -> Bool
isFalse a =
    a == False

distance : String -> String -> Result String Int
distance left right =
    case validateLengths left right of
        False ->
            Err "left and right strands must be of equal length"
        True ->
            List.map2 filterEqual (String.toList left) (String.toList right)
            |> countMatching isFalse
            |> Ok