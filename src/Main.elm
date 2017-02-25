module Main exposing (..)

import App.Messages exposing (Msg(..))
import App.Models exposing (Model, initialModel)
import App.Update exposing (update)
import App.View exposing (view)
import Routing.Route as Routing exposing (Route)
import BrownBag.Commands exposing (getBrownBags)
import Navigation exposing (Location)


init : Location -> ( Model, Cmd Msg )
init location =
    let
        currentRoute =
            Routing.parseLocation location
    in
        ( initialModel currentRoute, Cmd.map BrownBagMsg getBrownBags )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


main : Program Never Model Msg
main =
    Navigation.program OnLocationChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
