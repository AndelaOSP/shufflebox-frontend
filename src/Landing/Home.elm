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
            , width 300, style [("z-index","0"), ("opacity","0.07"), ("float","left")]
            ]
            []
            ,div [ class "intro-text" ]
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
                [ b [] [ text "GET STARTED" ] ]
            ]
        ]


illustration : Html msg
illustration =
    div [ class "illustration" ]
        [ img
            [ src "https://www.dropbox.com/s/xs2k6d9ie0aq27w/red.png?raw=1"
            , width 600
            ]
            []
        ]
