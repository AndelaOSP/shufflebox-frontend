module App.Hangouts.Models exposing (..)

import Paginate exposing (PaginatedList)
import App.Auth.Models exposing (User)


type alias Hangout =
    { id : Maybe Int
    , date : Maybe String
    , groups : List Group
    }


type alias Group =
    { groupId : Int
    , members : List User
    }


type alias HangoutModel =
    { loading : Bool
    , hangout : Hangout
    , pGroups : PaginatedList Group
    }


hangoutInitialModel : HangoutModel
hangoutInitialModel =
    HangoutModel False (Hangout Nothing Nothing []) (Paginate.fromList 1 [])
