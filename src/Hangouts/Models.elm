module Hangouts.Models exposing (..)


type alias Hangout =
    { date : List Group
    }


type alias Group =
    { id : String
    , members : List Member
    }


type alias Member =
    { user_id : String
    , name : String
    , email : String
    , avatar : String
    }
