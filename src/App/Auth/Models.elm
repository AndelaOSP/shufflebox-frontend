module App.Auth.Models exposing (..)

import Common.Utils exposing (isJust)


type alias Token =
    Maybe String


type alias Model =
    { token : Token
    , isAuthenticated : Bool
    }


initialModel : Token -> Model
initialModel token =
    { token = token
    , isAuthenticated = hasToken token
    }


hasToken : Token -> Bool
hasToken =
    isJust
