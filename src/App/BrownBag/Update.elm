module App.BrownBag.Update exposing (..)

import Navigation
import Routing.Route exposing (Route(..), reverse)
import App.BrownBag.Models exposing (BrownBag)
import App.BrownBag.Messages exposing (Msg(..))


update : Msg -> List BrownBag -> ( List BrownBag, Cmd Msg )
update msg brownBags =
    case msg of
        ListBrownBags ->
            ( brownBags, Navigation.newUrl (reverse BrownBagsRoute) )

        OnFetchBrownBags (Ok newBrownBags) ->
            ( newBrownBags, Cmd.none )

        OnFetchBrownBags (Err err) ->
            let
                _ =
                    Debug.log "Error decoding brownBags" err
            in
                ( brownBags, Cmd.none )

        _ ->
            ( brownBags, Cmd.none )
