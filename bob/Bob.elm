module Bob exposing (hey)

import Regex

pattern : String -> Regex.Regex
pattern str =
    Regex.regex str

containsRegex : String -> Regex.Regex -> Bool
containsRegex remark pattern =
    Regex.contains pattern remark

containsBang : String -> Bool
containsBang remark =
    pattern "\\!"
    |> containsRegex remark

containsNumber : String -> Bool
containsNumber remark =
    pattern "\\d+"
    |> containsRegex remark

containsSpecialCharacter : String -> Bool
containsSpecialCharacter remark =
    pattern "\\W{3,}"
    |> containsRegex remark

shouting : String -> Bool
shouting remark =
    String.toUpper remark == remark

asking : String -> Bool
asking remark =
    String.right 1 remark == "?"

hey : String -> String
hey remark =
    if asking remark && shouting remark && not(containsNumber remark) then
        "Calm down, I know what I'm doing!"
    else if asking remark then
        "Sure."
    else if (not(shouting remark) && not(asking remark)) || (containsNumber remark && not(containsBang remark)) then
        "Whatever."
    else if String.isEmpty remark || (containsSpecialCharacter remark && not(asking remark) && not(String.isEmpty remark) && not(containsBang remark)) then
        "Fine. Be that way!"
    else if shouting remark then
        "Whoa, chill out!"
    else
        "Whatever."
