module SecretSanta.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Common.Nav exposing (navBar)
import Common.SideNav exposing (sideNav)


view : Html msg
view =
    div [ class "container" ]
        [ sideNav
        , div [ class "container--content" ]
            [ navBar
            , text "SecretSanta rocks!!"
            ]
        ]
