module Leap exposing (isLeapYear)

isEven : Int -> Int -> Bool
isEven n m =
    n % m == 0

isLeapYear : Int -> Bool
isLeapYear year =
    isEven year 4 &&
    not(isEven year 100) ||
    isEven year 400
