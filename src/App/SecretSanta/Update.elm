module App.SecretSanta.Update exposing (..)

import App.SecretSanta.Messages exposing (Msg(..))
import App.SecretSanta.Models exposing (..)


update : Msg -> List SecretSanta -> ( List SecretSanta, Cmd Msg )
update msg secretSantas =
    case msg of
        _ ->
            ( secretSantas, Cmd.none )
