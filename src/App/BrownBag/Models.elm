module App.BrownBag.Models exposing (..)

import App.Auth.Models exposing (User)


type Status
    = NotDone
    | Done
    | NextInLine


type alias BrownBag =
    { id : Int
    , date : String
    , status : Status
    , user : User
    }


type alias BrownbagModel =
    { loading : Bool
    , brownbags : List BrownBag
    }


initialModel : BrownbagModel
initialModel =
    BrownbagModel False []
