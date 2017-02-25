module Common.Util.Events exposing (..)

import Html exposing (Attribute)
import Html.Events exposing (Options, onWithOptions)
import Json.Decode as Json


{- Custom onClick handler to ensure clicking on a link doesn't reload a page.
   Useful for client-side routing links.
-}


onClick : msg -> Attribute msg
onClick message =
    onWithOptions "click" noBubble (Json.succeed message)


noBubble : Options
noBubble =
    { stopPropagation = True
    , preventDefault = True
    }
