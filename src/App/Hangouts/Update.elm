module App.Hangouts.Update exposing (..)

import App.Hangouts.Messages exposing (Msg(..))
import App.Hangouts.Models exposing (..)


update : Msg -> List Hangout -> ( List Hangout, Cmd Msg )
update msg hangouts =
    case msg of
        _ ->
            ( hangouts, Cmd.none )
