module Landing.View exposing (view)

import Html exposing (Html, div)
import Models exposing (Model)
import Routing.Route exposing (Route(..))
import Landing.Messages exposing (Msg)
import Landing.Nav exposing (navBar)
import Landing.Footer exposing (pageFooter)
import Landing.About
import Landing.Faq
import Landing.Home


view : Model -> Html Msg
view model =
    div []
        [ navBar
        , currentView model
        , pageFooter
        ]


currentView : Model -> Html Msg
currentView model =
    case model.route of
        HomeRoute ->
            Landing.Home.view

        AboutRoute ->
            Landing.About.view

        FaqRoute ->
            Landing.Faq.view

        _ ->
            Landing.Home.view
