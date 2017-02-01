module Landing.Footer exposing (pageFooter)

import Html exposing (Html, footer, text)
import Landing.Messages exposing (Msg(..))


pageFooter : Html Msg
pageFooter =
    footer []
        [ text "footer" ]
