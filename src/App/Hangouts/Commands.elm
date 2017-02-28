module App.Hangouts.Commands exposing (..)

import Http
import Json.Decode as Decode exposing (Decoder, succeed, string, field, int)
import Json.Decode.Extra exposing ((|:))
import App.Decoders.Common exposing (decodeCollection, stringDecoder, baseUrl)
import App.Hangouts.Messages exposing (Msg(..))
import App.Hangouts.Models exposing (Hangout, Group, Member)


hangoutsUrl : String
hangoutsUrl =
    baseUrl ++ "/hangouts"


getHangouts : Cmd Msg
getHangouts =
    Http.get hangoutsUrl (decodeCollection hangoutDecoder)
        |> Http.send OnFetchHangouts

hangoutDecoder : Decoder Hangout
hangoutDecoder =
    succeed Hangout
        |: (stringDecoder "date")
        |: (field "groups" (decodeCollection groupDecoder))


groupDecoder : Decoder Group
groupDecoder =
    succeed Group
        |: (stringDecoder "group_id")
        |: (field "members" (decodeCollection memberDecoder))


memberDecoder : Decoder Member
memberDecoder =
    succeed Member
        |: (stringDecoder "user_id")
        |: (stringDecoder "name")
        |: (stringDecoder "email")
        |: (stringDecoder "avatar")
