module Landing.Nav exposing (navBar)


import Html exposing (..)
import Html.Attributes exposing (..)
import Landing.Messages exposing (Msg(..))
import String exposing (toLower)


navBar : Html Msg
navBar =
    div [ class "nav-bar" ]
        [ div []
            [ a [] [ text "SHUFFLEBOX" ] ]
        , nav []
            [ ul []
                (List.map navLink [ "Home", "About", "FAQ" ])
            ]
        ]


navLink : String -> Html msg
navLink navText =
    let
        linkText =
            if navText == "Home" then
                "#"
            else
                "#" ++ toLower navText
    in
        li []
            [ a [ href linkText ]
                [ text navText ]
            ]
