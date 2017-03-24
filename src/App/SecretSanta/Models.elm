module App.SecretSanta.Models exposing (..)

import App.Auth.Models exposing (User)


type alias SecretSanta =
    { id : Int
    , date : String
    , santa : User
    , giftee : User
    }
