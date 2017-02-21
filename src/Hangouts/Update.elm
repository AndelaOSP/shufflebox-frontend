module Hangouts.Update exposing (..)

import Hangouts.Messages exposing (Msg(..))
import Hangouts.Models exposing (..)


update : Msg -> List Hangout -> ( List Hangout, Cmd Msg )
update msg hangouts =
    case msg of
        _ ->
            ( hangouts, Cmd.none )
