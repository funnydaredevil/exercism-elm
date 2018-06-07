module TwelveDays exposing (recite)

commonWords: String
commonWords = "day of Christmas my true love gave to me"

stringifyNumber: Int -> String
stringifyNumber number =
    case number of
        1 -> "first"
        2 -> "second"
        3 -> "third"
        4 -> "fourth"
        5 -> "fifth"
        6 -> "sixth"
        7 -> "seventh"
        8 -> "eighth"
        9 -> "ninth"
        10 -> "tenth"
        11 -> "eleventh"
        12 -> "twelfth"
        _ -> ""

givenItemByDay: Int -> String
givenItemByDay number =
    case number of
        1 -> "Partridge in a Pear Tree"
        2 -> "two Turtle Doves"
        3 -> "three French Hens"
        4 -> "four Calling Birds"
        5 -> "five Gold Rings"
        6 -> "six Geese-a-Laying"
        7 -> "seven Swans-a-Swimming"
        8 -> "eight Maids-a-Milking"
        9 -> "nine Ladies Dancing"
        10 -> "ten Lords-a-Leaping"
        11 -> "eleven Pipers Piping"
        12 -> "twelve Drummers Drumming"
        _ -> ""

givenItemsList: Int -> String -> String
givenItemsList number acc =
    case number of
        1 -> givenItemByDay 1
            |> String.append (acc ++ ", and a ")    
        number -> givenItemByDay number
            |> givenItemsList (number - 1)
            |> String.append (acc ++ ", ")

prefix: Int -> String
prefix number =
    "On the " ++ stringifyNumber number ++ " "

buildPoem : Int -> Int -> String
buildPoem start stop =
    prefix(start) ++ commonWords ++ givenItemsList start "" ++ "."


recite : Int -> Int -> List String
recite start stop =
    List.range start stop
    |> List.map
    |> buildPoem
