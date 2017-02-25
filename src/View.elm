module View exposing (..)

import Html exposing (..)
import Models exposing (Model)
import Messages exposing (Msg(..))
import Routing.Route exposing (Route(..))
import Landing.View as Landing
import App.View as App


view : Model -> Html Msg
view model =
    div []
        [ page model ]


page : Model -> Html Msg
page model =
    case model.route of
        HomeRoute ->
            Html.map LandingPageMsg (Landing.view model)

        AboutRoute ->
            Html.map LandingPageMsg (Landing.view model)

        FaqRoute ->
            Html.map LandingPageMsg (Landing.view model)

        BrownBagsRoute ->
            Html.map AppMsg (App.view model)

        HangoutsRoute ->
            Html.map AppMsg (App.view model)

        SecretSantaRoute ->
            Html.map AppMsg (App.view model)

        NotFoundRoute ->
            notFoundView


notFoundView : Html msg
notFoundView =
    div []
        [ text "Not Found" ]
