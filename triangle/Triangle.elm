module Triangle exposing (Triangle(..), triangleKind, version)

type Triangle
    = Equilateral
    | Isosceles
    | Scalene

version : Int
version =
    2

triangleKind : comparable -> comparable -> comparable -> Result String Triangle
triangleKind x y z =
    if invalidAttributes x y z then
        Err "Invalid lengths"
    else if invalidTriangle x y z then
        Err "Violates inequality"
    else if isEquilateral x y z then
        Ok Equilateral
    else if isIsosceles x y z then
        Ok Isosceles
    else if isScalene x y z then
        Ok Scalene
    else
        Err "Invalid lengths"

invalidAttributes : comparable -> comparable -> comparable -> Bool
invalidAttributes x y z =
    x <= 0 || y <= 0 || z <= 0

invalidTriangle : comparable -> comparable -> comparable -> Bool
invalidTriangle x y z =
    x + y <= z || x + z <= y || z + y <= x


isEquilateral : comparable -> comparable -> comparable -> Bool
isEquilateral x y z =
    x == y && y == z

isIsosceles : comparable -> comparable -> comparable -> Bool
isIsosceles x y z =
    x == y || y == z || z == x

isScalene : comparable -> comparable -> comparable -> Bool
isScalene x y z =
    x /= y && y /= z && z /= x

