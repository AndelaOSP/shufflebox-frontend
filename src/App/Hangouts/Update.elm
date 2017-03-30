module App.Hangouts.Update exposing (..)

import Navigation
import Paginate exposing (..)
import Routing.Route exposing (Route(..), reverse)
import Models exposing (Model)
import App.Hangouts.Messages exposing (Msg(..))
import App.Hangouts.Models exposing (HangoutModel)
import App.Hangouts.Commands exposing (shuffleHangouts)


update : Msg -> Model -> ( HangoutModel, Cmd Msg )
update msg { hangoutModel, authModel } =
    case msg of
        ListHangouts ->
            ( hangoutModel, Navigation.newUrl (reverse HangoutsRoute) )

        ShuffleHangouts ->
            let
                cmd =
                    shuffleHangouts authModel.token
            in
                ( { hangoutModel
                    | loading = True
                  }
                , cmd
                )

        OnShuffleHangouts (Ok newHangout) ->
            ( { hangoutModel
                | hangout = newHangout
                , loading = False
              }
            , Cmd.none
            )

        OnShuffleHangouts (Err err) ->
            let
                _ =
                    Debug.log "Error shuffling hangouts " err
            in
                ( hangoutModel, Cmd.none )

        OnFetchHangouts (Ok newHangouts) ->
            let
                singleHangout =
                    Maybe.withDefault hangoutModel.hangout (List.head newHangouts)
            in
                ( { hangoutModel
                    | hangout = singleHangout
                    , pGroups = Paginate.fromList 1 singleHangout.groups
                    , loading = False
                  }
                , Cmd.none
                )

        OnFetchHangouts (Err err) ->
            let
                _ =
                    Debug.log "Error fetching hangouts " err
            in
                ( hangoutModel, Cmd.none )

        GoTo index ->
            ( { hangoutModel
                | pGroups = Paginate.goTo index hangoutModel.pGroups
              }
            , Cmd.none
            )

        Next ->
            ( { hangoutModel
                | pGroups = Paginate.next hangoutModel.pGroups
              }
            , Cmd.none
            )

        Prev ->
            ( { hangoutModel
                | pGroups = Paginate.prev hangoutModel.pGroups
              }
            , Cmd.none
            )

        First ->
            ( { hangoutModel
                | pGroups = Paginate.first hangoutModel.pGroups
              }
            , Cmd.none
            )

        Last ->
            ( { hangoutModel
                | pGroups = Paginate.last hangoutModel.pGroups
              }
            , Cmd.none
            )
