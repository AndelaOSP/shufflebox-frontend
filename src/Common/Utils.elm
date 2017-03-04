module Common.Utils exposing (..)


brandUrl : String
brandUrl =
    "https://www.dropbox.com/s/okgmtdpih1xxau3/Shuffle.png?raw=1"


loginAPIUrl : String
loginAPIUrl =
    "http://api-staging.andela.com/login"


isJust : Maybe a -> Bool
isJust aMaybe =
    case aMaybe of
        Just a ->
            True

        Nothing ->
            False
