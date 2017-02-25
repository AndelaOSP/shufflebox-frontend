module App.Common.Nav exposing (navBar)

import Html exposing (..)
import Html.Attributes exposing (..)
import Common.Utils exposing (brandUrl)
import Common.Util.Html exposing (link)
import App.Messages exposing (Msg(..))
import Routing.Route exposing (Route(..))


navBar : Html Msg
navBar =
    nav [ class "container--nav" ]
        [ div [ class "list" ]
            [ ul []
                [ li [] [ link ShowBrownBags BrownBagsRoute "Brown Bag" ]
                , li [] [ link ShowSecretSanta SecretSantaRoute "Secret Santa" ]
                , li [] [ link ShowHangouts HangoutsRoute "Hangouts" ]
                ]
            ]
        , div [ class "image" ]
            [ img
                [ src brandUrl
                , width 50
                ]
                []
            ]
        ]
