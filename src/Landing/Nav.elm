module Landing.Nav exposing (navBar)

import Html exposing (..)
import Html.Attributes exposing (..)
import Common.Utils exposing (brandUrl)
import Landing.Messages exposing (Msg(..))
import String exposing (toLower)


navBar : Html Msg
navBar =
    div [ class "nav-bar" ]
        [ img
            [ src brandUrl
            , width 50
            , style [ ( "margin-left", "90px" ) ]
            ]
            []
        , div []
            [ a [ href "#" ] [ text "SHUFFLEBOX" ] ]
        , nav []
            [ ul []
                (List.map navLink [ "HOME", "ABOUT", "FAQ" ])
            ]
        ]


navLink : String -> Html msg
navLink navText =
    let
        linkText =
            if (toLower navText) == "home" then
                "#"
            else
                "#" ++ toLower navText
    in
        li []
            [ a [ href linkText ]
                [ text navText ]
            ]
