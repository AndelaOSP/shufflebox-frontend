module App.View exposing (view)

import Html exposing (Html, div)
import Html.Attributes exposing (class)
import Models exposing (Model)
import Routing.Route exposing (Route(..))
import App.Messages exposing (Msg(..))
import App.BrownBag.View as BrownBag
import App.SecretSanta.View as SecretSanta
import App.Hangouts.View as Hangouts
import App.Common.SideNav exposing (sideNav)
import App.Common.Nav exposing (navBar)


view : Model -> Html Msg
view model =
    div [ class "container" ]
        [ sideNav
        , div [ class "container--content" ]
            [ navBar
            , currentView model
            ]
        ]


currentView : Model -> Html Msg
currentView model =
    case model.route of
        BrownBagsRoute ->
            Html.map BrownBagMsg (BrownBag.view model.brownBags)

        HangoutsRoute ->
            Hangouts.view model.hangouts

        SecretSantaRoute ->
            SecretSanta.view

        _ ->
            -- Default to showing brownBags for any other message.
            Html.map BrownBagMsg (BrownBag.view model.brownBags)
