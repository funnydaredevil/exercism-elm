module DifferenceOfSquares exposing (difference, squareOfSum, sumOfSquares)

squareOfSum : Int -> Int
squareOfSum n =
    List.range 1 n
    |> List.sum
    |> \n -> n^2

sumOfSquares : Int -> Int
sumOfSquares n =
    List.range 1 n
    |> List.map (\n -> n^2)
    |> List.sum

difference : Int -> Int
difference n =
    sumOfSquares n - squareOfSum n
    |> Basics.abs
