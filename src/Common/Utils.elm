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
