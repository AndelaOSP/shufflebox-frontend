module Landing.Home exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Landing.Messages exposing (Msg(..))
import Landing.Nav exposing (navBar)
import Landing.Footer exposing (pageFooter)


view : Html Msg
view =
    div []
        [ navBar
        , page
        , pageFooter
        ]


page : Html Msg
page =
    div [ class "content" ]
        [ introSection
        , illustration
        ]


introSection : Html msg
introSection =
    div [ class "intro" ]
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
            , button [ class "btn-rounded" ]
                [ text "GET STARTED" ]
            ]
        ]


illustration : Html msg
illustration =
    div [ class "illustration" ]
        [ img
            [ src "https://www.dropbox.com/s/bo1r6y2i0drv25s/android%201920x1080.jpg?raw=1"
            , width 700
            ]
            []
        ]
