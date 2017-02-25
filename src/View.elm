module View exposing (..)

import Html exposing (..)
import Models exposing (Model)
import Messages exposing (Msg(..))
import Routing.Route exposing (Route(..))
import Landing.View as Landing
import App.BrownBag.View as BrownBag
import App.Hangouts.View as Hangouts
import App.SecretSanta.View as SecretSanta


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
            Html.map BrownBagMsg (BrownBag.view model.brownBags)

        HangoutsRoute ->
            Html.map HangoutsMsg (Hangouts.view)

        SecretSantaRoute ->
            Html.map SecretSantaMsg (SecretSanta.view)

        NotFoundRoute ->
            notFoundView


notFoundView : Html msg
notFoundView =
    div []
        [ text "Not Found" ]
