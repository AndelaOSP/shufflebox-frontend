module Update exposing (update)

import Navigation
import Routing.Route exposing (reverse, parseLocation, Route(AuthRoute, LoginRoute))
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

                cmd =
                    redirectToLogin location newRoute
            in
                ( { model | route = newRoute }, cmd )


redirectToLogin : Navigation.Location -> Route -> Cmd Msg
redirectToLogin location route =
    case route of
        AuthRoute Nothing ->
            Navigation.load (reverse <| LoginRoute location)

        _ ->
            Cmd.none
