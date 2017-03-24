module Models exposing (..)

import App.BrownBag.Models exposing (BrownBag)
import App.Hangouts.Models exposing (Hangout)
import App.SecretSanta.Models exposing (SecretSanta)
import App.Auth.Models
import Routing.Route as Routing


type alias Flags =
    { token : App.Auth.Models.Token
    }


type alias Model =
    { brownBags : List BrownBag
    , hangouts : List Hangout
    , secretSantas : List SecretSanta
    , route : Routing.Route
    , authModel : App.Auth.Models.Model
    }


initialModel : Routing.Route -> Model
initialModel route =
    { brownBags = []
    , hangouts = []
    , secretSantas = []
    , route = route
    , authModel = App.Auth.Models.initialModel Nothing
    }
