module WordCount exposing (wordCount)

import Dict exposing (..)
import Regex exposing (..)

wordCount : String -> Dict String Int
wordCount sentence =
    sentence
    |> String.toLower
    |> removePunctuation
    |> String.words
    |> List.foldr (\w d -> Dict.update w incrOrInit d) Dict.empty

removePunctuation : String -> String
removePunctuation word =
    word
    |> replace All (regex "\\W+") (\_ -> " ")

incrOrInit : Maybe Int -> Maybe Int
incrOrInit maybe =
    Just <| (Maybe.withDefault 0 maybe) + 1