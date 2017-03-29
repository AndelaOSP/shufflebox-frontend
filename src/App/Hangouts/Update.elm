module App.Hangouts.Update exposing (..)

import Navigation
import Routing.Route exposing (Route(..), reverse)
import Models exposing (Model)
import App.Hangouts.Messages exposing (Msg(..))
import App.Hangouts.Models exposing (HangoutModel)
import App.Hangouts.Commands exposing (shuffleHangouts)


update : Msg -> Model -> ( HangoutModel, Cmd Msg )
update msg { hangoutsModel, authModel } =
    case msg of
        ListHangouts ->
            ( hangoutsModel, Navigation.newUrl (reverse HangoutsRoute) )

        ShuffleHangouts ->
            let
                cmd =
                    shuffleHangouts authModel.token
            in
                ( { hangoutsModel
                    | loading = True
                  }
                , cmd
                )

        OnShuffleHangouts (Ok newHangout) ->
            ( { hangoutsModel
                | hangouts = newHangout :: hangoutsModel.hangouts
                , loading = False
              }
            , Cmd.none
            )

        OnShuffleHangouts (Err err) ->
            let
                _ =
                    Debug.log "Error shuffling hangouts " err
            in
                ( hangoutsModel, Cmd.none )

        OnFetchHangouts (Ok newHangouts) ->
            ( { hangoutsModel
                | hangouts = newHangouts
                , loading = False
              }
            , Cmd.none
            )

        OnFetchHangouts (Err err) ->
            let
                _ =
                    Debug.log "Error fetching hangouts " err
            in
                ( hangoutsModel, Cmd.none )
