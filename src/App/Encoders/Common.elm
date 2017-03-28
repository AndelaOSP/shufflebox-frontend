module App.Encoders.Common exposing (..)

import Json.Encode as Encode exposing (object, string)


hangoutsPayload : Encode.Value
hangoutsPayload =
    object <|
        [ ( "type", string "hangouts" ) ]
