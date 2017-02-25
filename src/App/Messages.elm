module App.Messages exposing (..)

import App.BrownBag.Messages as BrownBag exposing (Msg(..))
import App.Hangouts.Messages as Hangouts exposing (Msg(..))
import App.SecretSanta.Messages as SecretSanta exposing (Msg(..))


type Msg
    = BrownBagMsg BrownBag.Msg
    | HangoutsMsg Hangouts.Msg
    | SecretSantaMsg SecretSanta.Msg
    | ShowBrownBags
    | ShowHangouts
    | ShowSecretSanta
