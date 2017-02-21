module Hangouts.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Common.Nav exposing (navBar)
import Common.SideNav exposing (sideNav)


view : Html msg
view =
    div [ class "brownbag" ]
        [ sideNav
        , div [ class "brownbag--content" ]
            [ navBar
            , text "Hangouts is awesome!!"
            ]
        ]
