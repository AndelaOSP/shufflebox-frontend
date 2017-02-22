module Common.Nav exposing (navBar)

import Html exposing (..)
import Html.Attributes exposing (..)
import Common.Utils exposing (brandUrl)


navBar : Html msg
navBar =
    nav [ class "container--nav" ]
        [ div [ class "list" ]
            [ ul []
                [ li [] [ a [ href "#brownbags" ] [ text "Brown Bag" ] ]
                , li [] [ a [ href "#secretsanta" ] [ text "Secret Santa" ] ]
                , li [] [ a [ href "#hangouts" ] [ text "Hangouts" ] ]
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
