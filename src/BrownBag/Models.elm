module BrownBag.Models exposing (..)


type BrownBagStatus
    = NotDone
    | Done
    | NextInLine


type alias BrownBag =
    { userId : Int
    , name : String
    , email : String
    , avatar : String
    , status : BrownBagStatus
    }
