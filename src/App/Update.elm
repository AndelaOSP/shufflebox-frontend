module App.Update exposing (update)

import Models exposing (Model)
import App.Messages exposing (Msg(..))
import App.BrownBag.Update as BrownBag
import App.Hangouts.Update as Hangouts
import App.SecretSanta.Update as SecretSanta


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        BrownBagMsg subMsg ->
            let
                ( updatedBrownBags, cmd ) =
                    BrownBag.update subMsg model.brownBags
            in
                ( { model | brownBags = updatedBrownBags }, Cmd.map BrownBagMsg cmd )

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
