module Raindrops exposing (raindrops)

isDividableBy : Int -> Int -> Bool
isDividableBy m n =
    m % n == 0

raindrops : Int -> String
raindrops number =
    buildString number ""

buildString : Int -> String -> String
buildString number acc =
    acc
    |> resolveDividable number 3
    |> resolveDividable number 5
    |> resolveDividable number 7
    |> resolveNonDividable number

resolveDividable : Int -> Int -> String -> String
resolveDividable number dividable acc =
    case dividable of
        3 ->
            if isDividableBy number 3 then String.append acc "Pling" else acc
        5 ->
            if isDividableBy number 5 then String.append acc "Plang" else acc
        7 ->
            if isDividableBy number 7 then String.append acc "Plong" else acc
        _ ->
            acc

resolveNonDividable : Int -> String -> String
resolveNonDividable number acc =
    case acc of
        "" ->
            toString number
        _ ->
            acc
            
