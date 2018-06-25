module RunLengthEncoding exposing (decode, encode, version)


version =
    2

partition : { char: Char, counter: Int }
partition = { char = ' ', counter = 0 }

parseNext : Char -> (List { char : Char, counter : Int }) -> (List { char : Char, counter : Int })
parseNext char acc =
    case acc |> List.reverse |> List.head of
        Just character ->
            { partition | counter = partition.counter + 1
                        , char = char
            } :: acc
        Nothing ->
            { partition | counter = partition.counter + 1
                        , char = char
            } :: []

replaceNumbers : Int -> String
replaceNumbers num =
    case num of
        0 -> ""
        1 -> ""
        _ -> toString num
            

buildString : List { char : Char, counter : Int } -> String
buildString acc =
    acc
    |> List.map (\chunk -> (replaceNumbers chunk.counter) ++ (String.fromChar chunk.char))
    |> String.join ""

encode : String -> String
encode string =
    String.toList string
    |> List.map (\a -> parseNext a [partition] |> buildString)
    |> String.join ""

decode : String -> String
decode string =
    String.toList string
    |> List.map (\a -> parseNext a [partition] |> buildString)
    |> String.join ""
    
