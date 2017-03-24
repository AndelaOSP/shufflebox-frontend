module App.Auth.Commands exposing (..)

import Json.Decode as Decode exposing (succeed, maybe, at)
import Json.Decode.Extra exposing ((|:))
import App.Decoders.Common exposing (stringDecoder, intDecoder, decoderFirstField)
import App.Auth.Models exposing (User, Profile)


userDecoder : Decode.Decoder User
userDecoder =
    succeed User
        |: intDecoder "id"
        |: stringDecoder "username"
        |: stringDecoder "email"
        |: decoderFirstField profileDecoder "profile"


profileDecoder : Decode.Decoder Profile
profileDecoder =
    succeed Profile
        |: stringDecoder "avatar"
        |: maybe (stringDecoder "birth_date")
        |: stringDecoder "bio"
