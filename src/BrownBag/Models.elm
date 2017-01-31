module BrownBag.Models exposing (..)


type BrownBagStatus
    = NotDone
    | Done
    | NextInLine


type alias BrownBagPresenter =
    { id : Int
    , name : String
    , email : String
    , avatar : String
    , date : Maybe String
    , status : BrownBagStatus
    }
