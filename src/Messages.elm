module Messages exposing (..)

import Navigation exposing (Location)
import App.BrownBag.Messages as BrownBag exposing (Msg(..))
import App.Hangouts.Messages as Hangouts exposing (Msg(..))
import App.SecretSanta.Messages as SecretSanta exposing (Msg(..))
import Landing.Messages exposing (Msg(..))


type Msg
    = LandingPageMsg Landing.Messages.Msg
    | BrownBagMsg BrownBag.Msg
    | HangoutsMsg Hangouts.Msg
    | SecretSantaMsg SecretSanta.Msg
    | OnLocationChange Location
