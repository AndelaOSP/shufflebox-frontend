module App.Update exposing (..)

import App.Routing exposing (parseLocation)
import App.Messages exposing (Msg(..))
import App.Models exposing (Model)
import BrownBag.Update exposing (..)
import Landing.Update exposing (update)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        BrownBagMsg subMsg ->
            let
                ( updatedBrownBags, cmd ) =
                    BrownBag.Update.update subMsg model.brownBags
            in
                ( { model | brownBags = updatedBrownBags }, Cmd.map BrownBagMsg cmd )

        LandingPageMsg subMsg ->
            let
                ( state, cmd ) =
                    Landing.Update.update subMsg model
            in
                ( state, Cmd.none )

        OnLocationChange location ->
            let
                newRoute =
                    parseLocation location
            in
                ( { model | route = newRoute }, Cmd.none )
