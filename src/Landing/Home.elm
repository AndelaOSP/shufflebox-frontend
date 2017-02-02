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
        [ img
            [ src "https://www.dropbox.com/s/okgmtdpih1xxau3/Shuffle.png?raw=1"
            , width 500
            ]
            []
        , div [ class "intro-text" ]
            [ span []
                [ text "Goodbye paper"
                , br [] []
                , text "hello shufflebox"
                ]
            , p [ class "sub-intro" ]
                [ text "With our new app you will be able to automate"
                , br [] []
                , text "the task of selecting fellows for hangouts,"
                , br [] []
                , text "brown bag and secret santa."
                ]
            , button [ class "btn-rounded" ]
                [ b [] [ text "GET STARTED" ] ]
            ]
        ]


illustration : Html msg
illustration =
    div [ class "illustration" ]
        [ img
            [ src "https://www.dropbox.com/s/bch5e70hpqsx1wk/nohat.png?raw=1"
            , width 600
            ]
            []
        ]
