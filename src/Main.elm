module Main exposing (..)

import Messages exposing (Msg(..))
import Models exposing (Model, initialModel)
import Update exposing (update)
import View exposing (view)
import Routing.Route as Routing exposing (Route)
import App.Messages
import App.BrownBag.Commands exposing (getBrownBags)
import App.Hangouts.Commands exposing (getHangouts)
import App.SecretSanta.Commands exposing (getSecretSantas)
import Navigation exposing (Location)


init : Location -> ( Model, Cmd Msg )
init location =
    let
        currentRoute =
            Routing.parseLocation location
    in
        ( initialModel currentRoute
        , Cmd.map AppMsg <|
            Cmd.batch
                [ (Cmd.map App.Messages.BrownBagMsg getBrownBags)
                , (Cmd.map App.Messages.HangoutsMsg getHangouts)
                , (Cmd.map App.Messages.SecretSantaMsg getSecretSantas)
                ]
        )


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
