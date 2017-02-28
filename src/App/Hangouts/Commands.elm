module App.Hangouts.Commands exposing (..)

import Http
import Json.Decode as Decode exposing (Decoder, succeed, string, int)
import Json.Decode.Extra exposing ((|:))
import App.Decoders.Common exposing (..)
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
        |: (groupsDecoder "groups")


groupsDecoder : String -> Decoder (List Group)
groupsDecoder =
    decoderFirstField (decodeCollection groupDecoder)


groupDecoder : Decoder Group
groupDecoder =
    succeed Group
        |: (stringDecoder "group_id")
        |: (membersDecoder "members")


membersDecoder : String -> Decoder (List Member)
membersDecoder =
    decoderFirstField (decodeCollection memberDecoder)


memberDecoder : Decoder Member
memberDecoder =
    succeed Member
        |: (stringDecoder "user_id")
        |: (stringDecoder "name")
        |: (stringDecoder "email")
        |: (stringDecoder "avatar")
