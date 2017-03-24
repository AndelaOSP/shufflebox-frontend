module App.Decoders.Common exposing (..)

import Json.Decode as Decode exposing (Decoder, string, field, int)


decodeCollection : Decoder a -> Decoder (List a)
decodeCollection decoder =
    Decode.list decoder


decoderFirstField : Decoder a -> String -> Decoder a
decoderFirstField =
    flip field


stringDecoder : String -> Decoder String
stringDecoder =
    decoderFirstField string


intDecoder : String -> Decoder Int
intDecoder =
    decoderFirstField int


baseUrl : String
baseUrl =
    "http://localhost:8000/api"
