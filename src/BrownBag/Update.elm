module BrownBag.Update exposing (..)

import Navigation
import BrownBag.Models exposing (BrownBagPresenter)
import BrownBag.Messages exposing (Msg(..))


update : Msg -> List BrownBagPresenter -> ( List BrownBagPresenter, Cmd Msg )
update msg brownBags =
    case msg of
        ListBrownBags ->
            ( brownBags, Navigation.newUrl "#brownbags" )

        OnFetchAll (Ok newBrownBags) ->
            ( newBrownBags, Cmd.none )

        OnFetchAll (Err _) ->
            ( brownBags, Cmd.none )

        _ ->
            ( brownBags, Cmd.none )
