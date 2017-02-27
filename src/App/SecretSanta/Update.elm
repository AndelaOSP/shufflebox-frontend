module App.SecretSanta.Update exposing (..)

import Navigation
import Routing.Route exposing (Route(..), reverse)
import App.SecretSanta.Messages exposing (Msg(..))
import App.SecretSanta.Models exposing (..)


update : Msg -> List SecretSanta -> ( List SecretSanta, Cmd Msg )
update msg secretSantas =
    case msg of
        ListSecretSanta ->
            ( secretSantas, Navigation.newUrl (reverse SecretSantaRoute) )
