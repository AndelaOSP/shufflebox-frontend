module BrownBag.Models exposing (..)


type BrownBagStatus
    = NotDone
    | Done
    | NextInLine


type alias BrownBag =
    { id : Int
    , name : String
    , email : String
    , avatar : String
    , date : String
    , status : BrownBagStatus
    }
