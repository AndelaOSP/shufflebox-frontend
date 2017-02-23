module App.Messages exposing (..)

import Navigation exposing (Location)
import BrownBag.Messages exposing (Msg(..))
import Hangouts.Messages exposing (Msg(..))
import SecretSanta.Messages exposing (Msg(..))
import Landing.Messages exposing (Msg(..))


type Msg
    = LandingPageMsg Landing.Messages.Msg
    | BrownBagMsg BrownBag.Messages.Msg
    | HangoutsMsg Hangouts.Messages.Msg
    | SecretSantaMsg SecretSanta.Messages.Msg
    | OnLocationChange Location
