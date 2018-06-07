module HelloWorld exposing (helloWorld)

-- It's good style to include any types at the top level of your modules.


helloWorld : Maybe String -> String
helloWorld name =
    case name of
        Nothing ->
            "Hello, World!"
        Just name ->
            "Hello, " ++ name ++ "!"
