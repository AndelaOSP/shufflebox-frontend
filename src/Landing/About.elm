module Landing.About exposing (view)

import Html exposing (Html, div, text)
import Landing.Nav exposing (navBar)
import Landing.Footer exposing (pageFooter)
import Landing.Messages exposing (Msg(..))


view : Html Msg
view =
    div []
        [ navBar
        , aboutPage
        , pageFooter
        ]


aboutPage : Html msg
aboutPage =
    div []
        [ text "about" ]
