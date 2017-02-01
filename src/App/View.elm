module App.View exposing (..)

import Html exposing (..)
import App.Models exposing (Model)
import App.Messages exposing (Msg(..))
import App.Routing exposing (Route(..))
import Landing.Home
import Landing.About
import Landing.Faq
import BrownBag.View


view : Model -> Html Msg
view model =
    div []
        [ page model ]


page : Model -> Html Msg
page model =
    case model.route of
        HomeRoute ->
            Html.map LandingPageMsg (Landing.Home.view)

        AboutRoute ->
            Html.map LandingPageMsg (Landing.About.view)

        FaqRoute ->
            Html.map LandingPageMsg (Landing.Faq.view)

        BrownBagsRoute ->
            Html.map BrownBagMsg (BrownBag.View.view model.brownBags)

        NotFoundRoute ->
            notFoundView


notFoundView : Html msg
notFoundView =
    div []
        [ text "Not Found" ]
