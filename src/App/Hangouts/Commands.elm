module App.Hangouts.Commands exposing (..)

import Json.Decode as Decode exposing (Decoder, succeed, string, field, int)
import Json.Decode.Extra exposing ((|:))
import App.Decoders.Common exposing (decodeCollection, stringDecoder)
import App.Hangouts.Models exposing (Hangout, Group, Member)


hangoutDecoder : Decoder Hangout
hangoutDecoder =
    succeed Hangout
        |: (field "date" string)
        |: (field "groups" (decodeCollection groupDecoder))


groupDecoder : Decoder Group
groupDecoder =
    succeed Group
        |: (field "group_id" string)
        |: (field "members" (decodeCollection memberDecoder))


memberDecoder : Decoder Member
memberDecoder =
    succeed Member
        |: (field "user_id" string)
        |: (field "name" string)
        |: (field "email" string)
        |: (field "avatar" string)
