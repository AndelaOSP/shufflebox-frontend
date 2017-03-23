module Landing.Home exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Landing.Messages exposing (Msg(..))


view : Html Msg
view =
    div [ class "content" ]
        [ introSection
        , illustration
        ]

introSection : Html Msg
introSection =
    div [ class "intro column is-one-third is-paddingless" ]
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
                , text "the task of selecting Andelans for hangouts,"
                , br [] []
                , text "brown bag and secret santa."
                ]
            , button [ onClick GetStarted, class "btn-rounded" ]
                [ b [] [ text "GET STARTED" ] ]
            ]
        ]


illustration : Html msg
illustration =
    div [ class "illustration column is-two-thirds is-paddingless" ]
        [ div 
            [ class "image is-4by3"]
            [ img
                [ src "https://www.dropbox.com/s/l6wx0xixdfeilso/final.png?raw=1"
                --, width 600
                ]
                []
            ]
        ]
