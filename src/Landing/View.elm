module Landing.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Landing.Messages exposing (Msg(..))
import String exposing (toLower)


view : Html Msg
view =
    div []
        [ navBar
        , page
        , footer
        ]


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


page : Html Msg
page =
    div [ class "content" ]
        [ div [ class "intro" ]
            [ div [ class "intro-text" ]
                [ h1 []
                    [ text "Goodbye paper"
                    , br [] []
                    , text "hello shufflebox"
                    ]
                , p []
                    [ text "With our new app you will be able to automate"
                    , br [] []
                    , text "the task of selecting fellows for hangouts,"
                    , br [] []
                    , text "brown bag and secret santa."
                    ]
                , button []
                    [ text "Get Started" ]
                ]
            ]
        , div [ class "illustration" ]
            [ img
                [ src "https://www.dropbox.com/s/bo1r6y2i0drv25s/android%201920x1080.jpg?raw=1"
                , width 700
                ]
                []
            ]
        ]


footer : Html Msg
footer =
    Html.footer []
        []
