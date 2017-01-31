module App.Models exposing (..)

import BrownBag.Models exposing (BrownBagPresenter)
import App.Routing as Routing


type alias Model =
    { brownBags : List BrownBagPresenter
    , route : Routing.Route
    }


initialModel : Routing.Route -> Model
initialModel route =
    { brownBags = []
    , route = route
    }
