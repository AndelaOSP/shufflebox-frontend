module App.Hangouts.Models exposing (..)

import App.Auth.Models exposing (User)


type alias Hangout =
    { id : Int
    , date : String
    , groups : List Group
    }


type alias Group =
    { groupId : Int
    , members : List User
    }


type alias HangoutModel =
    { loading : Bool
    , hangouts : List Hangout
    }


hangoutInitialModel : HangoutModel
hangoutInitialModel =
    HangoutModel False []
