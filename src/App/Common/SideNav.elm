module App.Common.SideNav exposing (sideNav)

import Html exposing (..)
import Html.Attributes exposing (class)


sideNav : Html msg
sideNav =
    div [ class "column is-one-third sidenav is-hidden-mobile" ]
        [ div [ class "columns header" ]
            [ div [ class "column is-one-third user-avatar" ] []
            , nav [ class "column is-two-thirds" ]
                [ text "What is your next event?" ]
            ]
        ]
