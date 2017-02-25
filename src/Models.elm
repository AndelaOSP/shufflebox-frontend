module Models exposing (..)

import App.BrownBag.Models exposing (Presenter)
import App.Hangouts.Models exposing (Hangout)
import App.SecretSanta.Models exposing (SecretSanta)
import Routing.Route as Routing


type alias Model =
    { brownBags : List Presenter
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
