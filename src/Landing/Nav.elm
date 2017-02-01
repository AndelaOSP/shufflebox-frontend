module Landing.Nav exposing (navBar)


import Html exposing (..)
import Html.Attributes exposing (..)
import Landing.Messages exposing (Msg(..))
import String exposing (toLower)


navBar : Html Msg
navBar =
    div [ class "nav-bar" ]
        [ img
            [ src "https://www.dropbox.com/s/okgmtdpih1xxau3/Shuffle.png?raw=1"
            , width 30, style [("margin-left","90px")]
            ]
            []
        , div []
            [ a [] [ text "SHUFFLEBOX" ]] 
        , nav []
            [ ul []
                (List.map navLink [ "HOME", "ABOUT", "FAQ" ])
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
