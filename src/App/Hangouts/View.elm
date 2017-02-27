module App.Hangouts.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)


view : Html msg
view =
    div [ class "table" ]
        [ table []
            [ tr [] [ th [] [ text "HANGOUTS" ] ]
            , tr [] [ text "table" ]
            , tr [] [ text "table" ]
            , tr [] [ text "table" ]
            ]
        ]
