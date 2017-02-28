module App.Hangouts.Models exposing (..)


type alias Hangout =
    { date : String
    , groups : List Group
    }


type alias Group =
    { groupId : String
    , members : List Member
    }


type alias Member =
    { userId : String
    , name : String
    , email : String
    , avatar : String
    }
