module Update exposing (..)

import Routing.Route exposing (parseLocation)
import Messages exposing (Msg(..))
import Models exposing (Model)
import App.Update
import Landing.Update exposing (update)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        LandingPageMsg subMsg ->
            let
                ( state, cmd ) =
                    Landing.Update.update subMsg model
            in
                ( state, Cmd.map LandingPageMsg cmd )

        AppMsg subMsg ->
            let
                ( state, cmd ) =
                    App.Update.update subMsg model
            in
                ( state, Cmd.map AppMsg cmd )

        OnLocationChange location ->
            let
                newRoute =
                    parseLocation location
            in
                ( { model | route = newRoute }, Cmd.none )
