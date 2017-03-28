module App.Hangouts.Update exposing (..)

import Navigation
import Routing.Route exposing (Route(..), reverse)
import Models exposing (Model)
import App.Hangouts.Messages exposing (Msg(..))
import App.Hangouts.Models exposing (..)
import App.Hangouts.Commands exposing (shuffleHangouts)


update : Msg -> Model -> ( List Hangout, Cmd Msg )
update msg { hangouts, authModel } =
    case msg of
        ListHangouts ->
            ( hangouts, Navigation.newUrl (reverse HangoutsRoute) )
        
        ShuffleHangouts ->
            let
              cmd =
                shuffleHangouts authModel.token
            in
                (hangouts, cmd)

        OnFetchHangouts (Ok newHangouts) ->
            ( newHangouts, Cmd.none )

        OnFetchHangouts (Err err) ->
            let
                _ = Debug.log "Error fetching hangouts " err
            in
                ( hangouts, Cmd.none )
