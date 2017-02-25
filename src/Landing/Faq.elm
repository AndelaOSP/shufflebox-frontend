module Landing.Faq exposing (view)

import Html exposing (Html, div, text)
import Landing.Messages exposing (Msg(..))


view : Html Msg
view =
    div []
        [ text "faq" ]
