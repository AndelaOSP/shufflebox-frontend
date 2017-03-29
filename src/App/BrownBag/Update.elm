module App.BrownBag.Update exposing (..)

import Navigation
import Routing.Route exposing (Route(..), reverse)
import Models exposing (Model)
import App.BrownBag.Models exposing (BrownbagModel, BrownBag)
import App.BrownBag.Messages exposing (Msg(..))
import App.BrownBag.Commands exposing (shuffleBrownbag)


update : Msg -> Model -> ( BrownbagModel, Cmd Msg )
update msg ({ brownbag, authModel } as model) =
    case msg of
        ListBrownBags ->
            ( brownbag, Navigation.newUrl (reverse BrownBagsRoute) )

        OnFetchBrownBags (Ok newBrownBags) ->
            ( { brownbag | brownbags = newBrownBags }, Cmd.none )

        OnFetchBrownBags (Err err) ->
            let
                _ =
                    Debug.log "Error decoding brownBags" err
            in
                ( brownbag, Cmd.none )

        ShuffleBrownBag ->
            ( { brownbag | loading = True }, shuffleBrownbag authModel.token )

        OnShuffleBrownbag (Ok newBrownbag) ->
            let
                newBrownbagModel =
                    { brownbag
                        | brownbags = newBrownbag :: brownbag.brownbags
                        , loading = False
                    }
            in
                ( newBrownbagModel, Cmd.none )

        OnShuffleBrownbag (Err err) ->
            let
                _ =
                    Debug.log "Error shuffling brownbag" err
            in
                ( { brownbag | loading = False }, Cmd.none )
