module App.Hangouts.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)


view : Html msg
view =
    div [ class "table" ]
        [ table []
            [ tr [] [ th [] [ text "HANGOUTS" ] ]
            , tr []
                [ text "James"
                , img
                    [ src "https://api.adorable.io/avatars/285/abott@adorable.io.png"
                    , width 50
                    ]
                    []
                ]
            , tr [] [ text "table" ]
            , tr [] [ text "table" ]
            ]
        ]
