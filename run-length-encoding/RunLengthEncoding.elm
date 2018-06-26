module RunLengthEncoding exposing (decode, encode, version)


version =
    2

partition : { char: Char, counter: Int }
partition = { char = ' ', counter = 0 }

reduceString : List Char -> (List { char : Char, counter : Int }) -> List { char : Char, counter : Int }
reduceString char acc =
    List.foldr parseNext acc char

parseNext : Char -> (List { char : Char, counter : Int }) -> (List { char : Char, counter : Int })
parseNext char acc =
    let
        last = acc |> List.reverse |> List.head
        -- character = (Just last).char
    in
        case last of
            char ->
                {  counter = { | .counter} + 1
                       , char = char
                }
                -- { partition | counter = partition.counter + 1
                --             , char = char
                -- } :: acc
            Nothing ->
                { partition | counter = 0
                            , char = ' '
                } :: acc

encodeString : Int -> String
encodeString num =
    case num of
        0 -> "0"
        1 -> "1"
        _ -> toString num
            

buildString : List { char : Char, counter : Int } -> String
buildString acc =
    acc
    |> List.map (\chunk -> (encodeString chunk.counter) ++ (String.fromChar chunk.char))
    |> String.join ""
    |> String.trim

encode : String -> String
encode string =
    -- String.toList string
    -- |> List.map (\a -> reduceString a [partition] |> buildString)
    -- |> List.map (\a -> parseNext a [partition] |> buildString)
    reduceString (String.toList string) [partition]
    |> buildString
    -- |> String.join ""

decode : String -> String
decode string =
    String.toList string
    |> List.map (\a -> parseNext a [partition] |> buildString)
    |> String.join ""
    
