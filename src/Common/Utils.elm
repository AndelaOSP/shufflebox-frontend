module Common.Utils exposing (..)


brandUrl : String
brandUrl =
    "https://www.dropbox.com/s/okgmtdpih1xxau3/Shuffle.png?raw=1"


loginAPIUrl : String
loginAPIUrl =
    "http://api-staging.andela.com/login"


hangoutsUrl : String
hangoutsUrl =
    baseUrl ++ "/hangouts/"


shuffleUrl : String
shuffleUrl =
    baseUrl ++ "/shuffle/"


baseUrl : String
baseUrl =
    "http://127.0.0.1:8000/api"


isJust : Maybe a -> Bool
isJust aMaybe =
    case aMaybe of
        Just a ->
            True

        Nothing ->
            False


{-| Call a function using the results of calling two other functions with the
    same argument.
-}
fork : (( a, b ) -> c) -> (d -> a) -> (d -> b) -> d -> c
fork lastly first other x =
    lastly ( first x, other x )
