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

        OnFetchSecretSantas (Ok newSecretSantas) ->
            ( newSecretSantas, Cmd.none )

        OnFetchSecretSantas (Err error) ->
            let
                _ =
                    Debug.log "Error fetching secret santas" error
            in
                ( secretSantas, Cmd.none )
