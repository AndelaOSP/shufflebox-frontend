module SecretSanta.Models exposing (..)


type alias SecretSanta =
    { date : String
    , pairs : List Pair
    }


type alias Pair =
    { id : String
    , santa : Person
    , giftee : Person
    }


type alias Person =
    { user_id : String
    , name : String
    , email : String
    , avatar : String
    }
