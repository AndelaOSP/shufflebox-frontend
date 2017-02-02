module App.Messages exposing (..)

import Navigation exposing (Location)
import BrownBag.Messages exposing (Msg(..))
import Landing.Messages exposing (Msg(..))


type Msg
    = LandingPageMsg Landing.Messages.Msg
    | BrownBagMsg BrownBag.Messages.Msg
    | OnLocationChange Location
