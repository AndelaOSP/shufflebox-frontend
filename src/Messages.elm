module Messages exposing (..)

import Navigation exposing (Location)
import Landing.Messages exposing (Msg(..))
import App.Messages


type Msg
    = LandingPageMsg Landing.Messages.Msg
    | AppMsg App.Messages.Msg
    | OnLocationChange Location
