module Models exposing (..)

import App.BrownBag.Models as BrownbagModel
import App.Hangouts.Models exposing (HangoutModel, hangoutInitialModel)
import App.SecretSanta.Models exposing (SecretSanta)
import App.Auth.Models
import Routing.Route as Routing


type alias Flags =
    { token : App.Auth.Models.Token
    }


type alias Model =
    { brownbag : BrownbagModel.BrownbagModel
    , hangoutModel : HangoutModel
    , secretSantas : List SecretSanta
    , route : Routing.Route
    , authModel : App.Auth.Models.Model
    }


initialModel : Routing.Route -> Model
initialModel route =
    { brownbag = BrownbagModel.initialModel
    , hangoutModel = hangoutInitialModel
    , secretSantas = []
    , route = route
    , authModel = App.Auth.Models.initialModel Nothing
    }
