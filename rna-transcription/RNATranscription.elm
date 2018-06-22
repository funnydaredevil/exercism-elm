module RNATranscription exposing (toRNA)

convert : String -> String
convert input =
    case input of
        "G" -> "C"
        "C" -> "G"
        "T" -> "A"
        "A" -> "U"
        _ -> ""

toRNA : String -> Result Char String
toRNA dna =
    String.split "" dna
    |> List.map (\n -> convert n)
    |> String.concat
    |> Ok
