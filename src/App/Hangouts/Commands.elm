module App.Hangouts.Commands exposing (..)

import Http as H
import HttpBuilder exposing (withExpect)
import Json.Decode as Decode exposing (Decoder, succeed, string, int)
import Json.Decode.Extra exposing ((|:))
import Common.Utils.Http as Http
import App.Decoders.Common exposing (..)
import App.Hangouts.Messages exposing (Msg(..))
import App.Hangouts.Models exposing (Hangout, Group, Member)
import App.Auth.Models exposing (Token)


hangoutsUrl : String
hangoutsUrl =
    baseUrl ++ "/hangouts/"


getHangouts : Token -> Cmd Msg
getHangouts =
    HttpBuilder.send OnFetchHangouts
        << withExpect (H.expectJson <| decodeCollection hangoutDecoder)
        << Http.get hangoutsUrl


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
