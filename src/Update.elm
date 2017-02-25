module Update exposing (..)

import Routing.Route exposing (parseLocation)
import Messages exposing (Msg(..))
import Models exposing (Model)
import App.BrownBag.Update as BrownBag exposing (..)
import App.Hangouts.Update as Hangouts exposing (..)
import App.SecretSanta.Update as SecretSanta exposing (..)
import Landing.Update exposing (update)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        BrownBagMsg subMsg ->
            let
                ( updatedBrownBags, cmd ) =
                    BrownBag.update subMsg model.brownBags
            in
                ( { model | brownBags = updatedBrownBags }, Cmd.map BrownBagMsg cmd )

        LandingPageMsg subMsg ->
            let
                ( state, cmd ) =
                    Landing.Update.update subMsg model
            in
                ( state, Cmd.map LandingPageMsg cmd )

        HangoutsMsg subMsg ->
            let
                ( updatedHangouts, cmd ) =
                    Hangouts.update subMsg model.hangouts
            in
                ( { model | hangouts = updatedHangouts }, Cmd.map HangoutsMsg cmd )

        SecretSantaMsg subMsg ->
            let
                ( updatedSecretSantas, cmd ) =
                    SecretSanta.update subMsg model.secretSantas
            in
                ( { model | secretSantas = updatedSecretSantas }, Cmd.map SecretSantaMsg cmd )

        OnLocationChange location ->
            let
                newRoute =
                    parseLocation location
            in
                ( { model | route = newRoute }, Cmd.none )
