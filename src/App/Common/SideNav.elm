module App.Common.SideNav exposing (sideNav)

import Html exposing (..)
import Html.Attributes exposing (class)


sideNav : Html msg
sideNav =
    div [ class "brownbag--sidebar" ]
        [ div [ class "sidenav" ]
            [ nav [] [ text "What is you next event?" ]
            ]
        ]
