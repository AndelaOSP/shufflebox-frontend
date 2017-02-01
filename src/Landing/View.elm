module Landing.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (href)
import Landing.Messages exposing (Msg(..))
import String exposing (toLower)


view : Html Msg
view =
    div []
        [ navBar
        , page
        ]


navBar : Html Msg
navBar =
    div []
        [ nav []
            (List.map navLink [ "Home", "About", "FAQ" ])
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
        a [ href linkText ]
            [ text navText ]
        


page : Html Msg
page =
    div []
        []
