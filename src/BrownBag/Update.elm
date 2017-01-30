module BrownBag.Update exposing (..)

import Navigation
import BrownBag.Models exposing (BrownBag)
import BrownBag.Messages exposing (Msg(..))

update : Msg -> List BrownBag -> (List BrownBag, Cmd Msg)
update msg brownBags =
    case msg of
        ListBrownBags ->
            ( brownBags, Navigation.newUrl "#brownbags" )

        _ ->
            ( brownBags, Cmd.none )
