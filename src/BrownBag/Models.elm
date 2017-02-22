module BrownBag.Models exposing (..)


type Status
    = NotDone
    | Done
    | NextInLine


type alias Presenter =
    { id : Int
    , name : String
    , email : String
    , avatar : String
    , date : Maybe String
    , status : Status
    }
