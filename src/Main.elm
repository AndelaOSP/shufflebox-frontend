module Main exposing (..)

import Navigation exposing (Location)
import Routing.Route as Routing exposing (Route(HomeRoute, AuthRoute))
import Messages exposing (Msg(..))
import Models exposing (Model, initialModel, Flags)
import Update exposing (update)
import View exposing (view)
import App.Update
import App.Auth.Models exposing (Token)
import Common.Utils exposing (isJust)


init : Flags -> Location -> ( Model, Cmd Msg )
init flags location =
    let
        currentRoute =
            Routing.parseLocation location

        initModel =
            initialModel currentRoute

        token =
            extractTokenFromEither flags currentRoute

        ( model, cmd ) =
            if isJust token then
                receiveToken token initModel
            else
                ( initModel, Cmd.none )
    in
        ( model, cmd )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


main : Program Flags Model Msg
main =
    Navigation.programWithFlags OnLocationChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


{-| Extract auth token from either the flags or the current route
-}
extractTokenFromEither : Flags -> Route -> Token
extractTokenFromEither flags route =
    if isJust flags.token then
        flags.token
    else
        case route of
            AuthRoute token ->
                token

            _ ->
                Nothing


{-| Process the extracted token and replace the current route with the
    home route if necessary.
-}
receiveToken : Token -> Model -> ( Model, Cmd Msg )
receiveToken token model =
    let
        ( newModel, cmd ) =
            App.Update.receiveToken token model

        replaceWithHomeCmd =
            replaceWithHome newModel.route
    in
        (newModel ! [ Cmd.map AppMsg cmd, replaceWithHomeCmd ])


{-| Replace auth route with home route
-}
replaceWithHome : Route -> Cmd Msg
replaceWithHome route =
    case route of
        AuthRoute t ->
            Navigation.modifyUrl (Routing.reverse HomeRoute)

        _ ->
            Cmd.none
