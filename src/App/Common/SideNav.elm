module App.Common.SideNav exposing (sideNav)

import Html exposing (..)
import Html.Attributes exposing (class)


sideNav : Html msg
sideNav =
    div [ class "column is-one-third sidenav is-hidden-mobile" ]
        [ div [ class "columns header" ]
            [ div [ class "column is-2" ] []
            , nav [ class "column is-10" ]
                [ text "What is your next event?" ]
            ]
        ]
