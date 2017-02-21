module App.Models exposing (..)

import BrownBag.Models exposing (BrownBagPresenter)
import Hangouts.Models exposing (Hangout)
import App.Routing as Routing


type alias Model =
    { brownBags : List BrownBagPresenter
    , hangouts : List Hangout
    , route : Routing.Route
    }


initialModel : Routing.Route -> Model
initialModel route =
    { brownBags = []
    , hangouts = []
    , route = route
    }
