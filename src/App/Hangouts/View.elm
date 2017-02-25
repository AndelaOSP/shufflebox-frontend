module App.Hangouts.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import App.Common.Nav exposing (navBar)
import App.Common.SideNav exposing (sideNav)


view : Html msg
view =
    div [ class "container" ]
        [ sideNav
        , div [ class "container--content" ]
            [ navBar
            , text "Hangouts is awesome!!"
            ]
        ]
