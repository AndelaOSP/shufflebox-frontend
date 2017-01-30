module App.Models exposing (..)

import BrownBag.Models exposing (BrownBag)
import App.Routing as Routing


type alias Model =
    { brownBags : List BrownBag
    , route : Routing.Route
    }


initialModel : Routing.Route -> Model
initialModel route =
    { brownBags = []
    , route = route
    }
