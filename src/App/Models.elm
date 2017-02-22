module App.Models exposing (..)

import BrownBag.Models exposing (BrownBagPresenter)
import Hangouts.Models exposing (Hangout)
import SecretSanta.Models exposing (SecretSanta)
import App.Routing as Routing


type alias Model =
    { brownBags : List BrownBagPresenter
    , hangouts : List Hangout
    , secretSantas : List SecretSanta
    , route : Routing.Route
    }


initialModel : Routing.Route -> Model
initialModel route =
    { brownBags = []
    , hangouts = []
    , secretSantas = []
    , route = route
    }
