module App.Update exposing (update, receiveToken)

import Models exposing (Model, initialModel)
import Routing.Route exposing (Route(HomeRoute))
import App.Messages exposing (Msg(..))
import App.Auth.Models exposing (Token)
import App.Auth.Update as Auth
import App.Auth.Messages as AuthMessage
import App.Auth.Ports as AuthPorts
import App.BrownBag.Update as BrownBag
import App.BrownBag.Commands exposing (hydrateBrownbagData)
import App.Hangouts.Update as Hangouts
import App.Hangouts.Commands exposing (getHangouts)
import App.SecretSanta.Update as SecretSanta
import App.SecretSanta.Commands exposing (getSecretSantas)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        BrownBagMsg subMsg ->
            let
                ( updatedBrownbagModel, cmd ) =
                    BrownBag.update subMsg model
            in
                ( { model
                    | brownbag = updatedBrownbagModel
                  }
                , Cmd.map BrownBagMsg cmd
                )

        HangoutsMsg subMsg ->
            let
                ( updatedHangouts, cmd ) =
                    Hangouts.update subMsg model
            in
                ( { model | hangoutModel = updatedHangouts }, Cmd.map HangoutsMsg cmd )

        SecretSantaMsg subMsg ->
            let
                ( updatedSecretSantas, cmd ) =
                    SecretSanta.update subMsg model.secretSantas
            in
                ( { model | secretSantas = updatedSecretSantas }, Cmd.map SecretSantaMsg cmd )

        AuthMsg subMsg ->
            let
                ( newAuth, cmd ) =
                    Auth.update subMsg model.authModel
            in
                ( { model | authModel = newAuth }, Cmd.map AuthMsg cmd )

        Logout ->
            ( initialModel HomeRoute, AuthPorts.removeToken Nothing )


{-| Receive a token, authenticate the user and issue the necessary commands
    to fetch app data
-}
receiveToken : Token -> Model -> ( Model, Cmd Msg )
receiveToken token model =
    let
        ( newModel, cmd ) =
            update (AuthMsg <| AuthMessage.ReceiveToken token) model
    in
        (newModel
            ! [ (Cmd.map BrownBagMsg <| Cmd.batch <| hydrateBrownbagData token)
              , (Cmd.map HangoutsMsg <| getHangouts token)
              , (Cmd.map SecretSantaMsg <| getSecretSantas token)
              , cmd
              ]
        )
