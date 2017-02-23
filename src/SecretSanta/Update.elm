module SecretSanta.Update exposing (..)

import SecretSanta.Messages exposing (Msg(..))
import SecretSanta.Models exposing (..)


update : Msg -> List SecretSanta -> ( List SecretSanta, Cmd Msg )
update msg secretSantas =
    case msg of
        _ ->
            ( secretSantas, Cmd.none )
