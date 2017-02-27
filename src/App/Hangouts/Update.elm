module App.Hangouts.Update exposing (..)

import Navigation
import Routing.Route exposing (Route(..), reverse)
import App.Hangouts.Messages exposing (Msg(..))
import App.Hangouts.Models exposing (..)


update : Msg -> List Hangout -> ( List Hangout, Cmd Msg )
update msg hangouts =
    case msg of
        ListHangouts ->
            ( hangouts, Navigation.newUrl (reverse HangoutsRoute) )
